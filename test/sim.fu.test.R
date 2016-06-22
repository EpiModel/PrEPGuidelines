
## Packages
library("methods")
suppressPackageStartupMessages(library("EpiModelHIVmsm"))


load("est/nwstats.10k.rda")
load("est/fit.10k.rda")

param <- param_msm(nwstats = st, 
                   ai.scale = 1.3231148,
                   riskh.start = 1, 
                   prep.start = 28)
init <- init_msm(nwstats = st, 
                 prev.B = 0.252, 
                 prev.W = 0.252)
control <- control_msm(simno = 1, 
                       nsteps = 27,
                       nsims = 1, 
                       ncores = 1, 
                       save.int = 5000,
                       save.other = c("attr", "temp", "riskh", "el", "p"))

sim <- netsim(est, param, init, control)

param <- param_msm(nwstats = st, 
                   ai.scale = 1.3231148,
                   riskh.start = 1, 
                   prep.start = 28,
                   prep.elig.model = "cdc3",
                   prep.coverage = 0.5,
                   prep.risk.int = 182,
                   prep.class.prob = reallocate_pcp(reall = 0),
                   prep.class.hr = c(1, 0.69, 0.19, 0.05))
init <- init_msm(nwstats = st)
control <- control_msm(simno = 1,
                       start = 28, 
                       nsteps = 35,
                       nsims = 1, 
                       ncores = 1,
                       verbose.int = 1,
                       save.other = NULL,
                       initialize.FUN = reinit_msm)

sim2 <- netsim(sim, param, init, control)

undebug(prep_msm)
debug(trans_msm)

at <- 28
dat <- reinit_msm(sim, param, init, control, s = 1)
dat <- aging_msm(dat, at)            # 0 ms
dat <- deaths_msm(dat, at)           # 18 ms
dat <- births_msm(dat, at)           # 30 ms
dat <- test_msm(dat, at)             # 7 ms
dat <- tx_msm(dat, at)               # 10 ms
dat <- prep_msm(dat, at)             # 0 ms
dat <- progress_msm(dat, at)         # 5 ms
dat <- update_vl_msm(dat, at)        # 10 ms
dat <- edges_correct_msm(dat, at)    # 1 ms
dat <- simnet_msm(dat, at)           # 120 ms
dat <- disclose_msm(dat, at)         # 2 ms
dat <- acts_msm(dat, at)             # 3 ms
dat <- condoms_msm(dat, at)          # 3 ms
dat <- riskhist_msm(dat, at)         # 1 ms
dat <- position_msm(dat, at)         # 1 ms
dat <- trans_msm(dat, at)            # 3 ms
dat <- prevalence_msm(dat, at)       # 6 ms

