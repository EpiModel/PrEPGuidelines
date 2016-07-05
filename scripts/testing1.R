
## Packages
suppressMessages(library("EpiModelHIV"))

load("est/nwstats.10k.rda")

param <- param_msm(nwstats = st, 
                   ai.scale = 1.323,
                   prep.coverage = 0)
init <- init_msm(nwstats = st, 
                 prev.B = 0.253, 
                 prev.W = 0.253)
control <- control_msm(simno = 0.253, 
                       nsteps = 52 * 10,
                       nsims = 1, 
                       ncores = 1, 
                       verbose.int = 1)

## Simulation
load("est/fit.10k.rda")
sim <- netsim(est, param, init, control)
