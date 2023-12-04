#!/bin/bash
#SBATCH --job-name=iqtree_array1
#SBATCH --partition=compute
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --time=14-00:00:00
#SBATCH --mem=100gb
#SBATCH --array=1-420

threads=10

work_dir=""

module load apps/iqtree/1.6.12

iqtree="/sw/apps/iqtree-1.6.12-Linux/bin/iqtree"

cd $work_dir

$iqtree -s cluster.${SLURM_ARRAY_TASK_ID}.fasta -m MFP -bb 1000 -nm 10000 -nt AUTO
