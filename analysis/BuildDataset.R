
## Build analysis dataset
## Runs on Hyak

# Build analysis dataset --------------------------------------------------

# Run on hyak
# EpiModelHPC::process_simfiles(indir = "data/save/", outdir = "data/save/paperv2/",
#                               vars = c("num", "s.num", "i.prev", "incid", "prepCurr"),
#                               min.n = 16, compress = "xz", delete.sub = TRUE)

EpiModelHPC::get_epi(indir = "data/save/", outdir = "data/save/analysis/",
                     vars = c("num", "i.prev", "incid", "prepCov", "prepElig", "prepCurr"),
                     suffix = "lim")
