
## Packages
library("methods")
suppressPackageStartupMessages(library("mardham2"))


load("papers/prepguidelines/est/nwstats.10k.rda")
load("papers/prepguidelines/est/fit.10k.rda")

param <- param.mard(nwstats = st, ai.scale = 1.3231148,
                    riskh.start = 1, prep.start = 28)
init <- init.mard(nwstats = st, prev.B = 0.252, prev.W = 0.252)
control <- control.mard(simno = 1, nsteps = 27,
                        nsims = 1, ncores = 1, save.int = 5000,
                        save.other = c("attr", "temp", "riskh", "el", "p"))

sim <- netsim(est, param, init, control)

param <- param.mard(nwstats = st, ai.scale = 1.3231148,
                    riskh.start = 1, prep.start = 28,
                    prep.elig.model = "cdc3",
                    prep.coverage = 0.5,
                    prep.risk.int = 182,
                    prep.class.prob = reallocate_pcp(reall = 0),
                    prep.class.hr = c(1, 0.69, 0.19, 0.05))
init <- init.mard(nwstats = st)
control <- control.mard(simno = 1,
                        start = 28, nsteps = 35,
                        nsims = 1, ncores = 1,
                        verbose.int = 1,
                        save.other = NULL,
                        initialize.FUN = reinit.mard)

sim2 <- netsim(sim, param, init, control)

undebug(prep.mard)
debug(trans.mard)

at <- 28
dat <- reinit.mard(sim, param, init, control, s = 1)
dat <- aging.mard(dat, at)            # 0 ms
dat <- deaths.mard(dat, at)           # 18 ms
dat <- births.mard(dat, at)           # 30 ms
dat <- test.mard(dat, at)             # 7 ms
dat <- tx.mard(dat, at)               # 10 ms
dat <- prep.mard(dat, at)             # 0 ms
dat <- progress.mard(dat, at)         # 5 ms
dat <- update_vl.mard(dat, at)        # 10 ms
dat <- edges_correct.mard(dat, at)    # 1 ms
dat <- simnet.mard(dat, at)           # 120 ms
dat <- disclose.mard(dat, at)         # 2 ms
dat <- acts.mard(dat, at)             # 3 ms
dat <- condoms.mard(dat, at)          # 3 ms
dat <- riskhist.mard(dat, at)         # 1 ms
dat <- position.mard(dat, at)         # 1 ms
dat <- trans.mard(dat, at)            # 3 ms
dat <- prevalence.mard(dat, at)       # 6 ms

