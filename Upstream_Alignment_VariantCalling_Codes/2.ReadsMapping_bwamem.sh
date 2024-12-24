NCPU=4
while read -r prefix srun sid
do
echo "bwa mem $ref ${prefix}_1.filt.fq.gz ${prefix}_2.filt.fq.gz -t $NCPU -R \"@RG\\tID:$sid\\tSM:$sid\" | samtools view -bS -F 4 -o $pwd/MappedBam/${srun}_filt.bam" > qsub/${srun}_bwa.sh
qsub -clear -wd $pwd/qsub -q st.q -P P20Z10200N0206 -binding linear:4 -l vf=16G,num_proc=4 qsub/${srun}_bwa.sh
done < cleanreads_prefixANDsrunANDsid_head150.tsv
