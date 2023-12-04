#!/bin/bash

tfam_dir=""
vfam_dir=""
hmm_dir=""



cd $tfam_dir

for fasta in *.aln
do
	hmm_file=$fasta".hmm"
	hmmbuild $hmm_file $fasta
done

cp *.hmm $hmm_dir


cd $vfam_dir

for fasta in *.fa
do
	aligned=$fasta".aligned.fasta"
	mafft $fasta > $aligned
	hmm_file=$fasta".hmm"
	hmmbuild $hmm_file $aligned
done

cp *.hmm $hmm_dir

