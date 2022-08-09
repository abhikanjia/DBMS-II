create database worker_info_329;

--From the above given tables perform the following queries: 
--• Stored Procedures


	--department insert table
	create procedure pr_department_insert
	
	@departmentid	int,
	@departmentname varchar(100)

	as
	begin
	insert into department
	(	departmentid,
		departmentname	
	)
	values(	 @departmentid,	
			 @departmentname
		  )
	end

	--exec pr_department_insert 1,'admin';
	--exec pr_department_insert 2,'it';
	--exec pr_department_insert 3,'hr';
	--exec pr_department_insert 4,'account';
	select * from department;


	--designation table
	create procedure pr_designation_insert
	
	@designationid	int,
	@designationname varchar(100)

	as
	begin
	insert into designation
	(	designationid,
		designationname	
	)
	values(	 @designationid,	
			 @designationname
		  )
	end

	--exec pr_designation_insert 11,'jobber';
	--exec pr_designation_insert 12,'welder';
	--exec pr_designation_insert 13,'clerk';
	--exec pr_designation_insert 14,'manager';
	--exec pr_designation_insert 15,'ceo';
	select * from designation;



	--person table
	create procedure pr_person_insert
	
	
	@firstname		varchar(100),
	@lastname		varchar(100),
	@salary			decimal(8,2),
	@joiningdate	datetime,
	@departmentid   int,
	@designationid	int
	

	as
	begin
	insert into person
	(			
		firstname,		
		lastname,		
		salary,			
		joiningdate,
		departmentid,	
		designationid	
			
	)
	values(			 
		   @firstname,		
		   @lastname,		
		   @salary,			
		   @joiningdate,
		   @departmentid,	
		   @designationid	
		 
		  )
	end

	exec pr_person_insert 'rahul','anshu',56000,'1990-01-01',1,12;
	exec pr_person_insert 'hardik','hinshu',18000,'1990-09-25',2,11;
	exec pr_person_insert 'bhavin','kamani',25000,'1991-05-14',null,11;
	exec pr_person_insert 'bhoomi','patel',39000,'2014-02-20',1,13;
	exec pr_person_insert 'rohit','rajgor',17000,'1990-07-23',2,15;
	exec pr_person_insert 'priya','mehta',25000,'1990-10-18',2,null;
	exec pr_person_insert 'neha','trivedi',18000,'2014-02-20',3,15;
	

	select * from person;


	--update department
	create procedure pr_department_update
	(	@departmentid	int,
		@departmentname varchar(100)
	)
	as
	begin
	update department
	set
		departmentid=@departmentid,
		departmentname=@departmentname
	where departmentid=@departmentid
	end 

	--exec pr_department_update 1,admin1


	--designation update table

	create procedure pr_designation_update
	(	@designationid	 int,
		@dedignationname varchar(100)
	)
	as
	begin
	update designation
	set
		
		designationname=@dedignationname
	where designationid=@designationid
	end 

	--person update table
	create procedure pr_person_update

	( @workerid     int,
	  @firstname		varchar(100),
	  @lastname		varchar(100),
	  @salary			decimal(8,2),
	  @joiningdate	datetime,
	  @departmentid   int,
	  @designationid	int)
	  as
	  begin
	  update person
	  set
	  firstname=@firstname,	
	  lastname=@lastname,		
	  salary=@salary,		
	  joiningdate=@joiningdate,	
	  departmentid=@departmentid, 
	  designationid=@designationid
	  where workerid=@workerid
	  end


	--delete department
	create procedure pr_department_delete
	(	
		@departmentid int
	)
	as
	begin
	delete from department
	where departmentid=@departmentid
	end

	--exec pr_department_delete 4
	--select * from department
	  
	--delete designation
	create procedure pr_designation_delete
	(
		@designationid int 
	)
	as
	begin
	delete from designation
	where designationid=@designationid
	end

	--delete person
	create procedure pr_person_delete
	(
		@workerid int 
	)
	as
	begin
	delete from person
	where workerid=@workerid
	end


--2. All tables SelectAll (If foreign key is available than do write join and take columns on select list)
	create procedure pr_selectAll
	as
	begin select workerid,
				firstname,
				lastname,
				salary,
				joiningdate,
				person.departmentid,
				person.designationid,
				department.departmentname,
				designation.designationname
				  from
	person inner join department
	on
	person.departmentid=department.departmentid
	inner join designation
	on
	person.designationid=designation.designationid

	end

	exec pr_selectAll




--3. All tables SelectPK
	create procedure pr_selectPK
	as
	begin
	select
		     workerid,
			 department.departmentid,
			 designation.designationid 
    from
	person inner join department
	on
	person.departmentid=department.departmentid
	inner join designation
	on
	person.designationid=designation.designationid

	end
	--exec pr_selectPK
	
	
