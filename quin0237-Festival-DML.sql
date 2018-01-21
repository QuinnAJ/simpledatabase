-- Filename: quin0237-Festival-DML.sql
-- Author: Anthony Quinn
-- Date: 2017-03-24
-- Description: DML for Festival database, Adds new data, deletes existing

DELETE FROM ActivityPrize_T;
DELETE FROM Volunteer_T;
DELETE FROM Employee_T;
DELETE FROM Activity_T;
DELETE FROM Location_T;
DELETE FROM Prize_T;


INSERT INTO Location_T(tent_letter, length, width, capacity, expected_people) VALUES ('A', 10, 15, 150, 100);
INSERT INTO Location_T(tent_letter, length, width, capacity, expected_people) VALUES ('B', 20, 45, 250, 200);
INSERT INTO Location_T(tent_letter, length, width, capacity, expected_people) VALUES ('C', 30, 5, 100, 100);
INSERT INTO Location_T(tent_letter, length, width, capacity, expected_people) VALUES ('D', 10, 25, 200, 150);
INSERT INTO Location_T(tent_letter, length, width, capacity, expected_people) VALUES ('E', 50, 35, 150, 125);

INSERT INTO Prize_T(name, cost, description, quantity, ID) VALUES ('Bear', 12.99, 'Stuffed bear plushie, blue', 7, 'AAA1');
INSERT INTO Prize_T(name, cost, quantity, ID) VALUES ('Cotton Candy', 3.99, 86, 'AAA2');
INSERT INTO Prize_T(name, description, quantity, ID) VALUES ('Trophy', 'Trophy to show the top player of a game', 11, 'AAA3');
INSERT INTO Prize_T(name, cost, description, quantity, ID) VALUES ('Mystery Box', 10, 'Box with a surprise inside', 3, 'AAA4');
INSERT INTO Prize_T(name, cost, quantity, ID) VALUES ('Hot Dog', 1.99, 154, 'AAA5');

INSERT INTO Activity_T(name, description, cost, ID, location) VALUES ('Ring Toss', 'Toss rings over bottles to win prizes', 1, 'GAM1', 'A');
INSERT INTO Activity_T(name, cost, ID, location) VALUES ('Face Painting', 0.5, 'ACT1', 'A');
INSERT INTO Activity_T(name, description, ID, location) VALUES ('Snack Stand', 'Sells various drinks and foods', 'ACT2', 'B');
INSERT INTO Activity_T(name, ID, location) VALUES ('Bathrooms', 'ACT3', 'C');
INSERT INTO Activity_T(name, description, cost, ID, location) VALUES ('Funhouse', 'Slightly scary, bizzare tent', 3, 'GAM2', 'D');

INSERT INTO Employee_T(ID, f_name, l_name, position_title, salary, activity_ID) VALUES ('EXE100', 'John', 'Johnson', 'CEO', 120000, 'ACT2');
INSERT INTO Employee_T(ID, manager_ID, f_name, l_name, position_title, salary, activity_ID) VALUES ('MAN234', 'EXE100','Fred', 'Fredson', 'Payroll Supervisor', 60000, 'GAM2');
INSERT INTO Employee_T(ID, manager_ID, f_name, l_name, position_title, salary, activity_ID) VALUES ('EMP142', 'MAN234', 'Rob', 'Robinson', 'Accountant', 45000, 'GAM1');
INSERT INTO Employee_T(ID, manager_ID, f_name, l_name, position_title, salary, activity_ID) VALUES ('EMP153', 'MAN234', 'Jane', 'Janeson', 'Payroll', 50000, 'ACT1');
INSERT INTO Employee_T(ID, manager_ID, f_name, l_name, position_title, salary, activity_ID) VALUES ('MAN157', 'EXE100', 'Laura', 'Laurason', 'Event Planning', 60000, 'ACT2');
INSERT INTO Employee_T(ID, manager_ID, f_name, l_name, position_title, salary, activity_ID) VALUES ('EMP112', 'MAN157', 'George', 'Georgeson', 'Reception', 40000, 'ACT1');

INSERT INTO Volunteer_T(supervisor_ID, f_name, l_name, ID, hours, activity_ID) VALUES ('EMP112', 'Ron', 'Ronson', 'VOL101', 14, 'ACT1');
INSERT INTO Volunteer_T(supervisor_ID, f_name, l_name, ID, hours, activity_ID) VALUES ('EXE100', 'Beth', 'Bethson', 'VOL102', 35, 'ACT2');
INSERT INTO Volunteer_T(supervisor_ID, f_name, l_name, ID, hours, activity_ID) VALUES ('MAN157', 'Ruth', 'Ruthson', 'VOL103', 8, 'GAM1');
INSERT INTO Volunteer_T(supervisor_ID, f_name, l_name, ID, hours, activity_ID) VALUES ('EMP153', 'Jack', 'Jackson', 'VOL104', 19, 'GAM2');
INSERT INTO Volunteer_T(supervisor_ID, f_name, l_name, ID, hours, activity_ID) VALUES ('EMP112', 'Bob', 'Bobson', 'VOL105', 16, 'ACT2');
INSERT INTO Volunteer_T(supervisor_ID, f_name, l_name, ID, hours) VALUES ('MAN234', 'Steve', 'Steveson', 'VOL106', 7);


INSERT INTO ActivityPrize_T(activityID, prizeID) VALUES ('GAM1', 'AAA1');
INSERT INTO ActivityPrize_T(activityID, prizeID) VALUES ('GAM1', 'AAA3');
INSERT INTO ActivityPrize_T(activityID, prizeID) VALUES ('GAM1', 'AAA4');
INSERT INTO ActivityPrize_T(activityID, prizeID) VALUES ('ACT2', 'AAA2');
INSERT INTO ActivityPrize_T(activityID, prizeID) VALUES ('GAM1', 'AAA5');
INSERT INTO ActivityPrize_T(activityID, prizeID) VALUES ('GAM2', 'AAA4');

--eof: quin0237-Festival-DML.sql