
library("methods")
suppressMessages(library("EpiModelHIV"))
library("EpiModelHPC")

load("est/nwstats.10k.rda")

param <- param_msm(nwstats = st, 
                   ai.scale = 1.323,
                   prep.coverage = 0)
init <- init_msm(nwstats = st, 
                 prev.B = 0.253, 
                 prev.W = 0.253)
control <- control_msm(simno = 0.253, 
                       nsteps = 52 * 10,
                       nsims = 16, 
                       ncores = 16, 
                       verbose.int = 1)

## Simulation
load("est/fit.10k.rda")
sim <- netsim(est, param, init, control)

netsim_hpc("est/fit.10k.rda", param, init, control)
