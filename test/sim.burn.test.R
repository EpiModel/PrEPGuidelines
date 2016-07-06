## Packages
library("methods")
suppressMessages(library("EpiModelHIV"))


# Burn-In Model -----------------------------------------------------------

load("est/nwstats.10k.rda")
load("est/fit.10k.rda")

param <- param_msm(nwstats = st, ai.scale = 1.3231148,
                    riskh.start = 2450, prep.start = 2601)
init <- init_msm(nwstats = st, prev.B = 0.252, prev.W = 0.252)
control <- control_msm(simno = 1, nsteps = 10,
                        nsims = 1, ncores = 1, save.int = 5000,
                        verbose.int = 1, save.network = FALSE,
                        save.other = c("attr", "temp", "riskh", "el", "p"))

sim <- netsim(est, param, init, control)


plot(sim, y = "i.prev")
abline(h = 0.26)
