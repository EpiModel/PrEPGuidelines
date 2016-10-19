library(shiny)
library(wesanderson)

runScenario <- function(prevalence = "26% (Paper Model)", coverage = 40, adherence = 60, years = 10) {

  prevalence <- switch(prevalence,
                       "26% (Paper Model)" = 26,
                       "20%" = 20,
                       "15%" = 15,
                       "10%" = 10)

  ## Load data ##

  # Base
  base_fn <- paste("data/sim", prevalence, "0.62.6.rda", sep = ".")
  load(base_fn)
  sim.base <- sim

  weeks <- years * 52

  ir.base <- (sum(rowMeans(head(sim.base$incid, weeks)))/
                sum((1 - rowMeans(head(sim.base$i.prev, weeks))) * rowMeans(head(sim.base$num, weeks)))) * 52 * 1e5
  incid.base <- sum(rowMeans(head(sim.base$incid, weeks)))

  # Active
  scenario_fn <- paste("data/sim", prevalence, coverage, adherence, 6, "rda", sep = ".")
  load(scenario_fn)

  dat <- list()


  ## Run calcs ##

  # Prevalence
  dat$prev <- as.data.frame(lapply(sim$i.prev, head, weeks))

  # Incidence
  incid <- as.data.frame(lapply(sim$incid, head, weeks))
  num <- as.data.frame(lapply(sim$num, head, weeks))
  dat$inc100py <- round((incid / ((1 - dat$prev) * num)) * 5200, 4)

  # NIA
  means.prev <- rowMeans(dat$prev)
  means.num <- rowMeans(num)
  ir <- (colSums(incid)/ sum((1 - means.prev) * means.num)) * 52 * 1e5
  dat$vec.nia <- round(ir.base - unname(ir), 1)

  # PIA
  dat$vec.pia <- dat$vec.nia/ir.base

  # NNT
  py.on.prep <- unname(colSums(head(sim$prepCurr, weeks)))/52
  dat$vec.nnt <- py.on.prep/(incid.base - unname(colSums(incid)))


  ## Return list data ##
  return(dat)
}

# d <- runScenario("10%")

plotScenario <- function(datA, datB, dtype, quantile = 0.95) {

  pal <- c("steelblue", "firebrick")
  palq <- adjustcolor(pal, alpha.f = 0.6)
  nmodels <- ifelse(identical(datA, datB), 1, 2)

  if (dtype == "Prevalence") {
    plot(x = 1, y = 1, type = "n",
         xlim = c(0, nrow(datA$prev)), ylim = c(0, 0.3),
         xlab = "Years", ylab = "Prevalence", bty = "n", xaxt = "n",
         main = "")
    axis(1, seq(0, nrow(datA$prev), 52), seq(0, nrow(datA$prev)/52, 1))
    draw_qnts(datA, var = "prev", qnts = quantile, pal = palq[1])
    draw_means(datA, var = "prev", pal = pal[1])
    if (nmodels == 2) {
      draw_qnts(datB, var = "prev", qnts = quantile, pal = palq[2])
      draw_means(datB, var = "prev", pal = pal[2])
      legend("bottomleft", legend = c("Model 1", "Model 2"), lwd = 4, col = pal, cex = 1.2, bty = "n")
    }
    grid()
  }

  if (dtype == "Incidence") {
    plot(x = 1, y = 1, type = "n",
         xlim = c(0, nrow(datA$prev)), ylim = c(0, 10),
         xlab = "Weeks", ylab = "Incidence / 100 PY", bty = "n", xaxt = "n",
         main = "")
    axis(1, seq(0, nrow(datA$prev), 52), seq(0, nrow(datA$prev)/52, 1))
    draw_qnts(datA, var = "inc100py", qnts = quantile, pal = palq[1])
    draw_means(datA, var = "inc100py", pal = pal[1])
    if (nmodels == 2) {
      draw_qnts(datB, var = "inc100py", qnts = quantile, pal = palq[2])
      draw_means(datB, var = "inc100py", pal = pal[2])
      legend("topright", legend = c("Model 1", "Model 2"), lwd = 4, col = pal, cex = 1.2, bty = "n")
    }
    grid()
  }

  if (dtype == "Number Infections Averted") {
    if (nmodels == 1) {
      boxplot(datA$vec.nia, outline = FALSE, col = palq[1],
              ylab = "Number of Infections Averted / 100k PY",
              main = "")
    } else {
      df <- data.frame(Model1 = datA$vec.nia, Model2 = datB$vec.nia)
      boxplot(df, outline = FALSE, col = palq,
              ylab = "Number of Infections Averted / 100k PY",
              main = "")
    }
  }

  if (dtype == "Percent Infections Averted") {
    if (nmodels == 1) {
      boxplot(datA$vec.pia, outline = FALSE, col = palq[1],
              ylab = "Percent of Infections Averted",
              main = "")
    } else {
      df <- data.frame(Model1 = datA$vec.pia, Model2 = datB$vec.pia)
      boxplot(df, outline = FALSE, col = palq,
              ylab = "Percent of Infections Averted",
              main = "")
    }
  }

  if (dtype == "Number Needed to Treat") {
    if (nmodels == 1) {
      boxplot(datA$vec.nnt, outline = FALSE, col = palq[1],
              ylab = "Number Needed to Treat",
              main = "")
    } else {
      df <- data.frame(Model1 = datA$vec.nnt, Model2 = datB$vec.nnt)
      boxplot(df, outline = FALSE, col = palq,
              ylab = "Number Needed to Treat",
              main = "")
    }
  }

}

