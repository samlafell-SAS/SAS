libname public 'Z:/Desktop/MSA/Linear Algebra/Data';
run;

/************************************************************************/
proc princomp data=public.Big5 ;
var e1--o10;
run;
/* The factor output from proc factor is the same as the eigenvector output by proc princomp */
/* it is merely scaled by the squareroot of the associated variance (i.e. the standard deviation)*/
proc factor data=public.Big5;
var e1--o10;
run;


/************************************************************************/


proc factor data=public.Big5 out=ipipfactors nfactors=5;
var e1--o10;
run;
/* Communalities tell us how much of the variance in each individual variable is explained by the
	factor model. You can think of this as the R^2 of predicting each variable with the factors
	determined by the model. The default for choosing the number of factors is to only choose factors
	with an associated eigenvalue greater or equal to 1. This is because the correlation PCA is used
	so you want each factor to explain at least as much variance as one of your original variables!*/


proc reg data = ipipfactors;
model e1 = factor1--factor5;
run;

/*ORIGINAL FACTORS DIFFICULT TO INTERPRET. TRY ROTATION TO GET INTERPRETABLE FACTORS.
	MANY OPTIONS FOR THIS. MAY HAVE TO TRY DIFFERENT OPTIONS AND SEE WHAT WORKS BEST.
	SEE SAS HELP FOR MORE OPTIONS. DEFAULT METHOD IS PRINCIPAL COMPONENTS TO GET THE 
	ORIGINAL FACTORS BEFORE ROTATION.*/


proc factor data=public.ipip 
			nfactors=5
			rotate=varimax
			out=ipipScores;
var e1--o10;
run;

/*OTHER METHODS EXIST FOR THIS! WE COULD SPEND ALL SEMESTER ON THE SUBJECT! */

proc factor data=public.Big5
			rotate=varimax
			nfact=5
			out=ipipscores
			method=ml; 
var e1--o10;
run;

/* We can then do modelling on top of the factors to see how responses to the groups of 
questions indicate customer behavior or other attributes.*/

data ipipscores;
set ipipscores;
female=0;
lefty=0;
if gender=2 then female=1;
if hand=2 then lefty=1;
run;

proc logistic data=ipipscores;
model female(event='1') = factor1--factor5;
run;

proc logistic data=ipipscores;
model lefty(event='1') = factor1--factor5;
run;


