#!/usr/bin/bash
DESDIR=//data3/zhoulab/yuxinghai/GBM
NAMES=(ERR315455 ERR315477 SRR950079 SRR950081)
chrom_size=/data/zhoulab/yuxinghai/ChenshiLab/hg38.chrom.sizes_chr
numSamples=${#NAMES[@]}
for (( i=0; i<${numSamples}; i++ )); do
    name=${NAMES[$i]}
    f_sam=${name}.tran_map.sam
    

    f_unique_bam=${name}_unique.bam
    f_input_sort=${name}_unique_by_cord.bam
    samtools view -@ 8 -h -bF 4 ${f_sam} > ${f_unique_bam}
    samtools sort -@ 8 ${f_unique_bam} -o ${f_input_sort}
    samtools index ${f_input_sort}
    bam2wig.py -i ${f_input_sort} -o ${name} -t 1000000000 -s ${chrom_size} -u

done
