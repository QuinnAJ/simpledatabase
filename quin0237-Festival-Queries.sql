-- Filename: quin0237-Festival-Queries.sql
-- Author: Anthony Quinn
-- Date: 2017-03-24
-- Description: Queries for Festival Database, Assign 2

--Select statements to view each table
SELECT * FROM Location_T;
SELECT * FROM Prize_T;
SELECT * FROM Activity_T;
SELECT * FROM Employee_T;
SELECT * FROM Volunteer_T;
SELECT * FROM ActivityPrize_T;

--This command shows the metadata
SELECT * FROM information_schema.columns 
WHERE TABLE_NAME = 'location_t'
OR TABLE_NAME = 'prize_t'
OR TABLE_NAME = 'activity_t'
OR TABLE_NAME = 'employee_t'
OR TABLE_NAME = 'volunteer_t'
OR TABLE_NAME = 'activityprize_t';

--This shows the names of employees with a salary above $50,000
SELECT CONCAT(f_name, l_name) AS "Name" FROM Employee_T
WHERE salary > 50000;

--This shows which activities are paid
SELECT name FROM Activity_T
WHERE cost IS NOT NULL;

--This shows locations where the expected number of people is nearing the capacity of the tent
SELECT tent_letter FROM Location_T
WHERE expected_people > (capacity-50);

-- This left join shows all tents and activities that are occuring within them
-- This could be used to easilly see where various events are, as well as where more may be placed within the future
SELECT tent_letter, name FROM Activity_T
RIGHT OUTER JOIN Location_T
ON Activity_T.location = Location_T.tent_letter;


-- This left outer join gives a list of employees and which volunteers are working for them, as well as employees with no current volunteers
-- This could be used to easilly identify who the volunteers are reporting to, as well as which employees could use more volunteers
SELECT Employee_T.ID, Employee_T.f_name, Employee_T.l_name, Volunteer_T.ID, Volunteer_T.f_name, Volunteer_T.l_name FROM Employee_T
--SELECT * FROM Employee_T
LEFT OUTER JOIN Volunteer_T
ON Employee_T.ID = Volunteer_T.supervisor_ID
ORDER BY Employee_T.ID;

--SELECT * FROM _T


-- This union gives a complete list of all festival staff, ordered by ID
SELECT ID, l_name, f_name FROM Volunteer_T
UNION 
SELECT ID,l_name, f_name FROM Employee_T
ORDER BY ID;


/*SELECT name, cost FROM activity_T
WHERE cost IS NOT NULL
AND*/

-- This shows the locations of activities in which more than 100 people are expected, so highly active areas may be identified
SELECT name FROM Activity_T
WHERE EXISTS (SELECT expected_people FROM Location_T WHERE location = Location_T.tent_letter AND expected_people > 100);

-- This shows all activities that are run by managers, not just regular employees, so managers may be found easilly 
SELECT name FROM Activity_T
WHERE EXISTS (SELECT ID FROM Employee_T WHERE activity_ID = Activity_T.ID AND ID LIKE 'MAN%');

-- Test views
SELECT * FROM Activities_V;
SELECT * FROM HaveVolunteers_V;

--eof: quin0237-Festival-Queries.sql