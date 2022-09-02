#!/bin/sh
 
#PBS -l walltime=72:00:00
#PBS -l select=1:ncpus=16:mem=32gb
## This tells the batch manager to re-run job with parameter varying from 1 to N in steps on step-size
 
## OTHER OPTIONAL PBS DIRECTIVES
 
module load bcftools

vcf=/rds/general/project/fisher-aspergillus-results/live/SNPs/finalSNPs/all_isolates_withRef.vcf

for samp in $(bcftools query -l ${vcf})
do
printf '>'${samp}'\n'
bcftools query -s ${samp} -f '[%TGT]' ${vcf}
printf '\n'
done > /rds/general/project/fisher-aspergillus-results/live/SNPs/finalSNPs/all_isolates_withRef.fa
