#!/bin/bash
#SBATCH --job-name=dask-example
#SBATCH --account=ac_scsguest
#SBATCH --partition=savio2
#SBATCH --ntasks=96
#SBATCH --time=00:30:00

module load python/3.6
export SCHED=$(hostname)
~/.local/bin/dask-scheduler &
sleep 20
srun ~/.local/bin/dask-worker tcp://${SCHED}:8786 &   
sleep 180

python dask-example.py
