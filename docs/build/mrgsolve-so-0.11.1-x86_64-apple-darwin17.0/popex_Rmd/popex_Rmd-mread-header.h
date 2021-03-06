// Source MD5: 23f1a8adc3d281271c075b75e708ea38


// FIXED:
// No fixed parameters.

// INCLUDES:


// NAMESPACES:

// MODEL HEADER FILES:
#include "mrgsolv.h"
#include "modelheader.h"

//INCLUDE databox functions:
#include "databox_cpp.h"

//USING plugins

// GLOBAL CODE BLOCK:
// GLOBAL VARS FROM BLOCKS & TYPEDEFS:
typedef double capture;
namespace {
  double CL;
  double V;
  double KA;
  capture IPRED;
  capture DV;
}

// GLOBAL START USER CODE:

// DEFS:
#define __INITFUN___ _model_popex__Rmd_main__
#define __ODEFUN___ _model_popex__Rmd_ode__
#define __TABLECODE___ _model_popex__Rmd_table__
#define __CONFIGFUN___ _model_popex__Rmd_config__
#define __REGISTERFUN___ R_init_popex_Rmd
#define _nEQ 2
#define _nPAR 4
#define GUT_0 _A_0_[0]
#define CENT_0 _A_0_[1]
#define GUT _A_[0]
#define CENT _A_[1]
#define dxdt_GUT _DADT_[0]
#define dxdt_CENT _DADT_[1]
#define TVKA _THETA_[0]
#define TVCL _THETA_[1]
#define TVV _THETA_[2]
#define WT _THETA_[3]
#define ECL _xETA(1)
#define EV _xETA(2)
#define EKA _xETA(3)
