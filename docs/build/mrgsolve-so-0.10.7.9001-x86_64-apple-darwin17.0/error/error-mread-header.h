// Source MD5: 3753128366d3bfcb88580a407cf22c23


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
  capture CP;
}

// GLOBAL START USER CODE:

// DEFS:
#define __INITFUN___ _model_error_main__
#define __ODEFUN___ _model_error_ode__
#define __TABLECODE___ _model_error_table__
#define __CONFIGFUN___ _model_error_config__
#define __REGISTERFUN___ R_init_error
#define _nEQ 1
#define _nPAR 3
#define CENT_0 _A_0_[0]
#define CENT _A_[0]
#define dxdt_CENT _DADT_[0]
#define CL _THETA_[0]
#define V _THETA_[1]
#define KA _THETA_[2]
