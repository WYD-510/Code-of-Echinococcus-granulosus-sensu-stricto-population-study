while read -r regionid region
do
echo "freebayes -f /jdfssz1/ST_HEALTH/P20Z10200N0206/renzirui/Echinococcus/0.Reference/GCA_021556725.1_ASM2155672v1_genomic.fna -L /jdfssz1/ST_HEALTH/P20Z10200N0206/renzirui/Echinococcus/4.SubSampling/allsamples.rglist -p 2 --standard-filters -r $region > /jdfssz1/ST_HEALTH/P20Z10200N0206/renzirui/Echinococcus/5.VariantCalling/freebayes_splitRegions/EgG1_$regionid.vcf" > qsub_freebayes/fb_$regionid.sh
qsub -clear -wd /jdfssz1/ST_HEALTH/P20Z10200N0206/renzirui/Echinococcus/5.VariantCalling/qsub_freebayes -q st.q -P P20Z10200N0206 -binding linear:1 -l vf=24G,num_proc=1 qsub_freebayes/fb_$region.sh
done < splitregions.tsv
