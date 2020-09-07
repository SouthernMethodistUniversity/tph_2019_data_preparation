#!/bin/bash
#SBATCH -J jupyter
#SBATCH -o jupyter_%j.out
#SBATCH -p htc
#SBATCH --mem=6G
#SBATCH -c 1

module purge
module load python/3

m2_jupyter_notebook

