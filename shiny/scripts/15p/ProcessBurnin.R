
## Process burn-in

# Examine output
sim <- merge_simfiles("0015", indir = "shiny/scripts/15p/data/", ftype = "min")
plot(sim, y = "i.prev", ylim = c(0.1, 0.2), qnts = 0.5)
abline(h = 0.15)

df <- as.data.frame(sim)
round(mean(tail(df$i.prev, 100)), 3)

# Save burn-in file for FU sims
sim <- merge_simfiles("0015", indir = "shiny/scripts/15p/data/", ftype = "max")
sim <- get_sims(sim, sims = "mean", var = "i.prev")
tail(as.data.frame(sim)$i.prev)

save(sim, file = "shiny/scripts/15p/p1.burnin.15p.rda")
