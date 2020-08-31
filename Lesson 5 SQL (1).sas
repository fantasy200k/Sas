/* Om Vignaharta Ganapataye Namah */

libname testref "/folders/myfolders/dm1";


PROC SQL;
SELECT make,model,type,invoice,horsepower
FROM 
SASHELP.CARS
Where make = 'Audi'
and Type = 'Sports'
;
QUIT;

PROC SQL;
SELECT make,model,type,invoice,horsepower
FROM 
SASHELP.CARS
;
QUIT;

/*
prc sql;
select ename,salary from testref.empdat;
quit;
*/

/* apply condition using where and groupby */
proc sql;
select dept,sum(salary) as Salary from testref.empdat
where salary > 600 group by dept;
run;

/* sorting based on ascending */
proc sql;
select dept,salary from testref.empdat
where salary > 600 order by dept;
run;


/* having condition */
proc sql;
select * from testref.empdat
having salary = max(salary) ;

run;/* apply condition using where and groupby */



/* create a new table */
proc sql;
create table testref.emp2 as
select ename,dept,salary from testref.empdat
where salary > 600 order by salary desc;
quit;

