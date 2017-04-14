#!/usr/bin/env bash
source "/data/zhoulab/yuxinghai/wangylab/soft/utilis.sh"
DESDIR=//data3/zhoulab/yuxinghai/GBM

NAMES=(ERR315455 ERR315477 SRR950079 SRR950081)

genome_tran_index=/data/zhoulab/yuxinghai/annotiation/grch38_tran/genome_tran
gtffile=/data3/zhoulab/yuxinghai/anotiation/Homo_sapiens.GRCh38.84.gtf
numSamples=${#NAMES[@]}
for (( i=0; i<${numSamples}; i++ )); do
    name=${NAMES[$i]}
    #mkdir -p ${DESDIR}/${name}
    #fastq1_gz=${RAWDIR}/${name}.read1_Clean.fq.gz
    #fastq2_gz=${RAWDIR}/${name}.read2_Clean.fq.gz
    fastq1=${DESDIR}/${name}_1P
    #exist_or_run "gunzip -c ${fastq1_gz} > ${fastq1}" ${fastq1}
    fastq2=${DESDIR}/${name}_2P
    #exist_or_run "gunzip -c ${fastq2_gz} > ${fastq2}" ${fastq2}

    f_sam=${DESDIR}/${name}.tran_map.sam
    f_unmap=${DESDIR}/${name}.tran_unmap.fq
    exist_or_run "hisat2 -p 12 --dta --no-mixed --no-discordant -x ${genome_tran_index} --un-conc ${f_unmap} -1 ${fastq1} -2 ${fastq2} -S ${f_sam}"



done

