$PARAM CL = 1, V = 10, KA = 1

$PARAM
DOSE = 100, INTERVAL = 24, DUR = 0.5, UNTIL = 168, WHERE = 2

$PKMODEL cmt = "GUT,CENT", depot = TRUE

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

$ERROR
capture CP = CENT/V;

if(fmod(TIME, reg.ii())==0 && CP > 3) {
  reg.amt(reg.amt() * 0.9);
  reg.rate(reg.amt() / DUR);
}

capture dose = reg.amt();

reg.execute();
