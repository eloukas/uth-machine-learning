/* define the path of dataset */
filename reffile '/folders/myfolders/sasuser.v94/Lab6_priorities_perifereion.xlsx';

/* import the dataset */
proc import datafile=reffile
	dbms=xlsx
	out=perifereies;
	getnames=yes;
run;

/* Show contents of dataset */
proc contents data=perifereies; run;

/* Use corr prodecure to show the correlation between the variables */
proc corr nosimple;
var KRITI	ANATOLIKI_MAKEDONIA_THRAKI	ATTIKI	VOREIO_AIGAIO	
	DYTIKI_ELLADA	DYTIKI_MAKEDONIA	IPIROS	THESSALIA	IONIA_NISIA	
	KENTRIKI_MAKEDONIA	NOTIO_AIGAIO	PELOPONNISOS	STEREA_ELLADA;
run;

/* PCA ANALYSIS */
proc princomp data=perifereies out=prin;
var KRITI	ANATOLIKI_MAKEDONIA_THRAKI	ATTIKI	VOREIO_AIGAIO	
	DYTIKI_ELLADA	DYTIKI_MAKEDONIA	IPIROS	THESSALIA	IONIA_NISIA	
	KENTRIKI_MAKEDONIA	NOTIO_AIGAIO	PELOPONNISOS	STEREA_ELLADA;
run;

/* print principal components */
proc print data=prin;
var prin1-prin13;
run;

/* Calculate the mean values of principal components for correctness purpose.
   Mean values should be zero!
*/
proc means data=prin mean var maxdec=4;
var prin1-prin13;
run;

/* Show the correlation between principal components, it should be zero!
   since the principal components are uncorrelated
*/
proc corr data=prin;
var prin1-prin13;
run;