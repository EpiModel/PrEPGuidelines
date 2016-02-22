## Packages
library("methods")
suppressPackageStartupMessages(library("mardham2"))


# Burn-In Model -----------------------------------------------------------

load("papers/prepguidelines/est/nwstats.10k.rda")
load("papers/prepguidelines/est/fit.10k.rda")

param <- param.mard(nwstats = st, ai.scale = 1.3231148,
                    riskh.start = 2450, prep.start = 2601)
init <- init.mard(nwstats = st, prev.B = 0.252, prev.W = 0.252)
control <- control.mard(simno = 1, nsteps = 10,
                        nsims = 1, ncores = 1, save.int = 5000,
                        verbose.int = 1, save.network = FALSE,
                        save.other = c("attr", "temp", "riskh", "el", "p"))

sim <- netsim_par(est, param, init, control)
