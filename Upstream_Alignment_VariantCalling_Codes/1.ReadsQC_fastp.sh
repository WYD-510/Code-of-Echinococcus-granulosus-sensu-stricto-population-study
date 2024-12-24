NCPU=2
WDIR=/jdfssz1/ST_HEALTH/P20Z10200N0206/renzirui/Echinococcus/ReadsQC
while read -r line
do
sid=`echo $line | awk -F/ '{print $NF}'`
echo $sid
echo "fastp --detect_adapter_for_pe --adapter_sequence AAGTCGGAGGCCAAGCGGTCTTAGGAAGACAA --adapter_sequence_r2 AAGTCGGATCGTAGCCATGTCGTTCTGTGAGCCAAGGAGTTG --dedup --dup_calc_accuracy 3 --dont_eval_duplication --qualified_quality_phred 20 --n_base_limit 5 --average_qual 20 --length_required 50 --low_complexity_filter --correction --thread $NCPU -i ${line}1.filt.fq.gz -o ${WDIR}/Filtered/${sid}1.filt.fq.gz -I ${line}2.filt.fq.gz -O ${WDIR}/Filtered/${sid}2.filt.fq.gz --json $WDIR/json/${sid}fastp.json --html $WDIR/html/${sid}fastp.html" > $WDIR/qsub/${sid}fastp.sh
qsub -clear -wd $WDIR -q st.q -P P20Z10200N0206 -binding linear:$NCPU -l vf=8G,num_proc=$NCPU qsub/${sid}fastp.sh
done < $WDIR/RawReads/Sequencing_Run.list