draw_qnts <- function(dat, var, qnts = 0.95, pal = pal) {

  quants <- c((1 - qnts) / 2, 1 - ((1 - qnts) / 2))
  qnt.prev <- apply(dat[[var]], 1,
                    function(x) {
                      quantile(x, c(quants[1], quants[2]), na.rm = TRUE)
                    })
  qnt.prev <- qnt.prev[, complete.cases(t(qnt.prev))]

  xx <- c(1:(ncol(qnt.prev)), (ncol(qnt.prev)):1)
  yy <- c(suppressWarnings(supsmu(x = 1:(ncol(qnt.prev)), y = qnt.prev[1, ]))$y,
          rev(suppressWarnings(supsmu(x = 1:(ncol(qnt.prev)), y = qnt.prev[2, ]))$y))

  polygon(xx, yy, col = pal, border = NA)
}

draw_means <- function(dat, var, pal = "black") {

  mean.prev <- rowMeans(dat[[var]])
  mean.prev <- suppressWarnings(supsmu(x = 1:length(mean.prev), y = mean.prev))$y

  lines(mean.prev, lwd = 3, col = pal)

}

# datA <- runScenario(coverage = 40)
# datB <- runScenario(coverage = 40)

tabScenario <- function(datA, datB, quantile = 0.95) {

  nmodels <- ifelse(identical(datA, datB), 1, 2)

  quants <- c((1 - quantile) / 2, 1 - ((1 - quantile) / 2))

  # Prevalence
  prevA <- as.numeric(tail(datA$prev, 1))
  prevA.mean <- sprintf("%.3f", mean(prevA))
  prevA.qnt <- quantile(prevA, probs = quants)
  prevA.summ <- paste0(prevA.mean, " (", sprintf("%.3f", prevA.qnt[1]), ", ", sprintf("%.3f", prevA.qnt[2]), ")")

  prevB <- as.numeric(tail(datB$prev, 1))
  prevB.mean <- sprintf("%.3f", mean(prevB))
  prevB.qnt <- quantile(prevB, probs = quants)
  prevB.summ <- paste0(prevB.mean, " (", sprintf("%.3f", prevB.qnt[1]), ", ", sprintf("%.3f", prevB.qnt[2]), ")")

  # Incidence
  incidA <- unname(do.call("c", tail(datA$inc100py, 50)))
  incidA.mean <- sprintf("%.2f", mean(incidA))
  incidA.qnt <- quantile(incidA, probs = quants)
  incidA.summ <- paste0(incidA.mean, " (", sprintf("%.2f", incidA.qnt[1]), ", ", sprintf("%.2f", incidA.qnt[2]), ")")

  incidB <- unname(do.call("c", tail(datB$inc100py, 50)))
  incidB.mean <- sprintf("%.2f", mean(incidB))
  incidB.qnt <- quantile(incidB, probs = quants)
  incidB.summ <- paste0(incidB.mean, " (", sprintf("%.2f", incidB.qnt[1]), ", ", sprintf("%.2f", incidB.qnt[2]), ")")

  # NIA
  niaA <- datA$vec.nia
  niaA.mean <- sprintf("%.0f", mean(niaA))
  niaA.qnt <- quantile(niaA, probs = quants)
  niaA.summ <- paste0(niaA.mean, " (", sprintf("%.0f", niaA.qnt[1]), ", ", sprintf("%.0f", niaA.qnt[2]), ")")

  niaB <- datB$vec.nia
  niaB.mean <- sprintf("%.0f", mean(niaB))
  niaB.qnt <- quantile(niaB, probs = quants)
  niaB.summ <- paste0(niaB.mean, " (", sprintf("%.0f", niaB.qnt[1]), ", ", sprintf("%.0f", niaB.qnt[2]), ")")

  # PIA
  piaA <- datA$vec.pia
  piaA.mean <- sprintf("%.3f", mean(piaA))
  piaA.qnt <- quantile(piaA, probs = quants)
  piaA.summ <- paste0(piaA.mean, " (", sprintf("%.3f", piaA.qnt[1]), ", ", sprintf("%.3f", piaA.qnt[2]), ")")

  piaB <- datB$vec.pia
  piaB.mean <- sprintf("%.3f", mean(piaB))
  piaB.qnt <- quantile(piaB, probs = quants)
  piaB.summ <- paste0(piaB.mean, " (", sprintf("%.3f", piaB.qnt[1]), ", ", sprintf("%.3f", piaB.qnt[2]), ")")

  # NNT
  nntA <- datA$vec.nnt
  nntA.mean <- sprintf("%.0f", mean(nntA))
  nntA.qnt <- quantile(nntA, probs = quants)
  nntA.summ <- paste0(nntA.mean, " (", sprintf("%.0f", nntA.qnt[1]), ", ", sprintf("%.0f", nntA.qnt[2]), ")")

  nntB <- datB$vec.nnt
  nntB.mean <- sprintf("%.0f", mean(nntB))
  nntB.qnt <- quantile(nntB, probs = quants)
  nntB.summ <- paste0(nntB.mean, " (", sprintf("%.0f", nntB.qnt[1]), ", ", sprintf("%.0f", nntB.qnt[2]), ")")

  df <- data.frame(Prevalence = c(prevA.summ, prevB.summ),
                   Incidence = c(incidA.summ, incidB.summ),
                   NIA = c(niaA.summ, niaB.summ),
                   PIA = c(piaA.summ, piaB.summ),
                   NNT = c(nntA.summ, nntB.summ))
  row.names(df) <- c("Model 1", "Model 2")
  return(df)
}

# df <- tabScenario(datA, datB)
