/* Om Vakraduntaaya Namah */
/* SAS Macros */


libname testref "/folders/myfolders/dm1";
proc print data=testref.empdat;
where salary > 100;
title "Employee Salary as of &sysday &sysdate &systime"
run;

%put _automatic_;

/* create user defined macro  and use it alongwith automatic macros */

%let dept = "IT";

proc print data = testref.empdat;
where dept = &dept;
title "Salary of IT department employees as of &sysday &sysdate &systime";
quit;

/* using macro statement */
/* here test is name of the macro & demo is parameter */
%macro test (demo=);
proc print data=testref.empdat;
where SALARY > &demo;
run;
%mend;
%test (demo =600);

%let DF =testref.empdat;
%let var = SALARY;
proc means data = &DF;
title "%UPCASE (%SCAN(&var,1))  ";
var &var;
class ENAME;
run;
