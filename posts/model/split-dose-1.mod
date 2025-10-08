$plugin nm-vars

$param
cl  = 1
v   = 20
ka1 = 0.07
ka2 = 0.7

$cmt depot1 depot2 central

$des
dxdt_depot1 = -ka1 * depot1;
dxdt_depot2 = -ka2 * depot2;
dxdt_central = ka1 * depot1 + ka2 * depot2 - (cl/v) * central;

$error
capture cp = central/v;
