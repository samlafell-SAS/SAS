libname linalg 'Z:/Desktop/MSA/Linear Algebra/Code/SAS';
run;

proc princomp data=linalg.testscores out=testPCs ;
	var _all_;
run;

proc sgplot data=testPCs;
scatter x=Prin1 y =Prin2;
run;

proc princomp data=linalg.TESTSCORES
			out = covTestPCs
			cov;
var _all_;
run;

proc sgplot data=covTestPcs;
scatter x=Prin1 y=Prin2;
run;