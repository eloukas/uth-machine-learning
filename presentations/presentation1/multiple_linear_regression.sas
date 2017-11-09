/* 'data' begins a data step and provides names for any output of dataset */
data demo; 
input y x1 x2 x3;

datalines;
7 1 13 3
8 2 18 6
9 3 2 1
15 4 21 8
18 5 5 0
20 6 8 6
21 6 5 6
;

/* 'proc' stands for procedure. */
/* A procedure is a group of SAS statements */
proc print; 
run; /* 'run' executes the previous statements


/*Scatterplot many variables between each other */
proc sgscatter;
	matrix y x1 x2 x3; 
run; 


/* call procedure 'reg'(regression) */
proc reg data = demo; 
	model y = x1 x2 x3; /* if we wanted to do a simple linear regression with x1,
			       		   we would just type only the argument 'x1' */
run;

/* Our model is mathematically equal to 
y-hat = b_0 + b_1*x_1 + b_2*x_2 + b_3*x_3; */


