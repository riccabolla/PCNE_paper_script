#!/bin/bash

conda activate platon

INPUT_DIR="Shovill_30x" 
PLATON_DB="Platon_db"
OUTPUT_DIR="Platon"

for dir in "$INPUT_DIR"/*/; do
  dir_name=$(basename "$dir")
  mkdir -p "$OUTPUT_DIR/$dir_name"
  platon --db "$PLATON_DB" --prefix "$dir_name" -t 6 "$dir/${dir_name}.fasta" -o "$OUTPUT_DIR/$dir_name/"
  rm "$OUTPUT_DIR/$dir_name/"*.json "$OUTPUT_DIR/$dir_name/"*.tsv "$OUTPUT_DIR/$dir_name/"*.log
done

conda activate pcne

READS="Sim_30x"

for file_R1 in "$READS"/*_R1.fastq.gz; do
  file_R2="${file_R1/_R1.fastq.gz/_R2.fastq.gz}"
  sample_name=$(basename "$file_R1" _R1.fastq.gz)  
  chrom="$OUTPUT_DIR/$sample_name/${sample_name}.chromosome.fasta"
  plasmid="$OUTPUT_DIR/$sample_name/${sample_name}.plasmid.fasta"
  pcne -c "$chrom" -p "$plasmid" -r "$file_R1" -R "$file_R2" -t 5 --single-plasmid --plot -o "$OUTPUT_DIR/$sample_name/${sample_name}_base"
  pcne -c "$chrom" -p "$plasmid" -r "$file_R1" -R "$file_R2" -b -t 5 --single-plasmid --plot -o "$OUTPUT_DIR/$sample_name/${sample_name}_scg"
  pcne -c "$chrom" -p "$plasmid" -r "$file_R1" -R "$file_R2" -b --gc-correction --gc-plot "$OUTPUT_DIR/$sample_name/${sample_name}_gc.png" -t 5 --single-plasmid --plot -o "$OUTPUT_DIR/$sample_name/${sample_name}_scg_filter_gc"
done
