$PARAM CL = 1, V = 10, KA = 1

$PKMODEL cmt = "GUT,CENT", depot = TRUE

$SET outvars = "CP"

$PLUGIN evtools

$ERROR

if(TIME==0) evt::infuse(self, 100, 2, 100.0/20.0);

capture CP = CENT/V;
