                                                   -- ===================================================== --
                                                        -- INSERT DATA FOR RESEARCH & CONFERENCE DBMS --
                                                   -- ===================================================== --

-- 1. Area
INSERT INTO Area (Area_ID, Area_Name) VALUES ('A001', 'Machine Learning');
INSERT INTO Area (Area_ID, Area_Name) VALUES ('A002', 'Cloud Computing');
INSERT INTO Area (Area_ID, Area_Name) VALUES ('A003', 'Software Architecture');

-- 2. Person
INSERT INTO Person (Person_ID, Person_Name, Email, Program, Year, Department, Area_ID, Person_Type)
VALUES ('P001','Ali Raza','ali@gmail.com','BSCS','3rd',NULL,NULL,'Student');
INSERT INTO Person (Person_ID, Person_Name, Email, Program, Year, Department, Area_ID, Person_Type)
VALUES ('P002','Sara Khan','sara@yahoo.com','BSE','2nd',NULL,NULL,'Student');
INSERT INTO Person (Person_ID, Person_Name, Email, Program, Year, Department, Area_ID, Person_Type)
VALUES ('P003','Usman Ali','usman@uni.edu.pk','BSIT','4th',NULL,NULL,'Student');
INSERT INTO Person (Person_ID, Person_Name, Email, Program, Year, Department, Area_ID, Person_Type)
VALUES ('P004','Dr. Amna Tariq','amna@faculty.edu',NULL,NULL,'CS Dept','A001','Faculty');
INSERT INTO Person (Person_ID, Person_Name, Email, Program, Year, Department, Area_ID, Person_Type)
VALUES ('P005','Bilal Ahmed','bilal@student.com','BSCS','1st',NULL,NULL,'Student');
INSERT INTO Person (Person_ID, Person_Name, Email, Program, Year, Department, Area_ID, Person_Type)
VALUES ('P006','Dr. Zeeshan Ali','zeeshan@uni.edu.pk',NULL,NULL,'IT Dept','A002','Faculty');
INSERT INTO Person (Person_ID, Person_Name, Email, Program, Year, Department, Area_ID, Person_Type)
VALUES ('P007','Dr. Nadia Kamal','nadia@faculty.pk',NULL,NULL,'SE Dept','A003','Faculty');

-- 3. Person_Phone
INSERT INTO Person_Phone VALUES ('PH001','P001','3211234567');
INSERT INTO Person_Phone VALUES ('PH002','P001','3011223344');
INSERT INTO Person_Phone VALUES ('PH003','P002','3112223344');
INSERT INTO Person_Phone VALUES ('PH004','P003','3442345678');
INSERT INTO Person_Phone VALUES ('PH005','P003','3007894512');
INSERT INTO Person_Phone VALUES ('PH006','P004','3214567890');
INSERT INTO Person_Phone VALUES ('PH007','P005','3001112222');
INSERT INTO Person_Phone VALUES ('PH008','P006','3228889999');
INSERT INTO Person_Phone VALUES ('PH009','P007','3334445555');

-- 4. Project
INSERT INTO Project VALUES ('PR01','AI in Healthcare','Using ML for diagnostics',TO_DATE('01/01/2023','DD/MM/YYYY'),TO_DATE('01/06/2023','DD/MM/YYYY'),500000);
INSERT INTO Project VALUES ('PR02','Secure IoT','Enhancing IoT security',TO_DATE('01/03/2023','DD/MM/YYYY'),TO_DATE('01/09/2023','DD/MM/YYYY'),300000);
INSERT INTO Project VALUES ('PR03','Smart Agriculture','AI for crop yield prediction',TO_DATE('01/02/2023','DD/MM/YYYY'),TO_DATE('01/08/2023','DD/MM/YYYY'),700000);
INSERT INTO Project VALUES ('PR04','Distributed Systems','Secure data across nodes',TO_DATE('02/01/2023','DD/MM/YYYY'),TO_DATE('02/07/2023','DD/MM/YYYY'),600000);
INSERT INTO Project VALUES ('PR05','Microservices Design','Optimizing Microservice Arch',TO_DATE('01/04/2023','DD/MM/YYYY'),TO_DATE('01/10/2023','DD/MM/YYYY'),450000);

-- 5. Project_Funding
INSERT INTO Project_Funding VALUES ('PF001','PR01','HEC');
INSERT INTO Project_Funding VALUES ('PF002','PR01','Ignite');
INSERT INTO Project_Funding VALUES ('PF003','PR02','Ignite');
INSERT INTO Project_Funding VALUES ('PF004','PR03','PARC');
INSERT INTO Project_Funding VALUES ('PF005','PR03','Ignite');
INSERT INTO Project_Funding VALUES ('PF006','PR04','HEC');
INSERT INTO Project_Funding VALUES ('PF007','PR05','Ignite');

-- 6. Person_Project_Role
INSERT INTO Person_Project_Role VALUES ('PI001','P001','PR01','Researcher',10);
INSERT INTO Person_Project_Role VALUES ('PI002','P003','PR01','Developer',6);
INSERT INTO Person_Project_Role VALUES ('PI003','P002','PR02','Assistant',8);
INSERT INTO Person_Project_Role VALUES ('PI004','P002','PR02','Researcher',8);
INSERT INTO Person_Project_Role VALUES ('PI005','P005','PR02','Intern',5);
INSERT INTO Person_Project_Role VALUES ('PI006','P004','PR03','Supervisor',NULL);
INSERT INTO Person_Project_Role VALUES ('PI007','P006','PR04','Supervisor',NULL);
INSERT INTO Person_Project_Role VALUES ('PI008','P007','PR05','Lead',NULL);

