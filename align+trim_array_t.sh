#!/bin/bash
#SBATCH --job-name=mafft_bmge_array1
#SBATCH --partition=compute
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=40gb
#SBATCH --time=7-00:00:00
#SBATCH --array=1-474


module load apps/mafft/7.429 

module load apps/bmge/1.12


tree_dir=""

bmge="java -jar /sw/apps/BMGE-1.12/BMGE.jar"

cd $tree_dir

linsi cluster.${SLURM_ARRAY_TASK_ID}.fa > cluster.${SLURM_ARRAY_TASK_ID}.fa.aligned
$bmge -i cluster.${SLURM_ARRAY_TASK_ID}.fa.aligned -t AA -m BLOSUM30 -o cluster.${SLURM_ARRAY_TASK_ID}.fa.trimmed.fasta
