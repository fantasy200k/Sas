
/* Generated Code (IMPORT) */
/* Source Path: /folders/myfolders */
/* Code generated on: 1/10/18, 7:36 PM */



FILENAME REFFILE '/folders/myfolders/retailMarketing29jun.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=TESTREF.MKT;
	GETNAMES=YES;
RUN;

proc logistic data=cars;
model fuel_efficient= enginesize weight;
oddsratio fuel_efficient;
RUN;

PROC REG DATA=TESTREF.MKT;
model AmountSpent = salary catalogs ;
run;
 
proc logistic data=cars;
model fuel_efficient= enginesize weight;
oddsratio fuel_efficient;
RUN;
