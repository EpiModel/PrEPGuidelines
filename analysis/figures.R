
library("EpiModelHIVmsm")
setwd("~/Dropbox/Dev/Camp/")

# Figure 1 ----------------------------------------------------------------

# Line plots of cumulative PIA and NNT

steps <- 1:520
df.nia <- data.frame(rep(NA, 256))
df.pia <- data.frame(rep(NA, 256))
df.nnt <- data.frame(rep(NA, 256))

for (i in seq_along(steps)) {
  load("papers/prepguidelines/data/sim.n2000.lim.rda")
  sim.base <- truncate_sim(sim, at = 2600)

  mn.base <- head(as.data.frame(sim.base), steps[i])
  ir.base <- (sum(mn.base$incid)/sum((1 - mn.base$i.prev) * mn.base$num)) * 52 * 1e5
  incid.base <- sum(mn.base$incid)


  load("papers/prepguidelines/data/sim.n2108.lim.rda")
  sim <- truncate_sim(sim, at = 2600)
  mn <- head(as.data.frame(sim), steps[i])

  # NIA calculation
  ir <- (colSums(head(sim$epi$incid, steps[i])))/
    sum(head(1 - mn$i.prev, steps[i])  * head(mn$num, steps[i])) * 52 * 1e5
  df.nia[, i] <- round(ir.base - unname(ir), 1)

  # PIA calculation
  df.pia[, i] <- df.nia[, i] / ir.base

  # NNT calculation
  py.on.prep <- unname(colSums(head(sim$epi$prepCurr, steps[i])))/52
  df.nnt[, i] <- py.on.prep/(incid.base - unname(colSums(head(sim$epi$incid, steps[i]))))
  cat("*")
}
names(df.nia) <- names(df.pia) <- names(df.nnt) <- 1:520
# boxplot(df.nia, outline = FALSE)
# boxplot(df.pia, outline = FALSE)
# boxplot(df.nnt, outline = FALSE)

library(wesanderson)
pal <- wes_palette("Zissou")[5]

pia.mean <- tail(unname(apply(df.pia, 2, mean)), 500)
pia.lwr <- tail(unname(apply(df.pia, 2, quantile, 0.25)), 500)
pia.upr <- tail(unname(apply(df.pia, 2, quantile, 0.75)), 500)

## For Paper
# pdf(file = "papers/prepguidelines/analysis/P1Fig1.pdf", height = 6, width = 12, pointsize = 16)
tiff(filename = "papers/prepguidelines/analysis/Fig1.tiff", height = 4, width = 8, units = "in", res = 250)

par(mfrow = c(1, 1), mar = c(3,3,2.5,1), mgp = c(2,1,0))
plot(pia.mean, type = "n", ylim = c(0, 0.35), lwd = 3,
     main = "Cumulative PIA over 10 Years", xlab = "Week", ylab = "Percent Infections Averted")
xx <- c(1:(length(pia.mean)), (length(pia.mean)):1)
yy <- c(pia.lwr, rev(pia.upr))
polygon(xx, yy, col = EpiModel::transco(pal, alpha = 0.3), border = NA)
lines(pia.mean, lwd = 2, col = pal)

dev.off()


# Figure 2 ----------------------------------------------------------------

# Box Plots by Indications

par(mfrow = c(1, 2), mar = c(3,3,2.5,1), mgp = c(2,1,0))
# pal <- wesanderson::wes_palette("Moonrise", n = 9, type = "continuous")

load("papers/prepguidelines/data/sim.n2000.lim.rda")
sim.base <- truncate_sim(sim, at = 2600)
mn.base <- as.data.frame(sim.base)
ir.base <- (sum(mn.base$incid)/sum((1 - mn.base$i.prev) * mn.base$num)) * 52 * 1e5
incid.base <- sum(mn.base$incid)


sims <- c(2100:2106, 2108:2109)
df.pia <- data.frame(rep(NA, 256))
df.nnt <- data.frame(rep(NA, 256))
for (i in seq_along(sims)) {
  load(list.files("papers/prepguidelines/data", pattern = as.character(sims[i]), full.names = TRUE))
  sim <- truncate_sim(sim, at = 2600)
  mn <- as.data.frame(sim)
  ir <- (colSums(sim$epi$incid, na.rm = TRUE))/
    sum((1 - mn$i.prev)  * mn$num) * 52 * 1e5
  vec.nia <- round(ir.base - unname(ir), 1)
  df.pia[, i] <- vec.nia / ir.base
  
  py.on.prep <- unname(colSums(sim$epi$prepCurr))/52
  df.nnt[, i] <- py.on.prep/(incid.base - unname(colSums(sim$epi$incid)))
  
}
names(df.pia) <- names(df.nnt) <- c("1a", "1b", "2a", "2b", "3a", "3b", "J1", "J2", "J3")
head(df.pia)
head(df.nnt)

pal <- wes_palette("Zissou")[c(1, 5)]
# pdf(file = "papers/prepguidelines/analysis/P1Fig2.pdf", height = 6, width = 12, pointsize = 16)
tiff(filename = "papers/prepguidelines/analysis/Fig2.tiff", height = 4, width = 8, units = "in", res = 250)
par(mfrow = c(1, 2), mar = c(3,3,2.5,1), mgp = c(2,1,0))

# Left Panel: PIA
boxplot(df.pia, outline = FALSE, medlwd = 1.1, 
        col = c(rep(pal[1], 6), rep(pal[2], 3)),
        main = "PIA by Behavioral Indication",
        xlab = "Behavioral Indication", ylab = "Percent Infections Averted")

