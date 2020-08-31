/* Om Vignaharta Ganeshaya Namah */

data sum_df ;
	x1 = sum(2,3,4);
	x2 = sum(3,.,5);
run;


data strg_ex1;
	x = "Hello World";
	y = substr(x,1,10);

	z = substr(x,1,11);
run;	
