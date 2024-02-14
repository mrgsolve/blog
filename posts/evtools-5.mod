$PARAM CL = 1, V = 10, KA = 1

$PARAM
DOSE = 100, INTERVAL = 24, DUR = 0.5, UNTIL = 540, WHERE = 2

$PKMODEL cmt = "GUT,CENT", depot = TRUE

$SET outvars = "CP"

$PLUGIN evtools

$GLOBAL
evt::regimen reg;

$PK

if(NEWIND <= 1) {
  reg.init(self);
  reg.amt(DOSE);
  reg.ii(INTERVAL);
  reg.cmt(WHERE);
  reg.until(UNTIL);
  reg.flagnext();
}

$ERROR
if(evt::near(TIME, 168) && EVID > 0) {
  reg.ii(reg.ii() / 2.0);
  reg.amt(reg.amt() / 2.0);
}

if(evt::near(TIME, 300) && EVID > 0) {
  reg.ii(reg.ii() * 4);
  reg.amt(reg.amt() * 4);
}

reg.execute();

capture CP = CENT/V;
