
## Condition 1a: sim.n2100
load("papers/prepguidelines/data/sim.n2100.lim.rda")
sim <- truncate_sim(sim, at = 2600)
df <- as.data.frame(sim)
mean(tail(df$prepElig / (df$num - (1 - (df$i.prev * df$num))), 100))

## Condition 1b: sim.n2101
load("papers/prepguidelines/data/sim.n2101.lim.rda")
sim <- truncate_sim(sim, at = 2600)
df <- as.data.frame(sim)
mean(tail(df$prepElig / (df$num - (1 - (df$i.prev * df$num))), 100))


## Condition 2a: sim.n2102
load("papers/prepguidelines/data/sim.n2102.lim.rda")
sim <- truncate_sim(sim, at = 2600)
df <- as.data.frame(sim)
mean(tail(df$prepElig / (df$num - (1 - (df$i.prev * df$num))), 100))


## Condition 2b: sim.n2103
load("papers/prepguidelines/data/sim.n2103.lim.rda")
sim <- truncate_sim(sim, at = 2600)
df <- as.data.frame(sim)
mean(tail(df$prepElig / (df$num - (1 - (df$i.prev * df$num))), 100))


## Condition 3a: sim.n2104
load("papers/prepguidelines/data/sim.n2104.lim.rda")
sim <- truncate_sim(sim, at = 2600)
df <- as.data.frame(sim)
mean(tail(df$prepElig / (df$num - (1 - (df$i.prev * df$num))), 100))


## Condition 3b: sim.n2105
load("papers/prepguidelines/data/sim.n2105.lim.rda")
sim <- truncate_sim(sim, at = 2600)
df <- as.data.frame(sim)
mean(tail(df$prepElig / (df$num - (1 - (df$i.prev * df$num))), 100))


## Condition J1: sim.n2106
load("papers/prepguidelines/data/sim.n2106.lim.rda")
sim <- truncate_sim(sim, at = 2600)
df <- as.data.frame(sim)
mean(tail(df$prepElig / (df$num - (1 - (df$i.prev * df$num))), 100))


## Condition J2: sim.n2108
load("papers/prepguidelines/data/sim.n2108.lim.rda")
sim <- truncate_sim(sim, at = 2600)
df <- as.data.frame(sim)
mean(tail(df$prepElig / (df$num - (1 - (df$i.prev * df$num))), 100))


## Condition J3: sim.n2109
load("papers/prepguidelines/data/sim.n2109.lim.rda")
sim <- truncate_sim(sim, at = 2600)
df <- as.data.frame(sim)
mean(tail(df$prepElig / (df$num - (1 - (df$i.prev * df$num))), 100))

