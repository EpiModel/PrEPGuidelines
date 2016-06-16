
## Process burn-in

# Examine output
# scp hyak:/gscratch/csde/camp/data/*.rda data/
sim <- merge_simfiles("0010", indir = "shiny/scripts/10p/data/", ftype = "min")
plot(sim, y = "i.prev", ylim = c(0, 0.15), qnts = 0.5)
abline(h = 0.10)

df <- as.data.frame(sim)
round(mean(tail(df$i.prev, 100)), 3)

# Save burn-in file for FU sims
sim <- merge_simfiles("0010", indir = "shiny/scripts/10p/data/", ftype = "max")
sim <- get_sims(sim, sims = "mean", var = "i.prev")
tail(as.data.frame(sim)$i.prev)

save(sim, file = "shiny/scripts/10p/p1.burnin.10p.rda")
# scp p1.burnin.10p.rda hyak:/gscratch/csde/camp/est/
