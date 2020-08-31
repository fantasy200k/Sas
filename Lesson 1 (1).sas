/* Create a permanent library */

libname testref "/folders/myfolders/dm1";

DATA testref.EMPDAT;
INPUT   EMPID ENAME $ SALARY DEPT $ DOJ :DATE9.;
LABEL ID = 'Employee ID';
FORMAT DOJ DATE9.;
DATALINES;
1 Rick 623.3 IT 02APR2001
2 Dan 515.2 OPS 11JUL2012
3 Mike 611.5 IT 21OCT2000
4 Ryan 729.1 HR 
5 Gary 843.2 FIN 06AUG2000
6 Tusar 578.6 IT 01MAR2009
7 Pranab 632.8 OPS 16AUG1998
8 Rasmi 722.5 FIN 13SEP2014
;
run;
/* 30JUL2012 */
PROC PRINT DATA = testref.EMPDAT;
run; 

PROC sort DATA = testref.EMPDAT;
   by dept;
run;


/* To view the structure of the data set */
PROC CONTENTS DATA = testref.EMPDAT;run; 

/* Date Data type */

DATA DTEMP;
INPUT  @1 DOJ1 mmddyy10. @12 DOJ2 mmddyy10.;
format  DOJ1 date11.  DOJ2 worddate20. ;
DATALINES;
01/12/2012 02/11/1998 
;
PROC PRINT DATA = DTEMP;
RUN;



data df;
infile datalines;
length Rank $10 Name $8. Days 8. ;
input Rank $ Name $ Date :date9. Days ;
format Date date9. ;
datalines;
One Joe 04Sep2018 30
Two Scot 04Sep2018 20
Three Bob 05Sep2018 .
Four  none  05Sep2018 .
;
run;



Data df1;
set df;
IF Days = . THEN Days = 0;
if Name = 'none' THEN Name = ' ';
run;

proc print data=df1;
run;