--4. Create Procedure that takes Department Name & Designation Name as Input and Returns a 
--table with Worker’s First Name, Salary, Joining Date & Department Name.
	create procedure pr_return_value
	(	@departmentname  varchar(100),
		@designationname varchar(100)
	)
	as
	begin
	select  firstname,
			salary,
			joiningdate,
			department.departmentname
	from
	person inner join department
	on
	person.departmentid=department.departmentid
	inner join designation
	on
	person.designationid=designation.designationid

	where departmentname=@departmentname and designationname=@designationname
	end

	--exec pr_return_value 'it','jobber'


--5. Create Procedure that takes FirstName as an input parameter and displays’ all the details of 
--the worker with their department & designation name.
	create procedure pr_display_detail
	( 
		@firstname varchar(100)
	) 
	as 
	begin
	select workerid,
			firstname,
			lastname,
			salary,
			joiningdate,
			person.departmentid,
			person.designationid,
			department.departmentname,
			designation.designationname

	from
	person inner join department
	on
	person.departmentid=department.departmentid
	inner join designation
	on
	person.designationid=designation.designationid

	where firstname=@firstname
	end

	--exec pr_display_detail 'rahul' 

--6. Create Procedure which displays department wise maximum, minimum & total salaries.
	alter procedure pr_min_max_salary
	as
	begin
	select department.departmentname,
	 max(salary),
	min(salary),
	sum(salary)
	from person inner join department
	on
	person.departmentid=department.departmentid
	inner join designation
	on
	person.designationid=designation.designationid
	group by departmentname
	end
	--exec pr_min_max_salary
	--select * from person










--• Views

--1. Create a view that display first 100 workers details.
	create view vw_person_details
	as
		select top 100
			workerid,
			firstname,
			lastname,
			salary,
			joiningdate,
			person.departmentid,
			person.designationid,
			department.departmentname,
			designation.designationname

	from
	person inner join department
	on
	person.departmentid=department.departmentid
	inner join designation
	on
	person.designationid=designation.designationid

	select * from vw_person_details

	 
--2. Create a view that displays designation wise maximum, minimum & total salaries.
	create view vw_person_max_min
	as
	select designation.designationname,
	 max(salary) as maxsalary,
	min(salary) as minsalary,
	sum(salary) as sumsalary
	from person inner join department
	on
	person.departmentid=department.departmentid
	inner join designation
	on
	person.designationid=designation.designationid
	group by designationname

	select * from vw_person_max_min
--3. Create a view that displays Worker’s first name with their salaries & joining date, it also displays
--duration column which is difference of joining date with respect to current date. 
	create view vw_worker
	as
	select  firstname,
			salary,
			joiningdate,
			datediff(year,joiningdate,getdate()) as duration
			from person inner join department
	on
	person.departmentid=department.departmentid
	inner join designation
	on
	person.designationid=designation.designationid

	select * from vw_worker


--4. Create a view which shows department & designation wise total number of workers.
	create view vw_count_worker
	as
	select count(workerid) as total_worker,
		designation.designationname,
		department.departmentname
		from person inner join department
	on
	person.departmentid=department.departmentid
	inner join designation
	on
	person.designationid=designation.designationid
	group by departmentname,designationname

	select * from vw_count_worker


--5. Create a view that displays worker names who don’t have either in any department or 
--designation

	create view vw_null_worker
	as
	select firstname
	from person inner join department
	on
	person.departmentid=department.departmentid
	inner join designation
	on
	person.designationid=designation.designationid
	where person.designationid is null or person.departmentid is null

	select * from vw_null_worker








--• User Defined Functions
--1. Create a table valued function which accepts DepartmentID as a parameter & returns a worker 
--table based on DepartmentID.

	alter function f_worker(@departmentid int)
	returns table
	as
	
	return (select
			workerid,
			firstname,
			lastname,
			salary,
			joiningdate,
			person.departmentid,
			person.designationid,
			department.departmentname,
			designation.designationname

	from
	person inner join department
	on
	person.departmentid=department.departmentid
	inner join designation
	on
	person.designationid=designation.designationid
	where department.departmentid=@departmentid )
	

	--select * from  f_worker(1)

--2. Create a table valued function which returns a table with unique city names from worker table.


--3. Create a scalar valued function which accepts two parameters start date & end date, and 
--returns a date difference in days.
	create function f_datediff_days(@start datetime,@end datetime)
	returns int
	as
	begin
	return datediff(day,@start,@end) 
	end

	select  dbo.f_datediff_days('2004-sep-04','2022-july-28')
--4. Create a scalar valued function which accepts two parameters year in integer & month in 
--integer and returns total days in passed month & year.
--5. Create a scalar valued function which accepts two parameters year in integer & month in
--integer and returns first date in passed month & year