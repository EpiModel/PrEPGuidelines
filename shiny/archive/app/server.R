##
## server file for PrEP Guidelines Paper
##

library(shiny)
library(EpiModel)
library(dygraphs)


allsims <- list()
# for (i in seq_along(allsimnos)) {
#   objname <- load(paste0("data/sim.n", allsimnos[i], ".short.rda"))
#   allsims[[simnames[i]]] <- get(objname)
# }

load("data/sim.base.rda")
base.mn <- lapply(sim, rowMeans)

shinyServer(function(input, output, session){

nsteps <- reactive({
  validate(need(input$nyears, label = "Years in Simulation"))
  input$nyears * 52
})

values <- reactiveValues(nmods = 1)


# CDC3 Time Series Reactives -----------------------------------------------

observeEvent(input$onemodButton, {
  values$nmods <- 1
})
observeEvent(input$twomodButton, {
  values$nmods <- 2
})

sa.simname1 <- reactive({
  paste("data/sim", input$covr1, input$rr1, input$ri1, input$pce1, "rda", sep = ".")
})
sa.simname2 <- reactive({
  paste("data/sim", input$covr2, input$rr2, input$ri2, input$pce2, "rda", sep = ".")
})


sa.prev <- reactive({
  df <- data.frame(row.names = seq(nsteps()))
  load(sa.simname1())
  lwrcut <- (1 - input$qnt)/2
  uprcut <- lwrcut + input$qnt
  df$mod1.mean <- rowMeans(sim[["i.prev"]][seq(nsteps()), ])
  df$mod1.lwr <- apply(sim[["i.prev"]][seq(nsteps()), ],
                       MARGIN = 1, FUN = quantile, lwrcut)
  df$mod1.upr <- apply(sim[["i.prev"]][seq(nsteps()), ],
                       MARGIN = 1, FUN = quantile, uprcut)

  if (values$nmods == 2) {
    load(sa.simname2())
    df$mod2.mean <- rowMeans(sim[["i.prev"]][seq(nsteps()), ])
    df$mod2.lwr <- apply(sim[["i.prev"]][seq(nsteps()), ],
                         MARGIN = 1, FUN = quantile, lwrcut)
    df$mod2.upr <- apply(sim[["i.prev"]][seq(nsteps()), ],
                         MARGIN = 1, FUN = quantile, uprcut)
  }
  df
})

sa.incid <- reactive({
  df <- data.frame(row.names = seq(nsteps()))
  load(sa.simname1())
  lwrcut <- (1 - input$qnt)/2
  uprcut <- lwrcut + input$qnt
  df$mod1.mean <- rowMeans(sim[["incid"]][seq(nsteps()), ])
  df$mod1.lwr <- apply(sim[["incid"]][seq(nsteps()), ],
                       MARGIN = 1, FUN = quantile, lwrcut)
  df$mod1.upr <- apply(sim[["incid"]][seq(nsteps()), ],
                       MARGIN = 1, FUN = quantile, uprcut)

  if (values$nmods == 2) {
    load(sa.simname2())
    df$mod2.mean <- rowMeans(sim[["incid"]][seq(nsteps()), ])
    df$mod2.lwr <- apply(sim[["incid"]][seq(nsteps()), ],
                         MARGIN = 1, FUN = quantile, lwrcut)
    df$mod2.upr <- apply(sim[["incid"]][seq(nsteps()), ],
                         MARGIN = 1, FUN = quantile, uprcut)
  }
  df
})

sa.dat <- reactive({
  df <- switch(input$epi.result,
               "i.prev" = sa.prev(),
               "incid" = sa.incid())
  if (input$smooth) {
    df$mod1.mean <- supsmu(x = seq(nsteps()), y = df$mod1.mean)$y
    df$mod1.lwr <- supsmu(x = seq(nsteps()), y = df$mod1.lwr)$y
    df$mod1.upr <- supsmu(x = seq(nsteps()), y = df$mod1.upr)$y
    if (values$nmods == 2) {
      df$mod2.mean <- supsmu(x = seq(nsteps()), y = df$mod2.mean)$y
      df$mod2.lwr <- supsmu(x = seq(nsteps()), y = df$mod2.lwr)$y
      df$mod2.upr <- supsmu(x = seq(nsteps()), y = df$mod2.upr)$y
    }
  }
  df
})

sa.ts <- reactive({
  df <- sa.dat()
  xts::xts(df, order.by = as.Date(seq(nsteps()) * 7, origin = input$startdate))
})


timeseries.sa <- reactive({
  main <- switch(input$epi.result,
                 i.prev = "Prevalence",
                 incid = "Incidence")
  dat <- sa.ts()
  mod1lines <- c("mod1.lwr", "mod1.mean", "mod1.upr")
  mod2lines <- c("mod2.lwr", "mod2.mean", "mod2.upr")

  if (values$nmods == 2) {
    dat <- dat[, c(mod1lines, mod2lines)]
    dygraph(dat, main = main) %>%
      dySeries(name = mod1lines, label = "Model 1") %>%
      dySeries(name = mod2lines, label = "Model 2") %>%
      dyRangeSelector(height = 20) %>%
      dyOptions(includeZero = TRUE, colors = c("#234978", "#0F8C79"))
  } else {
    dat <- dat[, mod1lines]
    dygraph(dat, main = main) %>%
      dySeries(name = mod1lines, label = "Model 1") %>%
      dyRangeSelector(height = 20) %>%
      dyOptions(includeZero = TRUE, colors = "#234978")
  }
  })

# Box Plot Reactives ------------------------------------------------------


incid.base <- reactive({
  sum(base.mn$incid[seq(nsteps())])
})
ir.base <- reactive({
  (incid.base() / sum((1 - base.mn$i.prev[seq(nsteps())]) *
                        base.mn$num[seq(nsteps())])) * 52 * 1e5
})

ir.sim.vec <- reactive({
  out <- list()
  load(sa.simname1())
  out$mod1 <- (colSums(sim[["incid"]][seq(nsteps()), ]) /
           sum(rowMeans(sim[["s.num"]][seq(nsteps()), ]))
          ) * 52 * 1e5
  if (values$nmods == 2) {
    load(sa.simname2())
    out$mod2 <- (colSums(sim[["incid"]][seq(nsteps()), ]) /
                sum(rowMeans(sim[["s.num"]][seq(nsteps()), ]))
              ) * 52 * 1e5
  }
  out
})

nia <- reactive({
  out <- lapply(ir.sim.vec(), FUN = function(x){
    round(ir.base() - unname(x), 1)
  })
  out
})

pia <- reactive({
  out <- lapply(nia(), FUN = function(x){
    x/ir.base()
  })
  out
})

nnt <- reactive({
  out <- list()
  load(sa.simname1())
  py.on.prep1 <- unname(colSums(sim[["prepCurr"]][seq(nsteps()), ]))/52
  out$nnt1 <- py.on.prep1 /
    (incid.base() - unname(colSums(sim[["incid"]][seq(nsteps()), ])))
  if (values$nmods == 2) {
    load(sa.simname2())
    py.on.prep2 <- unname(colSums(sim[["prepCurr"]][seq(nsteps()), ]))/52
    out$nnt2 <- py.on.prep2 /
      (incid.base() - unname(colSums(sim[["incid"]][seq(nsteps()), ])))
  }
  out
})


# Table Reactives ---------------------------------------------------------

tabledf <- reactive({
  if (values$nmods == 2) {
    # mods <- c(sa.simname1(), sa.simname2())
    load(sa.simname1())
    sim1 <- sim
    load(sa.simname2())
    sim2 <- sim
    mods <- list(sim1 = sim1, sim2 = sim2)
  } else {
    # mods <- sa.simname1()
    load(sa.simname1())
    mods <- list(sim = sim)
  }
  lwrcut <- (1 - input$qnt)/2
  uprcut <- 1 - ((1 - input$qnt)/2)

  prev <- lapply(mods, FUN = function(x) {
     m <- round(mean(unlist(mods[[x]][["i.prev"]][nsteps(), ])), 3) * 100
     lwr <- round(quantile(as.numeric(mods[[x]][["i.prev"]][nsteps(), ]), lwrcut), 3) * 100
     upr <- round(quantile(as.numeric(mods[[x]][["i.prev"]][nsteps(), ]), uprcut), 3) * 100
     paste0(m, " (", lwr, ", ", upr, ")")
  })

  incid <- lapply(allsims[mods], FUN = function(x){
    mn <- lapply(x[c("incid", "s.num")], rowMeans)
    ql <- lapply(x[c("incid", "s.num")], FUN = function(y){
      apply(y, MARGIN = 1, FUN = quantile, lwrcut)})
    qu <- lapply(x[c("incid", "s.num")], FUN = function(y){
      apply(y, MARGIN = 1, FUN = quantile, uprcut)})

    m <- round((mean(tail(mn$incid[1:nsteps()], min(100, nsteps()))) /
                  (mean(tail(mn$s.num[1:nsteps()], min(100, nsteps()))))) * 52 * 100, 2)
    lwr <- round((mean(tail(ql$incid[1:nsteps()], min(100, nsteps()))) /
                  (mean(tail(ql$s.num[1:nsteps()], min(100, nsteps()))))) * 52 * 100, 2)
    upr <- round((mean(tail(qu$incid[1:nsteps()], min(100, nsteps()))) /
                  (mean(tail(qu$s.num[1:nsteps()], min(100, nsteps()))))) * 52 * 100, 2)
    paste0(m, " (", lwr, ", ", upr, ")")
  })

  nia <- lapply(nia(), FUN = function(x){
    m <- round(mean(x), 0)
    lwr <- round(quantile(x, lwrcut), 0)
    upr <- round(quantile(x, uprcut), 0)
    paste0(m, " (", lwr, ", ", upr, ")")
  })

  pia <- lapply(pia(), FUN = function(x){
    m <- round(mean(x), 3) * 100
    lwr <- round(quantile(x, lwrcut), 3) * 100
    upr <- round(quantile(x, uprcut), 3) * 100
    paste0(m, " (", lwr, ", ", upr, ")")
  })

  nnt <- lapply(nnt(), FUN = function(x){
    m <- round(mean(x), 0)
    lwr <- round(quantile(x, lwrcut), 0)
    upr <- round(quantile(x, uprcut), 0)
    paste0(m, " (", lwr, ", ", upr, ")")
  })

  if (length(prev) == 4) {
    rnames <- toupper(mods)
  } else if (values$nmods == 2) {
    rnames <- c("Model 1", "Model 2")
  } else {
    rnames <- "Model 1"
  }
  data.frame(Prevalence = unlist(prev), Incidence = unlist(incid),
             NIA = unlist(nia), PIA = unlist(pia), NNT = unlist(nnt),
             row.names = rnames)
})


# Output Objects ----------------------------------------------------------

output$timeseries <- renderDygraph({
  timeseries.sa()
})

output$boxplot <- renderPlot({
  if (input$bp.result == "nia") {
    dat <- nia()
    main <- "Number of Infections Averted"
  } else if (input$bp.result == "pia") {
    dat <- pia()
    main <- "Percent of Infections Averted"
  } else {
    dat <- nnt()
    main <- "Number Needed to Treat"
  }
  plotnames <- paste("Model", seq(length(dat)))
  boxplot(dat,
          names = plotnames,
          border = c(adjustcolor("#234978", alpha.f = .9),
                     adjustcolor("#0F8C79", alpha.f = .8),
                     adjustcolor("#842854", alpha.f = .9),
                     adjustcolor("#617D42", alpha.f = .9)),
          col = c(adjustcolor("#234978", alpha.f = .3),
                  adjustcolor("#0F8C79", alpha.f = .3),
                  adjustcolor("#842854", alpha.f = .3),
                  adjustcolor("#617D42", alpha.f = .3)),
          outline = FALSE,
          main = main)
})

output$table3 <- renderTable(expr = {
  tabledf()
})
output$tablecaption <- renderUI({
  helpText("Epidemiological outcomes after", input$nyears,
           "years of simulations. Reported values are simulation means with a",
           paste0(input$qnt*100, "%"), "credible interval. Editing",
           "inputs in the left panel and/or plot options will update the",
           "table values.")
})



# PDF download ------------------------------------------------------------

output$downloadSum <- downloadHandler(
  filename = "CAMP_Summary.pdf",
  content = function(file){
    pdf(file = file, height = 8.5, width = 11)
    linecols <- c("#234978", "#0F8C79",  "#842854", "#617D42")
    fadedcols <- adjustcolor(linecols, alpha.f = .3)
    dates <- as.Date(seq(nsteps()), origin = input$startdate)

    def.par <- par(no.readonly = TRUE)
    par(mar = c(0, 0, 0, 0))
    layout(matrix(c(1,1,1,1,1,1, 2,2,2,3,3,3, 4,4,5,5,6,6),
                  nrow = 3, byrow = TRUE), heights = c(1, 3, 3, 3, 3, 3))
    plot.new()
    mtext(text = "CDC3 Scenario", side = 3, line = -3, cex = 1.5)
    mtext(text = paste("Simulated for", input$nyears,
                       "years starting on", input$startdate),
          side = 3, line = -5)
    legend(x = "bottom", legend = c(sub("pce", "effic", x = sa.simname1()),
                                    sub("pce", "effic", x = sa.simname2())),
           col = linecols[1:2], lty = 1, lwd = 2, bty = "n", cex = 1.5)
    par(mar = c(5, 4, 2, 2))
    for (plotresult in c("prev", "incid")) {
      df <- switch(plotresult, "prev" = sa.prev(), "incid" = sa.incid())
      if (input$smooth) {
        for (mod in names(df)) {
          df[[mod]] <- supsmu(x = seq(nsteps()), y = df[[mod]])$y
        }
      }
      plot(x = dates, y = df$mod1.mean, ylim = c(0, max(df)),
           type = "l", lwd = 2, col = linecols[1], xlab = "", ylab = "",
           main = switch(plotresult,
                         "prev" = "Prevalence",
                         "incid" = "Incidence"))
      polygon(x = c(dates, rev(dates)), y = c(df$mod1.lwr, rev(df$mod1.upr)),
              col = fadedcols[1], border = FALSE)
      polygon(x = c(dates, rev(dates)), y = c(df$mod2.lwr, rev(df$mod2.upr)),
              col = fadedcols[2], border = FALSE)
      lines(x = dates, y = df$mod1.mean, lwd = 2, col = linecols[1])
      lines(x = dates, y = df$mod2.mean, lwd = 2, col = linecols[2])
      mtext(paste("Width of credible interval:", paste0(input$qnt*100, "%")),
            side = 1, line = -1, cex = 0.75, adj = 1)
    }
    for (plotresult in c("nia", "pia", "nnt")) {
      dat <- switch(plotresult, "nia" = nia(),
                    "pia" = pia(), "nnt" = nnt())
      main <- switch(plotresult,
                     "nia" = "Number of Infections Averted",
                     "pia" = "Percent of Infections Averted",
                     "nnt" = "Number Needed to Treat")
      plotnames <- paste("Model", seq(length(dat)))
      boxplot(dat,
              names = plotnames,
              border = c(adjustcolor("#234978", alpha.f = .9),
                         adjustcolor("#0F8C79", alpha.f = .8)),
              col = c(adjustcolor("#234978", alpha.f = .3),
                      adjustcolor("#0F8C79", alpha.f = .3)),
              outline = FALSE,
              main = main)
    }

    dev.off()
  }
)

})
