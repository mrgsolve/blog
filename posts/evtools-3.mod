$PARAM CL = 1, V = 10, KA = 1

$PARAM
DOSE = 100, INTERVAL = 24, DUR = 0.5, UNTIL = 168, WHERE = 2

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
  reg.rate(DOSE/DUR);
  reg.until(UNTIL);
  reg.cmt(WHERE);
}

$ERROR

reg.execute();

capture CP = CENT/V;
