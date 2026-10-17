[ plugin ] Rcpp mrgx nm-vars

[ env ]

test <- try(
  get("run_transform", envir = .GlobalEnv, mode = "function"),
  silent = TRUE
)

if(inherits(test, "try-error")) {
  stop("Could not load run_transform function")
}

neq    <- 2
vecIn  <- vector(mode = "numeric", length = neq+1)
vecOut <- vector(mode = "numeric", length = neq+1)

[ global ]
Rcpp::Function trfun = mrgx::mt_fun();
Rcpp::NumericVector vecIn;
Rcpp::NumericVector vecOut;

[ preamble ]
trfun  = mrgx::get<Rcpp::Function>("run_transform");
vecIn  = mrgx::get<Rcpp::NumericVector>("vecIn", self);
vecOut = mrgx::get<Rcpp::NumericVector>("vecOut", self);

[ param ]
CL = 1
V = 20
KA = 1
SCALE = 0

[ cmt ] @number 2

[ des ]

for(local_int i=1; i<=_nEQ; ++i) {
  vecIn(i) = A(i);
}

vecOut = trfun(vecIn, SCALE);

DADT(1) = -KA * (A(1) + vecOut(1));
DADT(2) =  KA * (A(1) + vecOut(1)) - (CL/V) * (A(2) + vecOut(2));

[ error ]

for(local_int i=1; i<=_nEQ; ++i) {
  vecIn(i) = A(i);
}

vecOut = trfun(vecIn, SCALE);

capture vecOut1 = vecOut.at(1);
capture vecOut2 = vecOut.at(2);
