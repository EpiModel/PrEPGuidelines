
library(EpiModelHPC)

processData <- function(indir, outdir, prev, nsims) {
  fn <- list.files(indir, full.names = TRUE)
  for (i in seq_along(fn)) {
    load(fn[i])

    out.fn <- paste(outdir, "sim.",
                    prev, ".",
                    sim$param$prep.coverage * 100, ".",
                    round(sim$param$prep.class.prob[4] * 100), ".",
                    (sim$param$prep.risk.int / 52) * 12, ".",
                    "rda", sep = "")

    sim <- truncate_sim(sim, at = 2601)$epi

    if (!missing(nsims)) {
      samp <- sample(1:ncol(sim[[1]]), nsims)
      for (j in seq_along(sim)) {
        sim[[j]] <- sim[[j]][, samp]
      }
    }

    vars <- c("num", "i.prev", "incid", "prepCov", "prepElig", "prepCurr")
    sim <- sim[vars]
    sim$i.prev <- round(sim$i.prev, 4)

    save(sim, file = out.fn, compress = "xz")
    cat("*")
  }
}

processData("shiny/input/", "shiny/app/data/", 26, nsims = 100)
processData("shiny/scripts/15p/data/", "shiny/app/data/", 15)

# scp hyak:/gscratch/csde/camp/data/save/*.rda data/
processData("shiny/scripts/20p/data/", "shiny/app/data/", 20)

# scp hyak:/gscratch/csde/camp/data/save/*.rda data/
processData("shiny/scripts/10p/data/", "shiny/app/data/", 10)

