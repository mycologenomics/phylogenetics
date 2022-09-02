# phylogenetics
Using whole genome SNPs to create phylogeny using RAxML

I would use only the final SNP files. To do this, I would take the filtered_snps_final.vcf created in the pipeline, and remove SNPs with the 'GQ_FILTER-50' tag. I would then change all SNPs labelled as 'low confidence' to 'N'. This is because we still want to include them in the phylogeny. We cannot be certain there isn't or is a SNP there - it's just that we are not confident about it. Marking this position as 'N' suggests it's 'missing'.

>grep -v "FILTER_GQ-50" file.filtered_snps_final.vcf | awk -vOFS='\t' '$7 ~ /LowConf$/ {$5 = "N"}1' > file.finalSNPs.vcf

Put all your *.finalSNPs.vcf files in one directory

Compress then with bgzip and then index with tabix:

bgzip file.finalSNPs.vcf
tabix -p vcf file.finalSNPs.vcf.gz

Use the 'vcf_merge.sh' script to merge all your vcfs into one file

Then use multiVCF_to_fasta.sh to convert to a fasta format

Use raxml_bootstrap_global.sh to perform rapid bootstrap analysis to generate a phylogeny.

Obviously change file names/directories as needed

The multi VCF/fasta can also be used in other analyses, such as adegenet
