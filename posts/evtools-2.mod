$PARAM CL = 1, V = 10, KA = 1

$PKMODEL cmt = "GUT,CENT", depot = TRUE

$PLUGIN evtools

$SET outvars = "CP"

$ERROR

if(TIME==0 && EVID==0) {
  evt::ev dose = evt::infuse(100, 2, 100.0/28.0);
  evt::retime(dose, 12);
  self.push(dose);
}

capture CP = CENT/V;
