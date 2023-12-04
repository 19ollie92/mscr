#!/bin/bash
#SBATCH --job-name=mafft_bmge_array2
#SBATCH --partition=compute
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=40gb
#SBATCH --time=7-00:00:00
#SBATCH --array=1-589


module load apps/mafft/7.429 

module load apps/bmge/1.12


tree_dir=""

bmge="java -jar /sw/apps/BMGE-1.12/BMGE.jar"

cd $tree_dir

linsi PF.${SLURM_ARRAY_TASK_ID}.fa > PF.${SLURM_ARRAY_TASK_ID}.fa.aligned
$bmge -i PF.${SLURM_ARRAY_TASK_ID}.fa.aligned -t AA -m BLOSUM30 -o PF.${SLURM_ARRAY_TASK_ID}.fa.trimmed.fasta
