
## Packages
library("methods")
suppressMessages(library("EpiModelHIV"))
library("EpiModelHPC")


## Environmental Arguments
args <- commandArgs(trailingOnly = TRUE)
simno <- args[1]
jobno <- args[2]
model <- args[3]
covr <- as.numeric(args[4])
riskint <- as.numeric(args[5])
reall <- as.numeric(args[6])


## Parameters
fsimno <- paste(simno, jobno, sep = ".")
load("est/nwstats.10k.rda")

param <- param_msm(nwstats = st, ai.scale = 1.3231148,
                    riskh.start = 2450, prep.start = 2601,
                    prep.elig.model = model,
                    prep.coverage = covr,
                    prep.risk.int = riskint,
                    prep.class.prob = reallocate_pcp(reall = reall - 0.019),
                    prep.class.hr = c(1, 0.69, 0.19, 0.05))
init <- init_msm(nwstats = st)
control <- control_msm(simno = fsimno,
                       start = 2601, 
                       nsteps = 52 * 60,
                       nsims = 32, 
                       ncores = 16,
                       save.int = 100, 
                       verbose.int = 100,
                       save.network = FALSE, 
                       save.other = NULL,
                       initialize.FUN = reinit_msm)

## Simulation
netsim_hpc("est/p1.burnin.rda", param, init, control, compress = "xz",
            save.min = TRUE, save.max = FALSE)
