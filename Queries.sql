use preschool;
#QUERIES
#1 All the staff who participated in activity rainbow day
select staff_id
From activity
Where activity_name = 'Rainbow Day';

#2 Find the all the female student’s name who went to summercamp
select student_name
From student
Where sex = 'female'
And summercamp_id is not null;

#3 Find the teacher name who participated in activity puppet show
select teacher_name
From teacher natural inner join activity
Where staff_id in (select staff_id from activity where activity_name = 'Puppet show');

#4 Find the names of student in jr.kg
select *
From student
Where class_name = 'jr.kg';

#5 Find the fees of summercamp activities with a fee less than or equal to the average summercamp fees
select sc_fees
from summer_camp
where sc_fees <= (select avg(sc_fees) from summer_camp);

#6 Display all male student names and daycare timmings
select STUDENT_NAME
From student 
Where sex='Male'
and DAYCARE_ID in (select DAYCARE_ID from daycare where Daycare_Timing='09:00:00');


#7 Display manager name and parent name where the manager earns more than 9000
select manager_name, parent_name
From parent natural inner join center_manager
Where staff_id in (select staff_id from center_manager where salary > 9000);

#8 Display female students who are enrolled in sr.kg
select student_name, class_name
from student 
where sex = 'FEMALE' and class_name = 'SR.KG';

#9 Display students enrolled in daycare
select student_name, daycare_id
from student 
where daycare_id in ( select daycare_id from daycare);

#10 Display details of male students taught by radhika jha 
select *
from student  
where sex ='male' and teacher_name = 'radhika jha';

#11 Find the teacher with the 2nd highest salary
select max(salary) as high_Salary
From teacher
where salary < (select max(salary) from teacher);

#12 Find the summer camp activity that has more that 10 students and that students are in sr.kg
select sc_activity
From student natural inner join summer_camp
Where summer_camp .class_name='sr.kg'
And summercamp_id in (select summercamp_id from summer_camp where NO_OF_STUDENTS > 10);

#13 Display all male student names and daycare timings are 09:00:00
select STUDENT_NAME
From student 
Where sex='Male'
and DAYCARE_ID in (select DAYCARE_ID from daycare where Daycare_Timing='09:00:00');

#14 Display students of jr.kg enrolled for yoga
Select student_name, SUMMERCAMP_ID
From student natural inner join summer_camp
Where sc_activity = 'yoga' and class_name = 'jr.kg';

#15 Display all students by ordering them according to their birthdate
select *
from student 
order by dob;

#16 Display students who are in summercamp but not in daycare 
select * 
from student 
where daycare_id  is null
order by summercamp_id;

#17 Display activities celebrated in november
select activity_name 
from activity 
where activity_date between '2023-11-01' and '2023-11-30';

#18 Display the total sum of students in summercamp enrolled for yoga
select sum(no_of_students) as yoga_students
from summer_camp 
where sc_activity = 'yoga';

#19 Display total count of students 
select count(*)
from student;

#20 Display all student and parent details of parent Anil kapoor
Select *
From student natural inner join parent
Where parent_name = 'Anil kapoor';

#21 Display count of students in summercamp 
select count(summercamp_id)
from summer_camp;

#22 Display average salary of all working staff 
select avg(salary) as avg_salary
from staff;

#23 Display the names of parents associated with center manager 1  .
select parent_name 
from parent 
where staff_id = 'CM01';

#24 Find parent's phone number for student having 'ka' in their name.
select PARENT_NAME,PARENT_PHONE
from parent_phone
where STUDENT_ID in ( select STUDENT_ID from student where student_name like '%KA%');

#25 Display student in both daycare and summercamp
(select *
from student
where summercamp_id is not null 
AND daycare_id is not null);

#26 Display parents details in ascending order by name.
select *
from parent
order by parent_name;

#27 Find the details of the summer camp march.
select *
from summer_camp
where START_DATE between '2023-03-01' and '2023-03-31';

#28 Find the name of the student attending the activity “Rainbow Day”.
select student_name
from student,attends_a
where student.STUDENT_ID=attends_a.STUDENT_ID
AND ACTIVITY_NAME="Rainbow Day";

#29 Display staff_id of teachers using except operation
(select staff_id from staff)
EXCEPT
(select staff_id from center_manager);

#30 A view containing the names of the center managers and the count of parent's managed by them
create view cm1 as(select manager_name, count(parent_name) 
from center_manager, parent 
where center_manager.staff_id=parent.staff_id 
group by manager_name);
select * 
from cm1;































