
/* DO UNTIL LOOP in SAS */

PROC PRINT DATA = testref.EMPDAT;
run; 

Data EMPDAT1;
Set testref.EMPDAT;
IF SALARY < 600 THEN SALRANGE = "LOW";
ELSE IF 600 <= SALARY <= 700 THEN SALRANGE = "MEDIUM";
ELSE IF 700 < SALARY THEN SALRANGE = "MEDIUM";


PROC PRINT DATA = EMPDAT1;
run; 

data df;
infile datalines;
length Rank $10 Name $8. Days 8. ;
input Rank $ Name $ Date :date9. Days ;
format Date date9. ;
datalines;
One Joe 04Sep2018 30
Two Scot 04Sep2018 20
Three Bob 05Sep2018 .
;
run;



Data df1;
set df;
IF Days = . THEN Days = 0;
run;

proc print data=df1;
run;




data multiply;
multiple=0;
Do i=1 to 20;

 multiple + 5;
end;
run;


data multiply ;
multiple = 0;
Do until (multiple >=100);
multiple +5;
output;
end;
run;


data multiply1 ;
multiple = 0;
Do while (multiple <= 100);
multiple +5;
output;
end;
run;

data multiply1 ;
multiple = 0;
Do while (multiple < 100);
multiple +5;
output;
end;
run;