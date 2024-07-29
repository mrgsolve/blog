$CMT @number 4

$PLUGIN autodec evtools

$PARAM
k12 = 0.1/2
k21 = 0.1/2
k23 = 0.1/2
k32 = 0.1/2
k14 = 0.1/2
k24 = 0.1/2
k34 = 0.1/2

$INPUT
firstobs = 0
state = 1
statemax = 1

$MAIN
A1_0 = 1;
A2_0 = 0;
A3_0 = 0;
A4_0 = 0;

$DES

dxdt_A1 = -A1 * k12 + A2 * k21                       - A1 * k14;
dxdt_A2 =  A1 * k12 - A2 * k21 - A2 * k23 + A3 * k32 - A2 * k24;
dxdt_A3 =  A2 * k23 - A3 * k32                       - A3 * k34;
dxdt_A4 =  A1 * k14 + A2 * k24 + A3 * k34;

$ERROR

if(state==1 && EVID==0) Y = A1;
if(state==2 && EVID==0) Y = A2;
if(state==3 && EVID==0) Y = A3;
if(state==4 && EVID==0) {
  Y = A1 * k14 + A2 * k24 + A3 * k34;
}

if(EVID==0) {
  for(int i = 1; i <= 4; ++i) {
    evt::replace(self, 0, i);
  }
  evt::replace(self, 1, state);
}

$CAPTURE Y
