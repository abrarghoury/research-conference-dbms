--Trigger 1: Limit student to max 2 active projects

CREATE OR REPLACE TRIGGER trg_limit_active_projects
BEFORE INSERT OR UPDATE ON Person_Project_Role
FOR EACH ROW
DECLARE
    v_type   Person.Person_Type%TYPE;
    v_count  NUMBER;
BEGIN
    -- Get the Person_Type for the new Person_ID
    SELECT Person_Type
    INTO v_type
    FROM Person
    WHERE Person_ID = :NEW.Person_ID;

    -- Only check if the person is a Student
    IF v_type = 'Student' THEN
        SELECT COUNT(*)
        INTO v_count
        FROM Person_Project_Role pr, Project p
        WHERE pr.Project_ID = p.Project_ID
          AND pr.Person_ID = :NEW.Person_ID
          AND p.Project_End_Date >= SYSDATE;

        IF v_count >= 2 THEN
            RAISE_APPLICATION_ERROR(-20001,
              'A student cannot be involved in more than two active projects at the same time.');
        END IF;
    END IF;
END;

--Trigger 2: Every publication must have at least one faculty author

CREATE OR REPLACE TRIGGER trg_publication_faculty_check
AFTER INSERT OR DELETE ON Publication_Authorship
FOR EACH ROW
DECLARE
    v_count NUMBER;
    v_pub_id VARCHAR2(10);
BEGIN
    -- Determine publication id depending on insert or delete
    IF INSERTING THEN
        v_pub_id := :NEW.Publication_ID;
    ELSE
        v_pub_id := :OLD.Publication_ID;
    END IF;

    -- Count faculty authors for this publication
    SELECT COUNT(*)
    INTO v_count
    FROM Publication_Authorship pa, Person pe
    WHERE pa.Person_ID = pe.Person_ID
      AND pa.Publication_ID = v_pub_id
      AND pe.Person_Type = 'Faculty';

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20002,
          'Each publication must have at least one faculty author.');
    END IF;
END;

--Trigger 3: Conference cannot be marked as Active unless at least one participant is linked

CREATE OR REPLACE TRIGGER trg_active_conf_participants
BEFORE INSERT OR UPDATE ON Conference
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    IF :NEW.Conference_Status = 'Active' THEN
        SELECT COUNT(*)
        INTO v_count
        FROM Conference_Participation
        WHERE Conference_ID = :NEW.Conference_ID;

        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20003,
              'Conference cannot be marked as Active unless at least one participant is linked.');
        END IF;
    END IF;
END;

--Trigger 4: Person can only be either Student or Faculty (disjoint specialization)

CREATE OR REPLACE TRIGGER trg_disjoint_specialization
BEFORE INSERT OR UPDATE ON Person
FOR EACH ROW
BEGIN
    IF :NEW.Person_Type = 'Student' THEN
        -- Student ke liye Area_ID aur Department NULL honi chahiye
        IF :NEW.Area_ID IS NOT NULL OR :NEW.Department IS NOT NULL THEN
            RAISE_APPLICATION_ERROR(-20004,
              'A student cannot have Department or Area assigned.');
        END IF;
    ELSIF :NEW.Person_Type = 'Faculty' THEN
        -- Faculty ke liye Program aur Year NULL hone chahiye
        IF :NEW.Program IS NOT NULL OR :NEW.Year IS NOT NULL THEN
            RAISE_APPLICATION_ERROR(-20005,
              'A faculty member cannot have Program or Year.');
        END IF;
    END IF;
END;



