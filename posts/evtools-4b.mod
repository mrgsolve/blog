$PARAM CL = 1, V = 10, KA = 1

$PARAM KIN = 100, KOUT = 0.02, EC50 = 7

$PARAM
DOSE = 100, INTERVAL = 24, DUR = 0.5, UNTIL = 168, WHERE = 2

$OMEGA 1

$CMT GUT CENT PD

$PLUGIN evtools

$GLOBAL
evt::regimen reg;

$PK

if(NEWIND <= 1) {
  reg.init(self);
  reg.amt(DOSE);
  reg.ii(INTERVAL);
  reg.rate(DOSE/DUR);
  reg.until(UNTIL);
  reg.cmt(WHERE);
}

PD_0 = KIN / KOUT;

double ec50 = exp(log(EC50) + ETA(1));

$ODE
dxdt_GUT = -KA * GUT;
dxdt_CENT = KA * GUT - (CL/V) * CENT;

double cp = CENT/V;
double inh = cp/(ec50 + cp);

dxdt_PD = KIN * (1-inh) - KOUT * PD;

$ERROR
capture CP = CENT/V;

if(fmod(TIME, reg.ii())==0 && PD < 3000) {
  reg.amt(reg.amt() * 0.9);
  reg.rate(reg.amt() / DUR);
}

capture dose = reg.amt();

reg.execute();
