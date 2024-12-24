vcftools --gzvcf $basic_vcf --remove lowDP.indv --recode --recode-INFO-all --stdout | bgzip -c > $var{outpath}/freebayes_basic_snp.vcf.gz

vcftools --gzvcf Eg_G1.annot.drop3samp.vcf.gz --mac 1 --recode --recode-INFO-all --stdout > Eg_G1.annot.macge1.vcf

vcftools --vcf Eg_G1.annot.macge1.vcf --max-missing 0.8 --max-alleles 2 --minQ 30 --remove-filtered-all --recode --recode-INFO-all --stdout > Eg_G1.annot.filters1.vcf

$maxdp = （$dp_sum/($dp_n*$sample_n)）*2

vcftools --vcf Eg_G1.annot.filters1.vcf --mac 3 --min-meanDP 5 --max-meanDP 290.51282244 --remove-filtered-all --recode --recode-INFO-all --stdout | bgzip -@ 2 -c > basic_snp_dp.vcf.gz &

bcftools view -O v -S ^exclude.list -o output.vcf basic_snp_dp.vcf.gz

vcftools --vcf output.vcf --mac 3 --min-meanDP 5 --max-meanDP 290.5182244 --remove-filtered-all --recode --recode-INFO-all --stdout | bgzip -@ 2 -c > 111_sample_basic_snp_dp.vcf.gz &
