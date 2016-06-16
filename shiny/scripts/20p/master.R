
## build master.sh script ##

vars <- list(MODEL = "cdc3",
             COVR = 0,
             RISKINT = 182,
             REALL = 0.019)
qsub_master(simno.start = 4000,
            nsubjobs = 3,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "shiny/scripts/20p/master.sh")

vars <- list(COVR = seq(0.1, 0.9, 0.1),
             MODEL = "cdc3",
             RISKINT = 182,
             REALL = seq(-0.5, 0.3, 0.1))
qsub_master(simno.start = 4200,
            nsubjobs = 3,
            backfill = 25,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "shiny/scripts/20p/master.sh")

