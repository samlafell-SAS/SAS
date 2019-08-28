libname logistic "\\vmware-host\Shared Folders\Desktop\MSA\Logistic Regression\Logistic Regression Data Sets";

proc logistic data=logistic.lowbwt plots(only)=(oddsratio);
	class race(ref='white') / param = ref;
	model low(event='1') = age race lwt smoke
							/ clodds=pl clparm=pl;
run;
quit
