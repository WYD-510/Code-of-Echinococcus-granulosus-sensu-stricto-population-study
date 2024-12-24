for sample in `ls /jdfssz1/ST_HEALTH/P20Z10200N0206/renzirui/Echinococcus/2.ReadsMapping/SortedBam/ | awk -F_ '{print $1}' | awk -F'-' '{print $1,$2}'  | awk '{x[$1]++;} END{for(i in x) print(i ":" x[i])}' | awk -F':' '$2>1 {print $1}'`
do
echo $sample
echo "ls /jdfssz1/ST_HEALTH/P20Z10200N0206/renzirui/Echinococcus/2.ReadsMapping/SortedBam/$sample* | xargs samtools merge -@ 1 -nrf /jdfssz1/ST_HEALTH/P20Z10200N0206/renzirui/Echinococcus/3.LibMerging/${sample}_merged.bam" > qsub/mg_$sample.sh
qsub -clear -wd /jdfssz1/ST_HEALTH/P20Z10200N0206/renzirui/Echinococcus/qsub -q st.q -P P20Z10200N0206 -binding linear:1 -l vf=4G,num_proc=1 qsub/mg_$sample.sh
done

