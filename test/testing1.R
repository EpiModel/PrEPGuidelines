
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
                       nsteps = 52 * 5,
                       nsims = 1, 
                       ncores = 1, 
                       save.nwstats = TRUE,
                       verbose.int = 1)

## Simulation
load("est/fit.10k.rda")
sim <- netsim(est, param, init, control)

library(EpiModelHPC)
process_simfiles(100, indir = "test/data", outdir = "test/data")

# Base model
library(EpiModelHIV)
ai.scale <- 1.323
prev <- 0.253
load("est/nwstats.10k.rda")
param <- param_msm(nwstats = st, 
                   ai.scale = ai.scale,
                   riskh.start = 2450, 
                   prep.start = 2601)
init <- init_msm(nwstats = st, 
                 prev.B = prev, 
                 prev.W = prev)
control <- control_msm(simno = 201, 
                       nsteps = 50 * 52,
                       nsims = 1, 
                       ncores = 1, 
                       verbose.int = 1,
                       save.nwstats = TRUE)

load("est/fit.10k.rda")
sim <- netsim(est, param, init, control)

debug(trans_msm)

df <- as.data.frame(sim)
hist(df$ip.diff)
hist(df$rp.diff)


