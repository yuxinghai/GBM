#!/bin/bash
NAMES=(ERR315455 ERR315477 SRR950079 SRR950081)
des=./
numSamples=${#NAMES[@]}
for (( i=0; i<${numSamples}; i++ )); do
    name=${NAMES[$i]}
    f_sra=${name}.sra
    fastq-dump --split-3 ${f_sra} -O ${des}

done
