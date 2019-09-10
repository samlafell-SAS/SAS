libname Time 'Z:/Desktop/MSA/Time Series/Data/Class Data';
run;

proc esm data=Time.Steel print=all plot=all lead=24;
	forecast steelshp / model=simple;
run;


proc esm data=Time.USAirlines print=all plot=all lead=24;
	id date interval=month;
	forecast Passengers / model=simple;
run;


proc esm data=Time.Steel print=all plot=all lead=24;
	forecast steelshp / model=linear;
run;



/* Building a Linear Exponential Smoothing Model */

proc esm data=Time.Steel print=all plot=all lead=24;
	forecast steelshp / model=double;
run;

proc esm data=Time.Steel print=all plot=all lead=24;
	forecast steelshp / model=linear;
run;

proc esm data=Time.Steel print=all plot=all lead=24;
	forecast steelshp / model=damptrend;
run;


proc esm data=Time.USAirlines print=all plot=all lead=24;
	id date interval=month;
	forecast Passengers / model=linear;
run;



/* Building a Seasonal Exponential Smoothing Model */

proc esm data=Time.USAirlines print=all plot=all 
		 seasonality=12 lead=24 outfor=test1;
	forecast Passengers / model=addseasonal;
run;


proc esm data=Time.USAirlines print=all plot=all 
		 seasonality=12 lead=24;
	forecast Passengers / model=multseasonal;
run;


proc esm data=Time.USAirlines print=all plot=all 
		 seasonality=12 lead=24;
	forecast Passengers / model=addwinters;
run;

proc esm data=Time.USAirlines print=all plot=all 
		 seasonality=12 lead=24;
	forecast Passengers / model=multwinters;
run;


proc esm data=Time.USAirlines print=all plot=all lead=12 back=12 seasonality=12;
	forecast Passengers / model=multwinters;
run;

proc esm data=Time.USAirlines print=all plot=all 
		 seasonality=12 lead=12 back=12 outfor=test;
	forecast Passengers / model=multwinters;
run;

data test2;
set test;
if _TIMEID_>207;
abs_error=abs(error);
abs_err_obs=abs_error/abs(actual);
run;

proc means data=test2 mean;
var abs_error abs_err_obs;
run;

