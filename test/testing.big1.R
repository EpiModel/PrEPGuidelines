
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
control <- control_msm(simno = 1,
                       nsteps = 200,
                       nsims = 16,
                       ncores = 16,
                       verbose.int = 1)

## Simulation
# load("est/fit.10k.rda")
# sim <- netsim(est, param, init, control)

netsim_hpc("est/fit.10k.rda", param, init, control, cp.save.int = 100,
            save.min = FALSE, save.max = TRUE)


# follow up
param <- param_msm(nwstats = st, ai.scale = 1.323, prep.coverage = 0)
init <- init_msm(nwstats = st)
control <- control_msm(simno = 1,
                       start = 201,
                       nsteps = 400,
                       nsims = 16,
                       ncores = 16,
                       save.other = NULL,
                       initialize.FUN = reinit_msm)

## Simulation
netsim_hpc("data/sim.n1.20160705.1230.rda", param, init, control,
           save.min = TRUE, save.max = FALSE)
