$plugin nm-vars evtools

$param
cl  = 1
v   = 20
ka1 = 2
ka2 = 0.5

$pk
F1 = 0.5;
F2 = 0.5;

if(CMT==1 && (EVID==1 || EVID==4)) {
  evt::infuse(self, AMT, 2, AMT/10);
}

$cmt depot1 depot2 central

$des
dxdt_depot1 = -ka1 * depot1;
dxdt_depot2 = -ka2 * depot2;
dxdt_central = ka1 * depot1 + ka2 * depot2 - (cl/v) * central;

$error
capture cp = central/v;
