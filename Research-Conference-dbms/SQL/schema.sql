                                    -- ========================================================= --
                                        --  RESEARCH & CONFERENCE MANAGEMENT SYSTEM - SCHEMA --
                                    -- ========================================================= --

-- 1. Area
CREATE TABLE Area (
    Area_ID VARCHAR2(10) PRIMARY KEY,
    Area_Name VARCHAR2(100) NOT NULL
);

-- 2. Person
CREATE TABLE Person (
    Person_ID VARCHAR2(10) PRIMARY KEY,
    Person_Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) UNIQUE,
    Program VARCHAR2(50),
    Year VARCHAR2(20),
    Department VARCHAR2(100),
    Area_ID VARCHAR2(10),
    Person_Type VARCHAR2(20) NOT NULL CHECK (Person_Type IN ('Student','Faculty')),
    CONSTRAINT fk_person_area FOREIGN KEY (Area_ID) REFERENCES Area(Area_ID)
);

-- 3. Person_Phone
CREATE TABLE Person_Phone (
    Person_Phone_ID VARCHAR2(10) PRIMARY KEY,
    Person_ID VARCHAR2(10) NOT NULL,
    Phone VARCHAR2(20) NOT NULL,
    CONSTRAINT fk_phone_person FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID)
);

-- 4. Project
CREATE TABLE Project (
    Project_ID VARCHAR2(10) PRIMARY KEY,
    Project_Title VARCHAR2(200) NOT NULL,
    Project_Objective VARCHAR2(500),
    Project_Start_Date DATE NOT NULL,
    Project_End_Date DATE,
    Funding_Amount NUMBER(12,2)
);

-- 5. Project_Funding
CREATE TABLE Project_Funding (
    Project_Funding_ID VARCHAR2(10) PRIMARY KEY,
    Project_ID VARCHAR2(10) NOT NULL,
    Funding_Body VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_funding_project FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID)
);

-- 6. Person_Project_Role
CREATE TABLE Person_Project_Role (
    Project_Involvement_ID VARCHAR2(10) PRIMARY KEY,
    Person_ID VARCHAR2(10) NOT NULL,
    Project_ID VARCHAR2(10) NOT NULL,
    Project_Role VARCHAR2(100),
    Hour_Per_Week NUMBER,
    CONSTRAINT fk_role_person FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
    CONSTRAINT fk_role_project FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID)
    -- Business rule: max 2 active projects per student → needs trigger
);

-- 7. Project_Lead
CREATE TABLE Project_Lead (
    Leads_Project_ID VARCHAR2(10) PRIMARY KEY,
    Project_ID VARCHAR2(10) NOT NULL UNIQUE,
    Project_Lead_ID VARCHAR2(10) NOT NULL,
    CONSTRAINT fk_lead_project FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID),
    CONSTRAINT fk_lead_person FOREIGN KEY (Project_Lead_ID) REFERENCES Person(Person_ID)
);

-- 8. Publisher
CREATE TABLE Publisher (
    Publisher_ID VARCHAR2(10) PRIMARY KEY,
    Publisher_Name VARCHAR2(100) NOT NULL
);

-- 9. Publication  
CREATE TABLE Publication (
    Publication_ID VARCHAR2(10) PRIMARY KEY,
    Publication_Title VARCHAR2(200) NOT NULL,
    Publication_Type VARCHAR2(50),
    Publication_Year NUMBER(4),
    Publisher_ID VARCHAR2(10) NOT NULL,
    DOI VARCHAR2(100),
    CONSTRAINT fk_pub_publisher FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID)
);

-- 10. Publication_Authorship 
CREATE TABLE Publication_Authorship (
    Authorship_ID VARCHAR2(10) PRIMARY KEY,
    Publication_ID VARCHAR2(10) NOT NULL,
    Person_ID VARCHAR2(10) NOT NULL,
    Author_Order NUMBER NOT NULL,
    CONSTRAINT fk_authorship_pub FOREIGN KEY (Publication_ID) REFERENCES Publication(Publication_ID),
    CONSTRAINT fk_authorship_person FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID)
    -- Business rule: preserve author order → application/trigger
);

-- 11. Conference
CREATE TABLE Conference (
    Conference_ID VARCHAR2(10) PRIMARY KEY,
    Conference_Name VARCHAR2(200) NOT NULL,
    Conference_Type VARCHAR2(50),
    Conference_Date DATE NOT NULL,
    Conference_Location VARCHAR2(100),
    Conference_Status VARCHAR2(20) CHECK (Conference_Status IN ('Active','Upcoming','Completed'))
    -- Business rule: Active must have participant → trigger
);

-- 12. Role
CREATE TABLE Role (
    Role_ID VARCHAR2(10) PRIMARY KEY,
    Role_Name VARCHAR2(100) NOT NULL
);

-- 13. Conference_Participation
CREATE TABLE Conference_Participation (
    Participation_ID VARCHAR2(10) PRIMARY KEY,
    Person_ID VARCHAR2(10) NOT NULL,
    Conference_ID VARCHAR2(10) NOT NULL,
    Role_ID VARCHAR2(10) NOT NULL,
    CONSTRAINT fk_part_person FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
    CONSTRAINT fk_part_conf FOREIGN KEY (Conference_ID) REFERENCES Conference(Conference_ID),
    CONSTRAINT fk_part_role FOREIGN KEY (Role_ID) REFERENCES Role(Role_ID)
);

-- 14. Supervision
CREATE TABLE Supervision (
    Supervision_ID VARCHAR2(10) PRIMARY KEY,
    Supervisor_ID VARCHAR2(10) NOT NULL,
    Student_ID VARCHAR2(10) NOT NULL,
    CONSTRAINT fk_sup_supervisor FOREIGN KEY (Supervisor_ID) REFERENCES Person(Person_ID),
    CONSTRAINT fk_sup_student FOREIGN KEY (Student_ID) REFERENCES Person(Person_ID)
);
