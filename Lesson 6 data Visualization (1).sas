/* vignaharta Ganeshaya Namah */

proc univariate data = sashelp.cars;
   histogram horsepower
   / midpoints = 176 to 350 by 50;
run;

proc freq data = testref.autoinsurance;
Tables marital default;
run;

/* box plot */

PROC SQL;
create table CARS1 as
SELECT make, model, type, invoice, horsepower, length, weight
   FROM 
   SASHELP.CARS
   WHERE make in ('Audi','BMW')
;
RUN;

PROC SGPLOT  DATA = CARS1;
   VBOX horsepower 
   / category = type;

   title 'Horsepower of cars by types';
RUN; 




/* bar plot */

PROC SQL;
create table CARS1 as
SELECT make, model, type, invoice, horsepower, length, weight
   FROM 
   SASHELP.CARS
   WHERE make in ('Audi','BMW')
;
RUN;

proc SGPLOT data = work.cars1;
vbar length ;
title 'Lengths of cars';
run;
quit;

/* Box Plot */
PROC SQL;
create table CARS1 as
SELECT make, model, type, invoice, horsepower, length, weight
   FROM 
   SASHELP.CARS
   WHERE make in ('Audi','BMW')
;
RUN;

/* You can use the SGPLOT procedure 
  to create statistical graphics such 
  as histograms and regression plots, in addition to simple 
   graphics such as scatter plots and line plot  */
  

/* Pie Chart */

PROC SQL;
create table CARS1 as
SELECT make, model, type, invoice, horsepower, length, weight
 FROM 
SASHELP.CARS
WHERE make in ('Audi','BMW')
;
RUN;


/* Scatter Plots */
PROC SQL;
create table CARS1 as
SELECT make, model, type, invoice, horsepower, length, weight
FROM 
SASHELP.CARS
WHERE make in ('Audi','BMW')
;
RUN;

TITLE 'Scatterplot - Two Variables';
PROC sgscatter  DATA = CARS1;
   PLOT horsepower*Invoice 
   / datalabel = make group = type grid;
   title 'Horsepower vs. Invoice for car makers by types';
RUN; 


PROC TEMPLATE;
   DEFINE STATGRAPH pie;
      BEGINGRAPH;
         LAYOUT REGION;
            PIECHART CATEGORY = type /
            DATALABELLOCATION = OUTSIDE
            CATEGORYDIRECTION = CLOCKWISE
            START = 180 NAME = 'pie';
            DISCRETELEGEND 'pie' /
            TITLE = 'Car Types';
         ENDLAYOUT;
      ENDGRAPH;
   END;
RUN;
PROC SGRENDER DATA = cars1
            TEMPLATE = pie;
RUN;


PROC TEMPLATE;
   DEFINE STATGRAPH pie;
      BEGINGRAPH;
         LAYOUT REGION;
            PIECHART CATEGORY = type / Group = make
            DATALABELLOCATION = INSIDE
            DATALABELCONTENT = ALL
            CATEGORYDIRECTION = CLOCKWISE
            DATASKIN = SHEEN 
            START = 180 NAME = 'pie';
            DISCRETELEGEND 'pie' /
            TITLE = 'Car Types';
         ENDLAYOUT;
      ENDGRAPH;
   END;
RUN;
PROC SGRENDER DATA = cars1
            TEMPLATE = pie;
RUN;