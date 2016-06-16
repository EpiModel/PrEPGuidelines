
## Process burn-in

# scp hyak:/gscratch/csde/camp/data/*.rda data/

# Examine output
sim <- merge_simfiles("0020", indir = "shiny/scripts/20p/data/", ftype = "min")
plot(sim, y = "i.prev", ylim = c(0.1, 0.25), qnts = 0.5)
abline(h = 0.2)

df <- as.data.frame(sim)
round(mean(tail(df$i.prev, 100)), 3)

# Save burn-in file for FU sims
sim <- merge_simfiles("0020", indir = "shiny/scripts/20p/data/", ftype = "max")
sim <- get_sims(sim, sims = "mean", var = "i.prev")
tail(as.data.frame(sim)$i.prev)

save(sim, file = "shiny/scripts/20p/p1.burnin.20p.rda")

# scp p1.burnin.20p.rda hyak:/gscratch/csde/camp/est/
