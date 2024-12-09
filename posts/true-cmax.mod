$PLUGIN autodec

$SET outvars = c("CP", "Cmax")

$CMT @number 2

$PARAM CL = 1, V = 25, KA = 2.5

$PK
if(NEWIND <= 1 || EVID==1 || EVID==4) {
  Cmax = 0;   // Track Cmax in $DES
}

$DES
CPode = A2/V;

if(CPode > Cmax) Cmax = CPode;

dxdt_A1 = -KA * A1;
dxdt_A2 =  KA * A1 - CL * CPode;

$ERROR
CP = A2/V;

$CAPTURE Cmax CP
