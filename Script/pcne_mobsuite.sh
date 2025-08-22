#!/bin/bash

conda activate mobsuite

INPUT_DIR="Shovill_50x" 
OUTPUT_DIR="Mobsuite"

for dir in "$INPUT_DIR"/*/; do
  dir_name=$(basename "$dir")
  mkdir -p "$OUTPUT_DIR/$dir_name"
  mob_recon --infile "$dir/${dir_name}.fasta" -n 5 --outdir "$OUTPUT_DIR/$dir_name/"
done

conda activate pcne

READS="Sim_50x"

for file_R1 in "$READS"/*_R1.fastq.gz; do
  file_R2="${file_R1/_R1.fastq.gz/_R2.fastq.gz}"
  sample_name=$(basename "$file_R1" _R1.fastq.gz)  
  chrom="$OUTPUT_DIR/$sample_name/chromosome.fasta"
  plasmid="$OUTPUT_DIR/$sample_name/plasmid_AC125.fasta"
  pcne -c "$chrom" -p "$plasmid" -r "$file_R1" -R "$file_R2" -t 5 --single-plasmid --plot -o "$OUTPUT_DIR/$sample_name/${sample_name}_base"
  pcne -c "$chrom" -p "$plasmid" -r "$file_R1" -R "$file_R2" --gc-correction --gc-plot -t 5 --single-plasmid --plot -o "$OUTPUT_DIR/$sample_name/${sample_name}_gc_cor"
done
  
