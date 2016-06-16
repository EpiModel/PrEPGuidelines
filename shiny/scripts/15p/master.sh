#!/bin/bash

## Burnin model
# qsub -q batch -t 1-7 -v SIMNO=0015 runsim.burn.sh


## Followup models

# qsub -q batch -t 1-3 -m n -v SIMNO=3000,MODEL=cdc3,COVR=0,RISKINT=182,REALL=0 runsim.fu.sh

qsub -q batch -t 1-3 -m n -v SIMNO=3200,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3201,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3202,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3203,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3204,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3205,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3206,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3207,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3208,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3209,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3210,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3211,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3212,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3213,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3214,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3215,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3216,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3217,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3218,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3219,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3220,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3221,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3222,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3223,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=3224,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3225,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3226,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3227,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3228,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3229,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3230,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3231,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3232,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3233,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3234,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3235,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3236,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3237,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3238,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3239,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3240,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3241,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3242,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3243,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3244,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3245,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3246,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3247,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3248,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3249,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3250,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3251,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3252,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3253,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3254,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3255,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3256,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3257,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3258,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3259,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3260,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3261,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3262,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3263,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3264,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3265,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3266,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3267,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3268,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3269,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3270,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3271,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3272,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3273,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3274,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3275,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3276,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3277,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3278,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3279,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=3280,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh

# reruns
qsub -q batch -t 2 -m n -v SIMNO=3232,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q batch -t 3 -m n -v SIMNO=3240,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q batch -t 1 -m n -v SIMNO=3241,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh

