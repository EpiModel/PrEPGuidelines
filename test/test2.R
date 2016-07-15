
## Test Script for stiPrEP Project

rm(list=ls())
suppressMessages(library("EpiModelHIV"))

# devtools::load_all("~/Dropbox/Dev/EpiModelHIV/EpiModelHIV")

# Main Test Script ----------------------------------------------------

load("est/nwstats.rda")

param <- param_msm(nwstats = st,
                   ai.scale = 1.3,
                   prev.coverage = 0)
init <- init_msm(nwstats = st,
                 prev.B = 0.253,
                 prev.W = 0.253)
control <- control_msm(simno = 1,
                       nsteps = 30,
                       nsims = 1,
                       ncores = 1,
                       verbose.int = 1)

load("est/fit.rda")
sim <- netsim(est, param, init, control)


# Testing/Timing ------------------------------------------------------

dat <- initialize_msm(est, param, init, control, s = 1)

for (at in 2:30) {
  dat <- aging_msm(dat, at)       ## <1 ms
  dat <- deaths_msm(dat, at)      ## 4 ms
  dat <- births_msm(dat, at)      ## 6 ms
  dat <- test_msm(dat, at)        ## 2 ms
  dat <- tx_msm(dat, at)          ## 3 ms
  dat <- prep_msm(dat, at)        ## 2 ms
  dat <- progress_msm(dat, at)    ## 2 ms
  dat <- vl_msm(dat, at)          ## 3 ms
  dat <- simnet_msm(dat, at)      ## 53 ms
  dat <- disclose_msm(dat, at)    ## 1 ms
  dat <- acts_msm(dat, at)        ## 1 ms
  dat <- condoms_msm(dat, at)     ## 2 ms
  dat <- riskhist_msm(dat, at)    ## 4 ms
  dat <- position_msm(dat, at)    ## 1 ms
  dat <- trans_msm(dat, at)       ## 1 ms
  dat <- prevalence_msm(dat, at)  ## 1 ms
  cat(at, ".", sep = "")
}

library(microbenchmark)

res <- microbenchmark(simnet_msm(dat, at = 2), times = 100)
summary(res, unit = "ms")