# Right Panel: NNT
boxplot(df.nnt, outline = FALSE, medlwd = 1.1,
        col = c(rep(pal[1], 6), rep(pal[2], 3)),
        main = "NNT by Behavioral Indication",
        xlab = "Behavioral Indication", ylab = "Number Needed to Treat")

dev.off()


# Figure 3 ----------------------------------------------------------------

## Heatmap/Tile Plot for Coverage x Adherence

sims <- 2200:2280
pia <- rep(NA, length(sims))
nia <- rep(NA, length(sims))
nnt <- rep(NA, length(sims))
cov <- rep(NA, length(sims))
adh <- rep(NA, length(sims))
df <- data.frame(sims, cov, adh, pia, nia, nnt)

load("papers/prepguidelines/data/sim.n2000.lim.rda")
sim.base <- truncate_sim(sim, at = 2600)
mn.base <- as.data.frame(sim.base)
ir.base <- (sum(mn.base$incid)/sum((1 - mn.base$i.prev) * mn.base$num)) * 52 * 1e5
incid.base <- sum(mn.base$incid)

for (i in seq_along(sims)) {
  load(list.files("papers/prepguidelines/data", pattern = as.character(sims[i]), full.names = TRUE))
  df$cov[i] <- sim$param$prep.coverage
  df$adh[i] <- sim$param$prep.class.prob[4]

  sim <- truncate_sim(sim, at = 2600)
  mn <- as.data.frame(sim)

  ir <- (colSums(sim$epi$incid)/
           sum((1 - mn$i.prev) * mn$num)) * 52 * 1e5
  vec.nia <- round(ir.base - unname(ir), 1)
  df$nia[i] <- mean(vec.nia)

  vec.pia <- vec.nia/ir.base
  df$pia[i] <- mean(vec.pia)

  py.on.prep <- unname(colSums(sim$epi$prepCurr))/52
  vec.nnt <- py.on.prep/(incid.base - unname(colSums(sim$epi$incid)))
  df$nnt[i] <- mean(vec.nnt)
}


# pia plots
pia.loess <- loess(pia ~ cov * adh, data = df, degree = 2, span = 0.15)
pia.fit <- expand.grid(list(cov = seq(0.1, 0.9, 0.005),
                             adh = seq(0.1, 0.9, 0.005)))
pia.fit$pia <- as.numeric(predict(pia.loess, newdata = pia.fit))

# nnt plots
nnt.loess <- loess(nnt ~ cov * adh, data = df, degree = 2, span = 0.15)
nnt.fit <- expand.grid(list(cov = seq(0.1, 0.9, 0.005),
                            adh = seq(0.1, 0.9, 0.005)))
nnt.fit$nnt <- as.numeric(predict(nnt.loess, newdata = nnt.fit))

pal <- wesanderson::wes_palette("Zissou", n = 100, type = "continuous")
require(gridExtra)
require(lattice)

# For paper

plot.left <- contourplot(pia ~ cov * adh, data = pia.fit,
                         cuts = 9, region = TRUE,
                         ylab = "Adherence",
                         xlab = "Coverage",
                         main = "Percent Infections Averted",
                         col.regions = pal)

plot.right <- contourplot(nnt ~ cov * adh, data = nnt.fit,
                          cuts = 8, region = TRUE,
                          ylab = "Adherence",
                          xlab = "Coverage",
                          main = "Number Needed to Treat",
                          col.regions = pal)

tiff(filename = "papers/prepguidelines/analysis/Fig3.tiff", height = 5, width = 9, units = "in", res = 250)
grid.arrange(plot.left, plot.right, ncol = 2)
dev.off()

# For presentation

tiff(file = "papers/prepguidelines/analysis/P1Fig3a.tiff",
     height = 5, width = 5, units = "in", res = 150, pointsize = 20)
contourplot(pia ~ cov * adh, data = pia.fit,
                         cuts = 9, region = TRUE,
                         ylab = "Adherence",
                         xlab = "Coverage",
                         main = "Percent Infections Averted",
                         col.regions = pal)


dev.off()

tiff(file = "papers/prepguidelines/analysis/P1Fig3b.tiff",
     height = 5, width = 5, units = "in", res = 150, pointsize = 20)
contourplot(nnt ~ cov * adh, data = nnt.fit,
                          cuts = 8, region = TRUE,
                          ylab = "Adherence",
                          xlab = "Coverage",
                          main = "Number Needed to Treat",
                          col.regions = pal)
dev.off()


# Cover Art!

pia.loess <- loess(pia ~ cov * adh, data = df, degree = 2, span = 0.15)
pia.fit <- expand.grid(list(cov = seq(0.1, 0.9, 0.001),
                            adh = seq(0.1, 0.9, 0.001)))
pia.fit$pia <- as.numeric(predict(pia.loess, newdata = pia.fit))

pal <- wesanderson::wes_palette("Zissou", n = 100, type = "continuous")

# final dim = 1950 w, 2100 h
tiff("papers/prepguidelines/analysis/Fig3-Cover-Contour.tiff", width = 2232, height = 2322, res = 200)
contourplot(pia ~ cov * adh, data = pia.fit,
            cuts = 9, region = TRUE,
            ylab = "Adherence",
            xlab = "Coverage",
            main = "Percent Infections Averted",
            col.regions = pal)
dev.off()

pal <- wesanderson::wes_palette("Zissou", n = 400, type = "continuous")
tiff("papers/prepguidelines/analysis/Fig3-Cover-Smooth.tiff", width = 2232, height = 2322, res = 200)
levelplot(pia ~ cov * adh, 
          data = pia.fit,
          cuts = 400,
          ylab = "Adherence",
          xlab = "Coverage",
          main = "Percent Infections Averted",
          col.regions = pal)
dev.off()

