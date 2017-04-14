#!/usr/bin/env bash
source "/data/zhoulab/yuxinghai/wangylab/soft/utilis.sh"
DESDIR=/data3/zhoulab/yuxinghai/GBM

NAMES=(ERR315455 ERR315477 SRR950079 SRR950081)

numSamples=${#NAMES[@]}
for (( i=0; i<${numSamples}; i++ )); do
    name=${NAMES[$i]}
    fastq1=${DESDIR}/${name}_1.fastq
    fastq2=${DESDIR}/${name}_2.fastq
    java -jar /data/zhoulab/yuxinghai/tools/Trimmomatic-0.36/trimmomatic-0.36.jar PE ${fastq1} ${fastq2} -baseout ${name} -threads 5 ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

done
