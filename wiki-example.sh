#!/bin/bash
#SBATCH --job-name=dask-example
#SBATCH --account=ac_scsguest
#SBATCH --partition=savio2
#SBATCH --ntasks=96
#SBATCH --time=00:30:00

module load python/3.6
export SCHED=$(hostname)
dask-scheduler &
sleep 20
srun dask-worker tcp://${SCHED}:8786 &   # might need ${SCHED}.berkeley.edu
sleep 180

python dask-example.py
