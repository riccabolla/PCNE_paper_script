#!/bin/bash

conda activate pcne
INPUT_30X="Sim_30x"
OUTPUT_30X="pcne_30x"
CHROMOSOME="CP003200.1_chrom.fasta"
PLASMID="CP003223.1_plasmid.fasta"

mkdir -p $OUTPUT_30X

for file_R1 in $INPUT_30X/*_R1.fastq.gz; do
  file_R2="${file_R1/_R1.fastq.gz/_R2.fastq.gz}"
  sample_name=$(basename "$file_R1" _R1.fastq.gz)
  pcne -c $CHROMOSOME -p $PLASMID -r ${file_R1} -R ${file_R2} -t 4  --plot -o $OUTPUT_30X/${sample_name}_base 
  pcne -c $CHROMOSOME -p $PLASMID -r ${file_R1} -R ${file_R2} -t 4 --plot -b -o $OUTPUT_30X/${sample_name}_scg 
  pcne -c $CHROMOSOME -p $PLASMID -r ${file_R1} -R ${file_R2} -t 4 -b --gc-correction --gc-plot ${sample_name}.png -Q 10 -F 2308 -o $OUTPUT_30X/${sample_name}_scg_filter_gc
done  
  
  
