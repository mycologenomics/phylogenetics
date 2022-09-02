#!/bin/sh

#PBS -lwalltime=72:00:00
#PBS -lselect=1:ncpus=32:mem=124gb:avx2=true

module load raxml

#PATH=$PATH:/apps/raxml/8.2.9/bin

#/apps/raxml/8.2.9/bin/
raxmlHPC-PTHREADS-AVX2 -T 20 -s /rds/general/project/fisher-aspergillus-results/live/SNPs/finalSNPs/all_isolates_withRef.fa -m GTRCAT -p 12345 -f a -x 12345 -N 30 -n Global -w /rds/general/project/fisher-aspergillus-results/live/Phylogeny
