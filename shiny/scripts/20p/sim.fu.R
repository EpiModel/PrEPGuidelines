
## Packages
library("methods")
suppressPackageStartupMessages(library("EpiModelHIV"))


## Environmental Arguments
args <- commandArgs(trailingOnly = TRUE)
simno <- args[1]
jobno <- args[2]
covr <- as.numeric(args[3])
reall <- as.numeric(args[4])


## Parameters
fsimno <- paste(simno, jobno, sep = ".")
load("est/nwstats.10k.rda")

param <- param.msm(nwstats = st,
                   ai.scale = 1.19,
                   riskh.start = 2450,
                   prep.start = 2601,
                   prep.elig.model = "cdc3",
                   prep.coverage = covr,
                   prep.risk.int = 182,
                   prep.class.prob = reallocate_pcp(reall = reall - 0.019),
                   prep.class.hr = c(1, 0.69, 0.19, 0.05))
init <- init.msm(nwstats = st)
control <- control.msm(simno = fsimno,
                       start = 2601, nsteps = 52 * 60,
                       nsims = 32, ncores = 16,
                       save.int = 5000, verbose.int = 100,
                       save.network = FALSE, save.other = NULL,
                       initialize.FUN = reinit.msm)

## Simulation
netsim_hpc("est/p1.burnin.20p.rda", param, init, control, compress = "xz",
            save.min = TRUE, save.max = FALSE)

process_simfiles(min.n = 3)
