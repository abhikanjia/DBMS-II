--select * from department;
--select * from person1;

--From the above given table perform the following queries:
 
--1. Find all persons with their department name & code.
	select person1.personname,department.departmentname,department.departmentcode
	from person1 inner join department
	on
	person1.departmentid=department.departmentid;

--2. Give department wise maximum & minimum salary with department name.
	select department.departmentname,max(salary),min(salary)
	from person1 inner join department
	on
	person1.departmentid=department.departmentid
	group by department.departmentname;

--3. Find all departments whose total salary is exceeding 100000.
	select department.departmentname,sum(salary)
	from person1 inner join department
	on
	person1.departmentid=department.departmentid
	group by department.departmentname
	having sum(salary)>100000;
	
--4. Retrieve person name, salary & department name who belongs to Jamnagar city.
	select person1.personname,person1.salary,department.departmentname
	from person1 inner join department
	on
	person1.departmentid=department.departmentid
	where city in('jamnagar');

--5. Find all persons who does not belongs to any department.
	select person1.personname
	from person1 left outer join department
	on
	person1.departmentid=department.departmentid
	where department.departmentid is null;

--6. Find department wise person counts
	select department.departmentname,count(personname)
	from person1 inner join department
	on
	person1.departmentid=department.departmentid
	group by department.departmentname;

--7. Find average salary of person who belongs to Ahmedabad city.
	select person1.city,avg(salary)
	from person1 left outer join department
	on
	person1.departmentid=department.departmentid
	group by city
	having city='ahmedabad';

--8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly.
--(In single column)
	select person1.personname+' earns '+cast(person1.salary as varchar)+' from department '+department.departmentname
	from person1 inner join department
	on
	person1.departmentid=department.departmentid;

--9. List all departments who have no persons.
	select department.departmentname
	from person1 left outer join department
	on
	person1.departmentid=department.departmentid
	where personid is null;

--10. Find city & department wise total, average & maximum salaries.

--city wise
	select person1.city, sum(salary),avg(salary),max(salary)
	from person1 left outer join department
	on
	person1.departmentid=department.departmentid
	group by person1.city;

--department wise
	select department.departmentname, sum(salary),avg(salary),max(salary)
	from person1 right outer join department
	on
	person1.departmentid=department.departmentid
	group by department.departmentname;
	
--11. Display Unique city names.
	select distinct person1.city
	from person1 left outer join department
	on
	person1.departmentid=department.departmentid;

--12. List out department names in which more than two persons.
	select department.departmentname
	from person1 right outer join department
	on
	person1.departmentid=department.departmentid
	group by departmentname
	 having count(department.departmentid)>2;

--13. Combine person name’s first three characters with city name’s last three characters in single column.
	select substring(personname,1,3)+substring(city,len(city)-2,len(city))
	from person1 left outer join department
	on
	person1.departmentid=department.departmentid;

--14. Give 10% increment in Computer department employee’s salary.
	select salary=salary+(0.1* salary)
	from person1 inner join department
	on person1.departmentid=department.departmentid
	where departmentname='computer';

--15. Display all the person name’s who’s joining dates difference with current date is more than 365 days.	select person1.personname	from  person1 left outer join department
	on
	person1.departmentid=department.departmentid		where datediff(day,joiningdate,getdate())>365;