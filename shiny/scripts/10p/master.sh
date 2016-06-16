#!/bin/bash

## Burnin model
# qsub -q batch -t 1-7 -v SIMNO=0010 runsim.burn.sh


## Followup models

qsub -q batch -t 1-3 -m n -v SIMNO=5000,MODEL=cdc3,COVR=0,RISKINT=182,REALL=0 runsim.fu.sh

qsub -q batch -t 1-3 -m n -v SIMNO=5200,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5201,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5202,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5203,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5204,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5205,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5206,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5207,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5208,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.5 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5209,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5210,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5211,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5212,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5213,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5214,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5215,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5216,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5217,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.4 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5218,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5219,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5220,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5221,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5222,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5223,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q batch -t 1-3 -m n -v SIMNO=5224,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5225,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5226,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5227,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5228,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5229,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5230,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5231,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5232,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5233,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5234,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5235,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5236,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5237,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5238,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5239,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5240,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5241,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5242,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5243,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5244,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=-0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5245,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5246,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5247,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5248,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5249,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5250,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5251,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5252,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5253,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5254,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5255,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5256,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5257,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5258,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5259,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5260,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5261,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5262,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0.1 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5263,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5264,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5265,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5266,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5267,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5268,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5269,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5270,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5271,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0.2 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5272,COVR=0.1,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5273,COVR=0.2,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5274,COVR=0.3,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5275,COVR=0.4,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5276,COVR=0.5,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5277,COVR=0.6,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5278,COVR=0.7,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5279,COVR=0.8,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
qsub -q bf -t 1-3 -m n -v SIMNO=5280,COVR=0.9,MODEL=cdc3,RISKINT=182,REALL=0.3 runsim.fu.sh
