// Source MD5: 23f1a8adc3d281271c075b75e708ea38

#include "popex_Rmd-mread-header.h"

// PREAMBLE CODE BLOCK:
__BEGIN_config__
__END_config__

// MAIN CODE BLOCK:
__BEGIN_main__
CL = exp(log(TVCL) + 0.75*log(WT/70) + ECL);
V  = exp(log(TVV)  +      log(WT/70) + EV );
KA = exp(log(TVKA)                   + EKA);
__ADVAN2_TRANS2__
__END_main__

// DIFFERENTIAL EQUATIONS:
__BEGIN_ode__
DXDTZERO();
__END_ode__

// TABLE CODE BLOCK:
__BEGIN_table__
IPRED = CENT/V;
DV = IPRED*exp(EPS(1));
_capture_[0] = CL;
_capture_[1] = V;
_capture_[2] = ECL;
_capture_[3] = IPRED;
_capture_[4] = DV;
__END_table__
