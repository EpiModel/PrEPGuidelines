
## p1 analysis file

rm(list = ls())
library(mardham2)
source("papers/prepguidelines/analysis/fx.R")


# Table 2 -----------------------------------------------------------------

steps <- 52 *  10

## Base model: sim.n2000
load("papers/prepguidelines/data/sim.n2000.lim.rda")
sim.base <- truncate_sim(sim, at = 2600)

mn <- as.data.frame(sim.base)
ql <- as.data.frame(sim.base, out = "qnt", qval = 0.05)
qu <- as.data.frame(sim.base, out = "qnt", qval = 0.95)

# prevalence
round(data.frame(mean = mn$i.prev[steps],
                 ql = ql$i.prev[steps], qu = qu$i.prev[steps]), 3)

# incidence
round(data.frame(
  mean = (mean(tail(mn$incid, 100)) /
            ((1 - mean(tail(mn$i.prev, 100))) * mean(tail(mn$num, 100)))) * 52 * 100,
  ql = (mean(tail(ql$incid, 100)) /
          ((1 - mean(tail(ql$i.prev, 100))) * mean(tail(ql$num, 100)))) * 52 * 100,
  qu = (mean(tail(qu$incid, 100)) /
          ((1 - mean(tail(qu$i.prev, 100))) * mean(tail(qu$num, 100)))) * 52 * 100), 2)

ir.base <- (sum(mn$incid)/sum((1 - mn$i.prev) * mn$num)) * 52 * 1e5
ir.base

incid.base <- sum(mn$incid)
incid.base

## Condition 1a: sim.n2100
load("papers/prepguidelines/data/sim.n2100.lim.rda")
epi_stats(sim, ir.base, incid.base)

## Condition 1b: sim.n2101
load("papers/prepguidelines/data/sim.n2101.lim.rda")
epi_stats(sim, ir.base, incid.base)

## Condition 2a: sim.n2102
load("papers/prepguidelines/data/sim.n2102.lim.rda")
epi_stats(sim, ir.base, incid.base)

## Condition 2b: sim.n2103
load("papers/prepguidelines/data/sim.n2103.lim.rda")
epi_stats(sim, ir.base, incid.base)

## Condition 3a: sim.n2104
load("papers/prepguidelines/data/sim.n2104.lim.rda")
epi_stats(sim, ir.base, incid.base)

## Condition 3b: sim.n2105
load("papers/prepguidelines/data/sim.n2105.lim.rda")
epi_stats(sim, ir.base, incid.base)

## Condition J1: sim.n2106
load("papers/prepguidelines/data/sim.n2106.lim.rda")
epi_stats(sim, ir.base, incid.base)

## Condition J2: sim.n2108
load("papers/prepguidelines/data/sim.n2108.lim.rda")
epi_stats(sim, ir.base, incid.base)

## Condition J3: sim.n2109
load("papers/prepguidelines/data/sim.n2109.lim.rda")
epi_stats(sim, ir.base, incid.base)

# Table 3 ----------------------------------------------------------------------

rm(list = ls())
source("papers/prepguidelines/analysis/fx.R")

load("papers/prepguidelines/data/sim.n2000.lim.rda")
sim.base <- truncate_sim(sim, at = 2600)

mn <- as.data.frame(sim.base)
ir.base <- (sum(mn$incid)/sum((1 - mn$i.prev) * mn$num)) * 52 * 1e5
incid.base <- sum(mn$incid)


## Coverage ##

# 10% coverage
load("papers/prepguidelines/data/sim.n2245.lim.rda")
sim$param$prep.coverage
epi_stats(sim, ir.base, incid.base)

# 20% coverage
load("papers/prepguidelines/data/sim.n2246.lim.rda")
sim$param$prep.coverage
epi_stats(sim, ir.base, incid.base)

# 30% coverage
load("papers/prepguidelines/data/sim.n2247.lim.rda")
sim$param$prep.coverage
epi_stats(sim, ir.base, incid.base)

# 40% coverage
# base data

# 50% coverage
load("papers/prepguidelines/data/sim.n2249.lim.rda")
sim$param$prep.coverage
epi_stats(sim, ir.base, incid.base)

# 60% coverage
load("papers/prepguidelines/data/sim.n2250.lim.rda")
sim$param$prep.coverage
epi_stats(sim, ir.base, incid.base)

# 70% coverage
load("papers/prepguidelines/data/sim.n2251.lim.rda")
sim$param$prep.coverage
epi_stats(sim, ir.base, incid.base)

# 80% coverage
load("papers/prepguidelines/data/sim.n2252.lim.rda")
sim$param$prep.coverage
epi_stats(sim, ir.base, incid.base)

# 90% coverage
load("papers/prepguidelines/data/sim.n2253.lim.rda")
sim$param$prep.coverage
epi_stats(sim, ir.base, incid.base)


## Adherence ##

# 10% highly-adherent
load("papers/prepguidelines/data/sim.n2203.lim.rda")
sim$param$prep.class.prob[4]
epi_stats(sim, ir.base, incid.base)

# 20% highly-adherent
load("papers/prepguidelines/data/sim.n2212.lim.rda")
sim$param$prep.class.prob[4]
epi_stats(sim, ir.base, incid.base)

# 30% highly-adherent
load("papers/prepguidelines/data/sim.n2221.lim.rda")
sim$param$prep.class.prob[4]
epi_stats(sim, ir.base, incid.base)

# 40% highly-adherent
load("papers/prepguidelines/data/sim.n2230.lim.rda")
sim$param$prep.class.prob[4]
epi_stats(sim, ir.base, incid.base)

# 50% highly-adherent
load("papers/prepguidelines/data/sim.n2239.lim.rda")
sim$param$prep.class.prob[4]
epi_stats(sim, ir.base, incid.base)

# 60% highly-adherent
load("papers/prepguidelines/data/sim.n2248.lim.rda")
sim$param$prep.class.prob[4]
epi_stats(sim, ir.base, incid.base)

# 70% highly-adherent
load("papers/prepguidelines/data/sim.n2257.lim.rda")
sim$param$prep.class.prob[4]
epi_stats(sim, ir.base, incid.base)

# 80% highly-adherent
load("papers/prepguidelines/data/sim.n2266.lim.rda")
sim$param$prep.class.prob[4]
epi_stats(sim, ir.base, incid.base)

# 90% highly-adherent
load("papers/prepguidelines/data/sim.n2275.lim.rda")
sim$param$prep.class.prob[4]
epi_stats(sim, ir.base, incid.base)


## Risk Interval ##

# 3 months
load("papers/prepguidelines/data/sim.n2300.lim.rda")
epi_stats(sim, ir.base, incid.base)

# 6 months
# base data

# 12 months
load("papers/prepguidelines/data/sim.n2302.lim.rda")
epi_stats(sim, ir.base, incid.base)



