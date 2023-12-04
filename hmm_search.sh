#!/bin/bash
#SBATCH --partition=taw
#SBATCH --nodes=1

cog_dir=""
prot_dir=""
out_dir=""

cd $prot_dir

for proteome in *.fasta
do
    for cog_hmm in $cog_dir*.hmm
        do
            result=$out_dir
            hmm_name="$(basename -- $cog_hmm)"
            result=$out_dir$proteome$hmm_name".txt"
            echo $result
            hmmsearch --tblout $result $cog_hmm $proteome
        done
done