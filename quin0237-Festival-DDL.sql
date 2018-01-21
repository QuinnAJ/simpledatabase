-- Filename: quin0237-Festival-DDL.sql
-- Author: Anthony Quinn
-- Date: 2017-03-24
-- Description: DDL for Festival database, Drops existing tables and creates the tables for the database

DROP VIEW IF EXISTS Activities_V;
DROP VIEW IF EXISTS HaveVolunteers_V;
DROP INDEX IF EXISTS Employees_IDX;
DROP INDEX IF EXISTS Volunteers_IDX;

DROP TABLE IF EXISTS ActivityPrize_T;
DROP TABLE IF EXISTS Volunteer_T;
DROP TABLE IF EXISTS Employee_T;
DROP TABLE IF EXISTS Activity_T;
DROP TABLE IF EXISTS Prize_T;
DROP TABLE IF EXISTS Location_T;



CREATE TABLE Location_T(
  tent_letter char(1),
  length int,
  width int,
  capacity int Not Null,
  expected_people int Not Null,
  CONSTRAINT PK_letter PRIMARY KEY (tent_letter)
);

CREATE TABLE Prize_T(
  name varchar(20) Not Null,
  cost numeric(4,2),
  description varchar(50),
  quantity int Not Null,
  ID char(4),
  CONSTRAINT PK_pri_ID PRIMARY KEY (ID)
);

CREATE TABLE Activity_T(
  name varchar(30) Not Null,
  description varchar(50),
  cost numeric(3,2),
  ID char(4),
  location char(1) Not Null,
  CONSTRAINT PK_act_ID PRIMARY KEY (ID),
  CONSTRAINT FK_loc_ID FOREIGN KEY (location) REFERENCES Location_T (tent_letter)
);


CREATE TABLE Employee_T(
  ID char(6),
  manager_ID char(6),
  f_name varchar(20) Not Null,
  l_name varchar(20) Not Null,
  position_title varchar(30) Not Null,
  salary numeric(8,2) Not Null,
  activity_ID char(4) Not Null,
  CONSTRAINT PK_emp_ID PRIMARY KEY( ID ),
  CONSTRAINT FK_man_ID FOREIGN KEY (manager_ID) REFERENCES Employee_T(ID),
  CONSTRAINT FK_activity_ID FOREIGN KEY (activity_ID) REFERENCES Activity_T(ID)
);


CREATE TABLE Volunteer_T(
  supervisor_ID char(6) Not Null,
  f_name varchar(20) Not Null,
  l_name varchar(20) Not Null,
  ID varchar(6),
  hours int,
  activity_ID char(4),
  CONSTRAINT PK_vol_ID PRIMARY KEY (ID),
  CONSTRAINT FK_sup_ID FOREIGN KEY (supervisor_ID) REFERENCES Employee_T (ID),
  CONSTRAINT FK_act_ID FOREIGN KEY (activity_ID) REFERENCES Activity_T (ID)
);

CREATE TABLE ActivityPrize_T(
  activityID char(4),
  prizeID char(4),
  CONSTRAINT PK_actpri PRIMARY KEY (activityID, prizeID),
  CONSTRAINT FK_actp_ID FOREIGN KEY (activityID) REFERENCES Activity_T (ID),
  CONSTRAINT FK_pria_ID FOREIGN KEY (prizeID) REFERENCES Prize_T (ID)
);

-- This view shows a list of all activities and locations
CREATE VIEW Activities_V AS
SELECT name, location FROM Activity_T;

-- This gives a list of all employees with volunteers currently reporting to them
CREATE VIEW HaveVolunteers_V AS
SELECT ID, l_name, f_name FROM Employee_T
WHERE EXISTS (SELECT ID FROM Volunteer_T WHERE Volunteer_T.supervisor_ID = Employee_T.ID);


--Index of Employees
CREATE INDEX Employees_IDX ON
Employee_T (ID);

--Index of Volunteers
CREATE INDEX Volunteers_IDX ON
Volunteer_T (ID);

--eof quin0237-Festival-DDL.sql