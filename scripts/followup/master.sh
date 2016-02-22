#!/bin/bash

## Burnin model
# qsub -q batch -t 1-13 -m n -v SIMNO=1000 runsim.burn.sh


## Followup models
# qsub -q batch -t 1-8 -m n -v SIMNO=2000,MODEL=cdc3,COVR=0,RISKINT=182,REALL=0.019 runsim.fu.sh
#
# qsub -q batch -t 1-8 -m n -v SIMNO=2100,COVR=0.4,MODEL=uai.mono2.nt.6mo,RISKINT=182,REALL=0.019 runsim.fu.sh
# qsub -q batch -t 1-8 -m n -v SIMNO=2101,COVR=0.4,MODEL=uai.mono1.nt.6mo,RISKINT=182,REALL=0.019 runsim.fu.sh
# qsub -q batch -t 1-8 -m n -v SIMNO=2102,COVR=0.4,MODEL=uai.nonmonog,RISKINT=182,REALL=0.019 runsim.fu.sh
# qsub -q batch -t 1-8 -m n -v SIMNO=2103,COVR=0.4,MODEL=uai.nmain,RISKINT=182,REALL=0.019 runsim.fu.sh
# qsub -q batch -t 1-8 -m n -v SIMNO=2104,COVR=0.4,MODEL=ai.sd.mc,RISKINT=182,REALL=0.019 runsim.fu.sh
# qsub -q batch -t 1-8 -m n -v SIMNO=2105,COVR=0.4,MODEL=uai.sd.mc,RISKINT=182,REALL=0.019 runsim.fu.sh
# qsub -q batch -t 1-8 -m n -v SIMNO=2106,COVR=0.4,MODEL=cdc1,RISKINT=182,REALL=0.019 runsim.fu.sh
# qsub -q batch -t 1-8 -m n -v SIMNO=2107,COVR=0.4,MODEL=cdc2,RISKINT=182,REALL=0.019 runsim.fu.sh
# qsub -q batch -t 1-8 -m n -v SIMNO=2108,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0.019 runsim.fu.sh
# qsub -q batch -t 1-8 -m n -v SIMNO=2109,COVR=0.4,MODEL=cdc4,RISKINT=182,REALL=0.019 runsim.fu.sh

qsub -q batch -t 1-8 -m n -v SIMNO=2200,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2201,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2202,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2203,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2204,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2205,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2206,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2207,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2208,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2209,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2210,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2211,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2212,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2213,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2214,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2215,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2216,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2217,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2218,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2219,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2220,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2221,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2222,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2223,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2224,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2225,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2226,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2227,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2228,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2229,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2230,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2231,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2232,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2233,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2234,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2235,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2236,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2237,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2238,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2239,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2240,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2241,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2242,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2243,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2244,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2245,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2246,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2247,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2248,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2249,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2250,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2251,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2252,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2253,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2254,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2255,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2256,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2257,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2258,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2259,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2260,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2261,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2262,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2263,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2264,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2265,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2266,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2267,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2268,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2269,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2270,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2271,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2272,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2273,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2274,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2275,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2276,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2277,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2278,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2279,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-8 -m n -v SIMNO=2280,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh


qsub -q batch -t 1-8 -m n -v SIMNO=2300,COVR=0.4,MODEL=cdc3,RISKINT=91,REALL=0.019 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2301,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0.019 runsim.fu.sh
qsub -q batch -t 1-8 -m n -v SIMNO=2302,COVR=0.4,MODEL=cdc3,RISKINT=364,REALL=0.019 runsim.fu.sh
