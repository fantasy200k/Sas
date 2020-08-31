/* concatenate, append , keep statements */
libname testref "/folders/myfolders/dm1";

proc print data= testref.advertising;
run;


proc print data=testref.cars1;
run;

proc print data=testref.cars2;
run;

/* concatenate the above two datasets */
DATA testref.combineData;
set testref.cars1 testref.cars2;
run;

proc print data=testref.combineData;
run;


/* appending the data to the main dataset */
proc append base=testref.cars1 data=testref.cars2 force;
run;


proc print data = testref.cars1;
run;

/* merging the data set based on a common column between two datasets */

proc sort data=testref.cars1;
by model;
run;

proc sort data=testref.cars2;
by model;
run;


/* Interleaving method */                                                                                       
data ildata;
set testref.cars1 testref.cars2;
by model;
run;

proc print data=ildata;
run;




/* one to one mapping */
Data cust;
INPUT ordid qty product$;
DATALINES;
1 10 Lenova
2 20 USB 
3 10 Camera
4 20 LaptopBags
5 10 SchoolBags
;
run;

Data Sales;
INPUT ordid cname$ zip;
DATALINES;
1 Rajesh 560008
2 Mahesh 420001
3 Ramya  560016
4 Babu   560002
5 Sasken 400002
6 Deepa  600004
7 Sarvesh 600008
8 Panneer 600002
;
run;

DATA onetoone;
SET cust;
SET Sales;
run;

proc print DATA=onetoone;
run;




Data cust;
INPUT ordid qty product$;
DATALINES;
1 10 Lenova
2 20 USB 
3 10 Camera
4 20 LaptopBags
5 10 SchoolBags
;
run;

Data Sales;
INPUT ordid cname$ zip;
DATALINES;
1 Rajesh 560008
2 Mahesh 420001
3 Ramya  560016
6 Babu   560002
7 Sasken 400002
8 Deepa  600004
4 Sarvesh 600008
5 Panneer 600002
;
run;

DATA onetoone;
SET cust;
SET Sales;
run;

proc print DATA=onetoone;
run;

/* merging datasets using merge */
Data onetoonemerge;
merge cust Sales;
run; 	
proc print data=onetoonemerge;
run;


Data onetoonemerge2;
merge Sales cust;
run;

proc print data=onetoonemerge2;
run;

PROC SQL;
Create table innerJ as
Select * from testref.cars1 as x, testref.cars2 as y where x.model = y.model;
Quit;


PROC SQL;
Create table dummy as Select * from testref.cars1 as x left join testref.cars2 as y
On x.model = y.model;
Quit;


PROC SQL;
Create table dummy as Select * from testref.cars2 as x right join testref.cars1 as y
On x.model = y.model;
Quit;

data delete_rows;
set cust;
If qty < 20 then delete;
run;

proc print data=delete_rows;


data drop_cols;
set Sales;
DROP zip;
run;
proc print data=drop_cols;
run;


data drop_cols;
set Sales;
DROP zip;
run;
proc print data=drop_cols;
run;

data drop_cols;
set Sales;
DROP zip;
run;
proc print data=drop_cols;
run;

/* keep statement is to exclude all the variables exept those mentioned in keep */
/*  Scenario 1 */

data keep_set;
set Sales;
keep ordid;
run;

proc print data=keep_set;
run;

data keep_set1 (keep=ordid cname);
set Sales;
keep ordid;
run;

proc print data=keep_set1;
run;

/* Merge in SAS */
/* Use the merge statement when we have a common index variable, and
   any new variables or observations */
	
data mdemo1;
input a b c;
cards;
1 2 3
7 8 9
;
run;

data mdemo2;
input a b c;
cards;
4 5 6
3 6 9
;
run;

data new_merge_01;
	set mdemo1 mdemo2;
run;

proc print data = new_merge_01;
run;

/* Merge - two set statements when you have different variables */
data mdemo1;
input a b c;
cards;
1 2 3
7 8 9
;
run;

data mdemo2;
input d e f;
cards;
20 40 60
10 20 30
;
run;

data two_diff_var;
 set mdemo1;
 set mdemo2;
run;

proc print data=two_diff_var;
run;


/* Merge - common index */

proc sort data=mdemo1;
by a;
run;

proc sort data=mdemo3;
by a;
run;


data mdemo1 ;
input a b c;
cards;
1 2 3
7 8 9
;
run;

data mdemo3;
input a d e f;
cards;
1 20 40 60
7 10 20 30
2 11 12 13
3 14 15 16
;
run;

data merg_sc02;
merge mdemo1 mdemo3;
by a;
run;

proc print data=merg_sc02;
run;



