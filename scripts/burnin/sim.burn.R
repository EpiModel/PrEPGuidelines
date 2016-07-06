
## Packages
library("methods")
suppressMessages(library("EpiModelHIV"))
library("EpiModelHPC")

## Environmental Arguments
args <- commandArgs(trailingOnly = TRUE)
simno <- args[1]
jobno <- args[2]

## Parameters
fsimno <- paste(simno, jobno, sep = ".")
load("est/nwstats.10k.rda")

# Base model
ai.scale <- 1.323
prev <- 0.253

param <- param_msm(nwstats = st, 
                   ai.scale = ai.scale,
                   riskh.start = 2450, 
                   prep.start = 2601)
init <- init_msm(nwstats = st, 
                 prev.B = prev, 
                 prev.W = prev)
control <- control_msm(simno = fsimno, 
                       nsteps = 50 * 52,
                       nsims = 16, 
                       ncores = 16, 
                       verbose.int = 100)

## Simulation
netsim_hpc("est/fit.10k.rda", param, init, control, compress = "xz",
            save.min = TRUE, save.max = TRUE)
