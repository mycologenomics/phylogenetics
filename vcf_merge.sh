#!/bin/sh

#PBS -lwalltime=72:00:00
#PBS -lselect=1:ncpus=32:mem=124gb:avx2=true

module load vcftools
module load tabix

#PATH=$PATH:/apps/tabix:/apps/vcftools/bin

/apps/vcftools/0.1.12/bin/vcf-merge -R 0 /rds/general/project/fisher-aspergillus-results/live/SNPs/finalSNPs/*vcf.gz > /rds/general/project/fisher-aspergillus-results/live/SNPs/finalSNPs/all_isolates_withRef.vcf
