
## build master.sh script ##

# base non-prep model
vars <- list(MODEL = "cdc3",
             COVR = 0,
             RISKINT = 182,
             REALL = 0)
qsub_master(simno.start = 2000,
            nsubjobs = 16, backfill = FALSE,
            vars = vars, append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "papers/prepguidelines/master.sh")


# Table 1
vars <- list(COVR = 0.4,
             MODEL = c("uai.mono2.nt.6mo", "uai.mono1.nt.6mo",
                       "uai.nonmonog", "uai.nmain", "ai.sd.mc", "uai.sd.mc",
                       "cdc1", "cdc2", "cdc3", "cdc4"),
             RISKINT = 182,
             REALL = 0.019)
qsub_master(simno.start = 2100,
            nsubjobs = 8, backfill = FALSE,
            vars = vars, append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "papers/prepguidelines/master.sh")

# Table 2: coverage x adherence
vars <- list(COVR = seq(0.1, 0.9, 0.1),
             MODEL = "cdc3",
             RISKINT = 182,
             REALL = seq(-0.5, 0.3, 0.1))
qsub_master(simno.start = 2200,
            nsubjobs = 8, backfill = 20,
            vars = vars, append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "papers/prepguidelines/master.sh")


# Table 2: risk interval

vars <- list(COVR = 0.4,
             MODEL = "cdc3",
             RISKINT = c(91, 182, 364),
             REALL = 0.019)
qsub_master(simno.start = 2300,
            nsubjobs = 8, backfill = FALSE,
            vars = vars, append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "papers/prepguidelines/master.sh")
