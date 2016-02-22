
## Packages
library("methods")
suppressPackageStartupMessages(library("EpiModelHIVmsm"))
library(EasyABC)

## Parameters

get_params <- function(x) {
  set.seed(x[1])
  require("EpiModelHIVmsm")
  load("est/nwstats.10k.rda")
  param <- param.mard(nwstats = st, ai.scale = x[2],
                      riskh.start = 5000, prep.start = 5000)
  init <- init.mard(nwstats = st, prev.B = x[3], prev.W = x[3])
  control <- control.mard(simno = 1, nsteps = 70 * 52,
                          nsims = 1, ncores = 1, save.int = 5000,
                          verbose.int = 100, save.network = FALSE, save.other = NULL)
  load("est/fit.10k.rda")
  sim <- netsim(est, param, init, control)
  df <- tail(as.data.frame(sim), 500)
  out1 <- mean(df$i.prev)
  out2 <- unname(coef(lm(df$i.prev ~ seq_along(df$time)))[2])
  out <- c(out1, out2)
  return(out)
}

priors <- list(c("unif", 0.7, 1.15), c("unif", 0.08, 0.10))
targets <- c(0.10, 0)

a <- ABC_sequential(method = "Lenormand",
                    model = get_params,
                    prior = priors,
                    nb_simul = 100,
                    summary_stat_target = targets,
                    p_acc_min = 0.1,
                    progress_bar = TRUE,
                    n_cluster = 16,
                    use_seed = TRUE)

save(a, file = "data/abc.fit.10p.rda")

# plot(density(a$param[, 1]))
# plot(density(a$param[, 2]))
# plot(density(a$stats[, 1]))
# plot(density(a$stats[, 2]))
# abline(v = prev.targ, col = "red", lty = 2)
#
# library(MASS)
# kde1 <- kde2d(a$param[,1], a$param[,2], n = 50)
#
# kde1.max <- kde1$z == max(kde1$z)
# kde1.row <- which.max(rowSums(kde1.max))
# kde1.col <- which.max(colSums(kde1.max))
# bestfit1 <- c(kde1$x[kde1.row], kde1$y[kde1.col])
# bestfit1
#
# par(mar = c(3,3,1,1), mgp = c(2,1,0))
# image(kde1, col = heat.colors(100), ylab = "Act Rate Multiplier",
#       xlab = "Starting Prevalence")
# contour(kde1, add = TRUE, drawlabels = FALSE)
# points(bestfit1[1], bestfit1[2], pch = 20, col = "blue", cex = 2)
