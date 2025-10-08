$PLUGIN autodec evtools Rcpp

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

$PARAM
vpc = 1
cprob = 1

$INPUT
state = 1

$PK
A1_0 = 1;

$DES
dxdt_A1 = -A1 * k12 + A2 * k21 - A1 * k14;
dxdt_A2 =  A1 * k12 - A2 * k21 - A2 * k23 + A3 * k32 - A2 * k24;
dxdt_A3 =  A2 * k23 - A3 * k32 - A3 * k34;
dxdt_A4 =  A1 * k14 + A2 * k24 + A3 * k34;

$ERROR
if(EVID != 0) return;

if(state==1) Y = A1;
if(state==2) Y = A2;
if(state==3) Y = A3;
if(state==4) Y = A1 * k14 + A2 * k24 + A3 * k34;

xx = R::runif(0,1);

if(NEWIND == 2) {
  if(xx <= A1)  STATE = 1;
  if(xx > A1 && xx <= (A1+A2))  STATE = 2;
  if(xx > (A1+A2) && xx <= (A1+A2+A3))  STATE = 3;
  if(xx > (A1+A2+A3))  STATE = 4;
  if(STATE == 4) {
    self.SYSTEMOFF = 1;
    DEATH = TIME;
  }
}

if(!cprob) {
  for(int st = 1; st <= 4; ++st) {
    evt::replace(self, 0, st);
  }
  evt::bolus(self, 1, state);

}

$CAPTURE Y STATE DEATH
