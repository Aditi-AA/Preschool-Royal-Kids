create database preschool;
use preschool;
show databases;
show tables;
CREATE TABLE STUDENT (
STUDENT_ID varchar(10) PRIMARY KEY,
STUDENT_NAME varchar(35) NOT NULL,
DOB date,
SEX varchar(6) NOT NULL,
CLASS_NAME varchar(20) NOT NULL,
TEACHER_NAME varchar(50) NOT NULL,
daycare_id varchar(50),
summercamp_id varchar(10),
Age numeric(2) NOT NULL,
FOREIGN KEY (TEACHER_NAME) references TEACHER(TEACHER_NAME),
FOREIGN KEY (SUMMERCAMP_ID) references SUMMER_CAMP(SUMMERCAMP_ID),
FOREIGN KEY (DAYCARE_ID) references DAYCARE(DAYCARE_ID),
FOREIGN KEY (CLASS_NAME) references CLASS(CLASS_NAME)
);

CREATE TABLE CLASS(
TIMING time,
CLASS_NAME varchar(15) PRIMARY KEY,
FEES numeric(10) NOT NULL
);

CREATE TABLE PARENT(
PARENT_NAME VARCHAR(35) NOT NULL,
ADDRESS VARCHAR(35) NOT NULL,
STUDENT_ID varchar(10) NOT NULL,
STAFF_ID varchar(10) not null,
PRIMARY KEY(PARENT_NAME,STUDENT_ID),
FOREIGN KEY (STUDENT_ID) references STUDENT(STUDENT_ID),
FOREIGN KEY (STAFF_ID ) references Center_Manager(STAFF_ID)
);

CREATE TABLE PARENT_PHONE(
PARENT_PHONE numeric(10) NOT NULL,
PARENT_NAME varchar(35) NOT NULL,
STUDENT_ID varchar(10) NOT NULL,
PRIMARY key(PARENT_PHONE,PARENT_NAME,STUDENT_ID),
FOREIGN KEY (STUDENT_ID) references STUDENT(STUDENT_ID),
FOREIGN KEY (PARENT_NAME) references PARENT(PARENT_NAME)
);

CREATE TABLE STAFF (
WORK_HOURS numeric(10) not null,
SALARY NUMERIC(10) NOT NULL,
STAFF_ID varchar(10) primary key,
INDEX idx_WORK_HOURS(WORK_HOURS),
INDEX idx_SALARY(SALARY),
INDEX  idx_STAFF_ID(STAFF_ID)
);

CREATE TABLE TEACHER(
TEACHER_NAME VARCHAR(35) not null,
CLASS_NAME VARCHAR(20) NOT NULL,
TEACHER_PHONE NUMERIC(10) NOT NULL,
STAFF_ID varchar(10) primary key,
DAYCARE_ID varchar(10),
WORK_HOURS numeric(10) not null,
SALARY NUMERIC(10) NOT NULL,

FOREIGN KEY (WORK_HOURS) REFERENCES STAFF(WORK_HOURS),
FOREIGN KEY (SALARY) REFERENCES STAFF(SALARY),
FOREIGN KEY (STAFF_ID) REFERENCES STAFF(STAFF_ID),
FOREIGN KEY (DAYCARE_ID) REFERENCES DAYCARE(DAYCARE_ID),
FOREIGN KEY (CLASS_NAME) REFERENCES CLASS(CLASS_NAME),
INDEX idx_TEACHER_NAME(TEACHER_NAME)
);

CREATE TABLE CENTER_MANAGER(
MANAGER_NAME VARCHAR(35) NOT NULL,
MANAGER_PHONE NUMERIC(10) NOT NULL,
WORK_HOURS numeric(10) not null,
SALARY NUMERIC(10) NOT NULL,
STAFF_ID varchar(10) primary key,
FOREIGN KEY(WORK_HOURS) REFERENCES STAFF(WORK_HOURS),
FOREIGN KEY (SALARY) REFERENCES STAFF(SALARY),
FOREIGN KEY (STAFF_ID) REFERENCES STAFF(STAFF_ID)
);


CREATE TABLE SUMMER_CAMP(
START_DATE DATE,
END_DATE DATE,
SC_FEES NUMERIC(10) NOT NULL,
NO_OF_STUDENTS NUMERIC(3) NOT NULL,
SC_ACTIVITY VARCHAR(20) NOT NULL,
SUMMERCAMP_ID VARCHAR(10) PRIMARY KEY,
CLASS_NAME VARCHAR(20) NOT NULL
);

CREATE TABLE DAYCARE(
DAYCARE_TIMING TIME,
DAYCARE_FEES NUMERIC(10) NOT NULL,
DAYCARE_ID VARCHAR(10) PRIMARY KEY
);

CREATE TABLE ACTIVITY(
ACTIVITY_NAME VARCHAR(35) PRIMARY KEY,
ACTIVITY_DATE DATE,
STAFF_ID varchar(10),
FOREIGN KEY (STAFF_ID) REFERENCES STAFF(STAFF_ID)
);

CREATE TABLE ATTENDS_A(
STUDENT_ID VARCHAR(10) NOT NULL,
ACTIVITY_NAME VARCHAR(35) NOT NULL,
PRIMARY KEY(STUDENT_ID,ACTIVITY_NAME),
FOREIGN KEY(ACTIVITY_NAME) REFERENCES ACTIVITY(ACTIVITY_NAME),
FOREIGN KEY(STUDENT_ID) REFERENCES STUDENT(STUDENT_ID)
);


SHOW TABLES;

select * from staff;
select * from activity;
select * from daycare;
select * from summer_camp;
select * from class;
select * from center_manager;
select * from teacher;
select * from student;
select * from parent;
select * from parent_phone;
select * from attends_a;

select max(salary) as 2nd_Salary
From teacher
where salary < (select max(salary) from teacher);
