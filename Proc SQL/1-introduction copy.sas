libname orion "Z:/Desktop/MSA/SQL/SAS_Data";
run;

/* Basic Proc SQL;
proc sql;
	SELECT * FROM orion.customer;
quit;*/

/* Alias in Proc SQL
proc sql;
	SELECT Customer Country AS Country 
	FROM orion.customer;
quit;*/
/* Class Activity 
Create Table Temp that has Employee_ID and Salary from orion.employee_information
And also adds a new column, Bonus, that is 10% of the Salary
proc sql;
	CREATE TABLE TEMP AS
	SELECT Employee_ID, Salary, int(Salary*.1) AS Bonus
	FROM orion.employee_information;
quit;*/

/* Eliminating Duplicate Rows
proc sql;
	SELECT distinct Employee_ID
	FROM TEMP
	WHERE Employee_ID > 10;
quit; */


/* WHERE
proc sql;
	SELECT *
	FROM TEMP
	WHERE Bonus < 200;
quit; */


/* WHERE is evaluated before select. The next 4 lines won't run
proc sql;
	SELECT employee_id, salary, salary*0.1 AS bonus
	from orion.employee_information
	where bonus < 3000;
run; */

/* The ANSI standard is below...
proc sql;
	SELECT employee_id, salary, salary*0.1 AS bonus
	from orion.employee_information
	where salary*0.1 < 3000;
run; */

/* But, SAS gives us an extension */
proc sql;
	SELECT employee_id, salary, salary*0.1 AS bonus
	from orion.employee_information
	where calculated bonus < 3000;
run;

