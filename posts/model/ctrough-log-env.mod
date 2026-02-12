$PLUGIN BH Rcpp mrgx

$GLOBAL
#include <boost/json/src.hpp>
#include <boost/json.hpp>

namespace json = boost::json;

json::array logg;

$PARAM CL = 1, V = 25, KA = 2.5, interval = 24

$PKMODEL cmt = "A,B", depot = TRUE

$PREAMBLE
logg.clear();

$PK
if(NEWIND <=1 ) {
  int dosen = 0;
}

$ERROR
capture cp = B/V;

// Part 1:
if(EVID==1) {
  json::object obj = {
    {"id", ID},
    {"dosen", ++dosen},
    {"interval", interval},
    {"time", TIME},
    {"ctrough", cp},
    {"source", "env"}
  };

  logg.push_back(obj);
}

// Part 2:
if(self.nrow == self.rown+1) {
  std::string result = json::serialize(logg);
  Rcpp::Environment env = mrgx::get_envir(self);
  env.assign("ctrough.json", result);
  logg.clear();
}
