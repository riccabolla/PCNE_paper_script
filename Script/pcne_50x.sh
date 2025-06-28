#!/bin/bash

conda activate pcne

INPUT_50X="Sim_50X"
OUTPUT_50X="pcne_50x"
CHROMOSOME="CP003200.1_chrom.fasta"
PLASMID="CP003223.1_plasmid.fasta"

mkdir -p $OUTPUT_50X

for file_R1 in $INPUT_50X/*_R1.fastq.gz; do
  file_R2="${file_R1/_R1.fastq.gz/_R2.fastq.gz}"
  sample_name=$(basename "$file_R1" _R1.fastq.gz)
  pcne -c $CHROMOSOME -p $PLASMID -r $INPUT_50X/${file_R1} -R $INPUT_50X/${file_R2} -t 5  --plot -o $OUTPUT_50X/${sample_name}_base 
  pcne -c $CHROMOSOME -p $PLASMID -r $INPUT_50X/${file_R1} -R $INPUT_50X/${file_R2} -t 5 --plot -b -o $OUTPUT_50X/${sample_name}_scg 
  pcne -c $CHROMOSOME -p $PLASMID -r $INPUT_50X/${file_R1} -R $INPUT_50X/${file_R2} -t 5 --plot -b --gc-correction --gc-plot $OUTPUT_50X/${sample_name}.png -Q 10 -F 2308 -o $OUTPUT_50X/${sample_name}_scg_filter_gc
done  
