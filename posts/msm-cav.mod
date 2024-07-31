$PLUGIN autodec evtools

$CMT @annotated
A1 : 0 : No CAV
A2 : 0 : Mild or moderate CAV
A3 : 0 : Severe CAV
A4 : 0 : Death

$PARAM @annotated
k12 : 0.1 : None to mild or moderate
k21 : 0.1 : Mild or moderate to none
k23 : 0.1 : Mild or moderate to severe
k32 : 0.1 : Severe to mild or moderate
k14 : 0.1 : None to death
k24 : 0.1 : Mild or moderate to death
k34 : 0.1 : Severe to death

$INPUT
firstobs = 0
state = 1
statemax = 1

$PK
A1_0 = 1;

$DES
dxdt_A1 = -A1 * k12 + A2 * k21 - A1 * k14;
dxdt_A2 =  A1 * k12 - A2 * k21 - A2 * k23 + A3 * k32 - A2 * k24;
dxdt_A3 =  A2 * k23 - A3 * k32 - A3 * k34;
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
