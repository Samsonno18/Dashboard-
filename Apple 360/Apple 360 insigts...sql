Use samson
select *  from project2_employees;
select * from perfomance;
select * from training;
select * from feedback;

-- Now We will do some query and get some insights..

-- 1. Retrieve all employees and their performance metrics.

select * from project2_employees inner join perfomance
on project2_employees.ï»¿EmployeeID = perfomance.EmployeeID;


-- 2. let us look at employees who completed more than 40 tasks.

select EmployeeID, Name , Department, Role, TotalTasksCompleted from project2_employees inner join perfomance
on project2_employees.ï»¿EmployeeID = perfomance.EmployeeID
where TotalTasksCompleted > 40;

-- 3. Now we will look at Employees who have got positive feedback. 

select EmployeeID, Name , Department, Role, FeedbackDate, FeedbackType, Comments  from project2_employees inner join feedback
on project2_employees.ï»¿EmployeeID = feedback.EmployeeID
where FeedbackType = 'Positive';

-- 4. we will check employees with the most training hours

select EmployeeID, Name , Department, Role, TrainingProgram, TrainingHours from project2_employees inner join training
on project2_employees.ï»¿EmployeeID = training.EmployeeID
Order by TrainingHours DESC
Limit 5;

-- 5.Now will see the average Project Completion Rate by department.

select Department, avg(ProjectCompletionRate) as Avg_ProjectCompletionRate from project2_employees inner join perfomance
on project2_employees.ï»¿EmployeeID = perfomance.EmployeeID
group by Department;

-- 6. employees hired after January 1, 2020, and their training programs.

select EmployeeID, Name , Department, Role, HireDate, TrainingProgram from project2_employees inner join training
on project2_employees.ï»¿EmployeeID = training.EmployeeID
Where HireDate > 2020-01-01;


-- 7. Count of  how many employees belong to each department.

select Department, count(ï»¿EmployeeID) as TotalEmployees from project2_employees
group by Department;

-- 8. Employees who completed training but have "Neutral" feedback.

select ï»¿EmployeeID, Name , Department, Role, TrainingProgram, FeedbackType from project2_employees

inner join training
on project2_employees.ï»¿EmployeeID = training.EmployeeID
inner join feedback
on project2_employees.ï»¿EmployeeID = 
feedback.EmployeeID
where FeedbackType = 'Neutral';

-- 9. Displaying employee feedback with comments containing "improvement".

select  EmployeeID, Name , Department, Role, FeedbackDate, Comments  from project2_employees inner join feedback
on project2_employees.ï»¿EmployeeID = feedback.EmployeeID
where Comments like '%improvement%';


-- 10. Top 3 employees based on Project Completion Rate.

select EmployeeID, Name, Department, ProjectCompletionRate from project2_employees 
inner join perfomance on project2_employees.ï»¿EmployeeID = perfomance.EmployeeID
 order by ProjectCompletionRate desc
 limit 3;

