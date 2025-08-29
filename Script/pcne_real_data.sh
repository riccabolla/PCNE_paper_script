#!/bin/bash

INPUT=" Real_data_reads"
OUTPUT="pcne_real_data"
DIR="Platon_real_data"

mkdir -p $OUTPUT

for file_R1 in $INPUT/*_R1.fastq.gz; do
  file_R2="${file_R1/_R1.fastq.gz/_R2.fastq.gz}"
  sample_name=$(basename "$file_R1" _R1.fastq.gz)
  CHROMOSOME="$DIR"/"$sample_name"/"$sample_name".chromosome.fasta
  PLASMID="$DIR"/"$sample_name"/"$sample_name".plasmid.fasta
  pcne -c  $CHROMOSOME -p $PLASMID -r ${file_R1} -R ${file_R2} -t 5 --single-plasmid  --plot --gc-correction --gc-plot -o $OUTPUT/${sample_name}_gc
  pcne -c  $CHROMOSOME -p $PLASMID -r ${file_R1} -R ${file_R2} -t 5 --single-plasmid  --plot -o $OUTPUT/${sample_name}_nogc
done
