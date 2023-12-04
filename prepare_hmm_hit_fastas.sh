#!/bin/bash
#SBATCH --job-name=hmm_py_script
#SBATCH --partition=taw
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=14-00:00:00
#SBATCH --mem=100G

module load  lang/python/anaconda/3.7-2019.03.biopython

python3 