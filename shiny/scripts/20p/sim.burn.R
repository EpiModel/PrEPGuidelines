
## Packages
library("methods")
suppressPackageStartupMessages(library("EpiModelHIV"))

## Environmental Arguments
args <- commandArgs(trailingOnly = TRUE)
simno <- args[1]
jobno <- args[2]

## Parameters
fsimno <- paste(simno, jobno, sep = ".")
load("est/nwstats.10k.rda")

ai.scale <- 1.19
prev <- 0.195

param <- param.msm(nwstats = st, ai.scale = ai.scale,
                    riskh.start = 2450, prep.start = 2601)
init <- init.msm(nwstats = st, prev.B = prev, prev.W = prev)
control <- control.msm(simno = fsimno, nsteps = 50 * 52,
                        nsims = 16, ncores = 16, save.int = 5000,
                        verbose.int = 100, save.network = FALSE,
                        save.other = c("attr", "temp", "riskh", "el", "p"))

## Simulation
netsim_hpc("est/fit.10k.rda", param, init, control, compress = "xz",
            save.min = TRUE, save.max = TRUE)
