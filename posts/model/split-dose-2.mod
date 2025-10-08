$plugin nm-vars evtools

$param
cl  = 1
v   = 20
ka1 = 0.07
ka2 = 0.7

$pk
F1 = 0.5;
F2 = 0.5;

if(CMT==1 && (EVID==1 || EVID==4)) {
  evt::bolus(self, AMT, 2);
}

$cmt depot1 depot2 central

$des
dxdt_depot1 = -ka1 * depot1;
dxdt_depot2 = -ka2 * depot2;
dxdt_central = ka1 * depot1 + ka2 * depot2 - (cl/v) * central;

$error
capture cp = central/v;
