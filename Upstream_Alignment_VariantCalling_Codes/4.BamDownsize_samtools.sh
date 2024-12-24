cwd=/jdfssz1/ST_HEALTH/P20Z10200N0206/renzirui/Echinococcus/3.LibMerging
while read -r sampleid x y downfrac
do
echo "samtools view --subsample $downfrac --subsample-seed 37 $cwd/3.3.AllSorted/$sampleid.sorted.bam -bS -o /jdfssz1/ST_HEALTH/P20Z10200N0206/renzirui/Echinococcus/4.SubSampling/SubSampled/$sampleid.downsized.bam
samtools stats /jdfssz1/ST_HEALTH/P20Z10200N0206/renzirui/Echinococcus/4.SubSampling/SubSampled/$sampleid.downsized.bam > /jdfssz1/ST_HEALTH/P20Z10200N0206/renzirui/Echinococcus/4.SubSampling/SamtoolsStats/$sampleid.downsized.bam.stat" > qsub/ds_$sampleid.sh
qsub -clear -wd $cwd/qsub -q st.q -P P20Z10200N0206 -binding linear:1 -l vf=4G,num_proc=1 qsub/ds_$sampleid.sh
done < SubSampling_Ratio_rerun.tsv
