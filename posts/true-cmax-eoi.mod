$PLUGIN autodec

$CMT @number 2

$PARAM CL = 1, V = 25, KA = 1.5

$PK
if(NEWIND <= 1 || EVID==1 || EVID==4) {
  Cmax = 0;   // Track Cmax in $DES
  Ceoi = 0;   // CP at end of infusion
}

$DES
CP = A2/V;

if(CP > Cmax) Cmax = CP;

dxdt_A1 = -KA * A1;
dxdt_A2 =  KA * A1 - (CL/V)*A2;

$ERROR
CP = A2/V;

if(EVID==9) Ceoi = CP;

$CAPTURE Cmax Ceoi CP
