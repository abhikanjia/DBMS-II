create database employee_info_329;

create table employee
(	eid			int,
	ename		varchar(100),
	gender		varchar(10),
	joiningdate	datetime,
	salary		decimal(8,2),
	city		varchar(100)
);

insert into employee values(1,'nick','male','01-jan-13',4000,'london');
insert into employee values(2,'julian','female','01-oct-14',3000,'new york');
insert into employee values(3,'roy','male','01-jun-16',3500,'london');
insert into employee values(4,'tom','male',null,4500,'london');
insert into employee values(5,'jerry','male','01-feb-13',2800,'sydney');
insert into employee values(6,'philip','male','01-jan-15',7000,'new york');
insert into employee values(7,'sara','female','01-aug-17',4800,'sydney');
insert into employee values(8,'emily','female','01-jan-15',5500,'new york');
insert into employee values(9,'michael','male',null,6500,'london');
insert into employee values(10,'john','male','01-jan-15',8800,'london');

select * from employee;



--From the above given table perform the following queries:

 
--1. Display all the employees whose name starts with “m” and 4 th character is “h”.
	select * from employee where ename like 'm__h%';


--2. Find the value of 3 raised to 5. Label the column as output.
	select power(3,5) as output;

	 
--3. Write a query to subtract 20 days from the current date.
	select getdate()-20;

--4. Write a query to display name of employees whose name starts with “j” and contains “n” in their name.
	select ename from employee where ename like'j%n%';


--5. Display 2nd to 9th character of the given string “SQL Programming”.
	select SUBSTRING('SQL Programming',2,9);

--6. Display name of the employees whose city name ends with “ney” &contains six characters.
	select ename from employee where city like '___ney';

--7. Write a query to convert value 15 to string.
	select convert(varchar,15);

--8. Add department column with varchar (20) to Employee table.
	alter table employee add department varchar(20);

--9. Set the value of department to Marketing who belongs to London city.
	update employee set department='marketing' where city='london'; 

--10. Display all the employees whose name ends with either “n” or “y”.
	select * from employee where ename like '%n'or ename like'%y';

--11. Find smallest integer value that is greater than or equal to 63.1, 63.8 and -63.2.
	select floor(63.1);
	select floor(63.8);
	select floor(-63.2);
	
--12. Display all employees whose joining date is not available.
	select * from employee where joiningdate is null;

--13. Display name of the employees in capital letters and city in small letters.
	select upper(ename),lower(city) from employee;  

--14. Change the data type of Ename from varchar (30) to char (30).
	alter table employee alter column ename char(30);

--15. Display city wise maximum salary.
	select max(salary),city from employee group by city;

--16. Produce output like <Ename> works at <city> and earns <salary> (In single column).
	select ename+'works at'+city+'and earns'+cast(salary as varchar) from employee;

--17. Find total number of employees whose salary is more than 5000.
	select count(ename)from employee where salary>5000;

--18. Write a query to display first 4 & last 3 characters of all the employees.
	select left(ename,4),right(rtrim(ename),3) from employee;

--19. List the city having total salaries more than 15000 and employees joined after 1st January, 2014.
	select city from employee where joiningdate>'01-jan-14' group by city having sum(salary)>15000;

--20. Write a query to replace “u” with “oo” in Ename.
	select replace(ename,'u','oo') from employee;

--21. Display city with average salaries and total number of employees belongs to each city.
	select city,avg(salary),count(ename) from employee group by city;

--22. Display total salaries paid to female employees.
	select sum(salary) from employee  group by gender having gender='female';

--23. Display name of the employees and their experience in years.
	select ename,datediff(year,joiningdate,getdate()) as experience from employee;

--24. Remove column department from employee table.
	alter table employee
	drop column department;

--25. Update the value of city from syndey to null.
	update employee set city=null where city='sydney';

--26. Retrieve all Employee name, Salary & Joining date.
	select ename,salary,joiningdate from employee;

--27. Find out combine length of Ename & Gender.
	select len(ename)+len(gender) from employee;

--28. Find the difference between highest & lowest salary.
	select max(salary)-min(salary) from employee;

--29. Rename a column from Ename to FirstName.
	sp_rename 'employee.ename','firstname';

--30. Rename a table from Employee to EmpMaster.
	sp_rename 'employee','employeemaster';