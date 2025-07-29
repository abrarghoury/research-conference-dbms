--1. List research projects with total student hours/week > 20

SELECT p.Project_ID, p.Project_Title,
       SUM(pr.Hour_Per_Week) AS Total_Student_Hours
FROM Person_Project_Role pr
JOIN Person pe ON pr.Person_ID = pe.Person_ID
JOIN Project p ON pr.Project_ID = p.Project_ID
WHERE pe.Person_Type = 'Student'
GROUP BY p.Project_ID, p.Project_Title
HAVING SUM(pr.Hour_Per_Week) > 20;

--2. Top 3 most published faculty in the last 5 years

SELECT pe.Person_ID, pe.Person_Name,
       COUNT(DISTINCT pa.Publication_ID) AS Total_Publications
FROM Publication_Authorship pa
JOIN Person pe ON pa.Person_ID = pe.Person_ID
JOIN Publication pub ON pa.Publication_ID = pub.Publication_ID
WHERE pe.Person_Type = 'Faculty'
  AND pub.Publication_Year >= EXTRACT(YEAR FROM SYSDATE) - 5
GROUP BY pe.Person_ID, pe.Person_Name
ORDER BY Total_Publications DESC
FETCH FIRST 3 ROWS ONLY;

--3. Students who have published and attended conferences

SELECT DISTINCT s.Person_ID, s.Person_Name
FROM Person s
WHERE s.Person_Type = 'Student'
  AND s.Person_ID IN (SELECT Person_ID FROM Publication_Authorship)
  AND s.Person_ID IN (SELECT Person_ID FROM Conference_Participation);

--4. Total funding handled by each faculty

--(A faculty handles a project if they are supervisor in Person_Project_Role or Project_Lead.)
SELECT f.Person_ID, f.Person_Name,
       SUM(p.Funding_Amount) AS Total_Funding
FROM Person f
JOIN Project_Lead pl ON f.Person_ID = pl.Project_Lead_ID
JOIN Project p ON pl.Project_ID = p.Project_ID
WHERE f.Person_Type = 'Faculty'
GROUP BY f.Person_ID, f.Person_Name;

--5. Conferences where no CS department member attended

SELECT c.Conference_ID, c.Conference_Name
FROM Conference c
WHERE c.Conference_ID NOT IN (
    SELECT DISTINCT cp.Conference_ID
    FROM Conference_Participation cp
    JOIN Person pe ON cp.Person_ID = pe.Person_ID
    WHERE pe.Department = 'CS Dept'
);

--6. List of Students involved in at least 1 project 

SELECT s.Person_ID, s.Person_Name, COUNT(DISTINCT pr.Project_ID) AS Project_Count
FROM Person s
JOIN Person_Project_Role pr ON s.Person_ID = pr.Person_ID
WHERE s.Person_Type = 'Student'
GROUP BY s.Person_ID, s.Person_Name
HAVING COUNT(DISTINCT pr.Project_ID) >= 1;



--7. Publications that have Publications that have more than one author

SELECT pub.Publication_ID, pub.Publication_Title,
       COUNT(DISTINCT pa.Person_ID) AS Author_Count
FROM Publication pub
JOIN Publication_Authorship pa ON pub.Publication_ID = pa.Publication_ID
GROUP BY pub.Publication_ID, pub.Publication_Title
HAVING COUNT(DISTINCT pa.Person_ID) > 1;


--8. Conferences where students presented

SELECT DISTINCT c.Conference_ID, c.Conference_Name, p.Person_Name AS Student_Name
FROM Conference c
JOIN Conference_Participation cp ON c.Conference_ID = cp.Conference_ID
JOIN Person p ON cp.Person_ID = p.Person_ID
WHERE p.Person_Type = 'Student'
  AND cp.Role_ID = 'R001';  

--9. List faculty who have supervised at least one student

SELECT DISTINCT f.Person_ID, f.Person_Name
FROM Person f
JOIN Supervision s ON f.Person_ID = s.Supervisor_ID
WHERE f.Person_Type = 'Faculty';

--10. Find the total number of conferences each department participated in during the last 3 years

SELECT pe.Department,
       COUNT(DISTINCT c.Conference_ID) AS Total_Conferences
FROM Conference c
JOIN Conference_Participation cp ON c.Conference_ID = cp.Conference_ID
JOIN Person pe ON cp.Person_ID = pe.Person_ID
WHERE EXTRACT(YEAR FROM c.Conference_Date) >= EXTRACT(YEAR FROM SYSDATE) - 3
GROUP BY pe.Department;