-- 7. Project_Lead
INSERT INTO Project_Lead VALUES ('LP001','PR01','P001');
INSERT INTO Project_Lead VALUES ('LP002','PR02','P002');
INSERT INTO Project_Lead VALUES ('LP003','PR03','P004');
INSERT INTO Project_Lead VALUES ('LP004','PR04','P006');
INSERT INTO Project_Lead VALUES ('LP005','PR05','P007');

-- 8. Publisher
INSERT INTO Publisher VALUES ('PUB001','IEEE');
INSERT INTO Publisher VALUES ('PUB002','Elsevier');
INSERT INTO Publisher VALUES ('PUB003','ACM');
INSERT INTO Publisher VALUES ('PUB004','Springer');

-- 9. Publication
-- Note: Publication_ID must be unique, duplicates are not allowed.
-- The second row (PUB001, PUB002) with same PUB001 will conflict, so adjust ID if needed:
INSERT INTO Publication VALUES ('PUB001','ML for Beginners','Journal',2023,'PUB001','10.1109/xyz1');
INSERT INTO Publication VALUES ('PUB007','ML for Beginners','Journal',2023,'PUB002','10.1109/xyz1');
INSERT INTO Publication VALUES ('PUB002','IoT Security Review','Conference',2023,'PUB003','10.1145/abc2');
INSERT INTO Publication VALUES ('PUB003','AgriTech Innovations','Book Chapter',2024,'PUB004','10.1007/agri3');
INSERT INTO Publication VALUES ('PUB004','Intro to Embedded Sec.','Conference',2023,'PUB003','10.1145/emb4');
INSERT INTO Publication VALUES ('PUB005','Secure Clouds','Journal',2023,'PUB001','10.1109/cloud5');
INSERT INTO Publication VALUES ('PUB006','Designing Microservices','Book Chapter',2024,'PUB004','10.1007/msarch');

-- 10. Publication_Authorship
INSERT INTO Publication_Authorship VALUES ('AU001','PUB001','P001',1);
INSERT INTO Publication_Authorship VALUES ('AU002','PUB001','P001',2);
INSERT INTO Publication_Authorship VALUES ('AU003','PUB001','P003',3);
INSERT INTO Publication_Authorship VALUES ('AU004','PUB002','P002',2);
INSERT INTO Publication_Authorship VALUES ('AU005','PUB003','P004',1);
INSERT INTO Publication_Authorship VALUES ('AU006','PUB004','P005',2);
INSERT INTO Publication_Authorship VALUES ('AU007','PUB005','P006',1);
INSERT INTO Publication_Authorship VALUES ('AU008','PUB006','P007',1);

-- 11. Conference
INSERT INTO Conference VALUES ('CONF001','Int. Conf. on AI','International',TO_DATE('01/05/2023','DD/MM/YYYY'),'Karachi','Active');
INSERT INTO Conference VALUES ('CONF002','National IoT Summit','National',TO_DATE('15/07/2023','DD/MM/YYYY'),'Lahore','Active');
INSERT INTO Conference VALUES ('CONF003','AgriTech Meet','Regional',TO_DATE('12/02/2024','DD/MM/YYYY'),'Islamabad','Upcoming');
INSERT INTO Conference VALUES ('CONF004','CloudConf','International',TO_DATE('03/03/2023','DD/MM/YYYY'),'Lahore','Active');
INSERT INTO Conference VALUES ('CONF005','SE Symposium','National',TO_DATE('20/04/2024','DD/MM/YYYY'),'Islamabad','Upcoming');

-- 12. Role
INSERT INTO Role VALUES ('R001','Presenter');
INSERT INTO Role VALUES ('R002','Organizer');
INSERT INTO Role VALUES ('R003','Attendee');
INSERT INTO Role VALUES ('R004','Keynote Speaker');
INSERT INTO Role VALUES ('R005','Session Chair');
INSERT INTO Role VALUES ('R006','Speaker');

-- 13. Conference_Participation
INSERT INTO Conference_Participation VALUES ('PT001','P001','CONF001','R001');
INSERT INTO Conference_Participation VALUES ('PT002','P001','CONF001','R002');
INSERT INTO Conference_Participation VALUES ('PT003','P002','CONF002','R001');
INSERT INTO Conference_Participation VALUES ('PT004','P003','CONF001','R003');
INSERT INTO Conference_Participation VALUES ('PT005','P005','CONF002','R003');
INSERT INTO Conference_Participation VALUES ('PT006','P005','CONF002','R002');
INSERT INTO Conference_Participation VALUES ('PT007','P004','CONF003','R004');
INSERT INTO Conference_Participation VALUES ('PT008','P006','CONF004','R005');
INSERT INTO Conference_Participation VALUES ('PT009','P007','CONF005','R006');

-- 14. Supervision
INSERT INTO Supervision VALUES ('SP001','P004','P001');
INSERT INTO Supervision VALUES ('SP002','P004','P002');
INSERT INTO Supervision VALUES ('SP003','P004','P003');
INSERT INTO Supervision VALUES ('SP004','P004','P005');
