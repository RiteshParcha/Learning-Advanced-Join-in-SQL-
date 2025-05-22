use Projects;
show tables;

/*Mini Project: Learning and Practice Advanced "Joins"*/

/*Tables Used (5)/: *Training_rec | Skills_Join | Employee_Proj | Projects_Join | Employees_Join*/

/*Training_rec*/ /*Headers: skill_name;	department| Rows: 8*/
/*Skills_Join; /*Headers: emp_id; skill_name | Rows: 50*/
/*Employee_Proj; /* Headers: emp_id; project_id | Rows: 50*/
/*Projects_Join; /* Headers: id; project_name; department | Rows: 10*/
/*Employees_Join; /* Headers: id	name	department	manager_id | Rows: 20*/

/* Task 1: SELF JOIN: Show each employee's name along with their manager's name (if they have a manager)*/
Select a.Name as Employee_Name, b.Name as Manager_Name, a.Department
From Employees_Join AS a Left Join Employees_Join as b 
On
a.Manager_Id=b.id;

/* Task 2: Cross Join: List all possible combinations of employees and projects*/

Select a.Name, b.Project_Name
from employees_join AS a Cross Join Projects_Join as b
Limit 100;
Select * from Projects_Join;

/*Task 3: Lateral Join(Not in Mysql completely) 
For each employee, suggest one skill they don’t already have, but is recommended for their department.*/

Select a.Name, c.Skill_name as Skill_Needed
from Employees_Join as a 
Join Training_Rec as c On c.department = a.department 
where 
c.Skill_name not in
(Select Skill_name from Skills_Join where emp_id=a.id);
