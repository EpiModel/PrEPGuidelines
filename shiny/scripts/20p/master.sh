#!/bin/bash

## Burnin model
# qsub -q batch -t 1-7 -v SIMNO=0020 runsim.burn.sh


## Followup models
# qsub -q batch -t 1-3 -m n -v SIMNO=4000,MODEL=cdc3,COVR=0,RISKINT=182,REALL=0.019 runsim.fu.sh

qsub -q batch -t 1-3 -m n -v SIMNO=4200,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4201,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4202,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4203,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4204,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4205,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4206,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4207,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4208,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4209,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4210,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4211,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4212,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4213,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4214,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4215,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4216,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4217,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4218,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4219,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4220,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4221,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4222,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4223,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=4224,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4225,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4226,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4227,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4228,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4229,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4230,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4231,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4232,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4233,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4234,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4235,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4236,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4237,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4238,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4239,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4240,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4241,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4242,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4243,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4244,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4245,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4246,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4247,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4248,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4249,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4250,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4251,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4252,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4253,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4254,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4255,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4256,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4257,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4258,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4259,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4260,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4261,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4262,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4263,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4264,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4265,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4266,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4267,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4268,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4269,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4270,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4271,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4272,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4273,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4274,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4275,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4276,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4277,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4278,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4279,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=4280,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh

qsub -q bf -t 2 -m n -v SIMNO=4264,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
