libname timeser "\\vmware-host\Shared Folders\Desktop\MSA\Time Series\Data\Class Data";
run;

/*-----------------------------*/
/* Introduction to Forecasting */
/*  and Time Series Structure  */
/*                             */
/*        Dr Susan Simmons     */
/*-----------------------------*/

/* Time Series Decomposition */

proc timeseries data=timeser.USAirlines plots=(series decomp sc);
	id date interval=month;
	var Passengers;
run;

proc timeseries data=timeser.USAirlines plots=(series decomp sc) seasonality=12;
	var Passengers;
run;
