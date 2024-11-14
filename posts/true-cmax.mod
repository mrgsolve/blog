$PLUGIN autodec

$SET outvars = c("CP", "Cmax")

$CMT @number 2

$PARAM CL = 1, V = 25, KA = 2.5

$PK
if(NEWIND <= 1 || EVID==1 || EVID==4) {
  Cmax = 0;   // Track Cmax in $DES
}

$DES
CP = A2/V;

if(CP > Cmax) Cmax = CP;

dxdt_A1 = -KA * A1;
dxdt_A2 =  KA * A1 - (CL/V)*A2;

$ERROR
CP = A2/V;

$CAPTURE Cmax CP
