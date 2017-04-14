#!/bin/bash
source "/data/zhoulab/yuxinghai/wangylab/soft/utilis.sh"

RAWDIR=/data3/zhoulab/yuxinghai/GBM/
DESDIR=/data3/zhoulab/yuxinghai/GBM/01_fasqc
LANES=(ERR315455 ERR315477 SRR950079 SRR950081)
numLanes=${#LANES[@]}


for (( i=0; i<${numLanes}; i++ )); do
    lane=${LANES[$i]}
    f_fq1=${RAWDIR}/${lane}_1P
    f_fq2=${RAWDIR}/${lane}_2P
    mkdir -p ${DESDIR}/${lane}_trim1
    exist_or_run "fastqc -f fastq -o ${DESDIR}/${lane} ${f_fq1} ${f_fq2}"
done

