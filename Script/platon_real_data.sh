#!/bin/bash

conda activate platon

INPUT_DIR="Real_data_assembly" 
PLATON_DB="Platon_db"
OUTPUT_DIR="Platon_real_data"

for dir in "$INPUT_DIR"/*/; do
  dir_name=$(basename "$dir")
  mkdir -p "$OUTPUT_DIR/$dir_name"
  platon --db "$PLATON_DB" --prefix "$dir_name" -t 5 "$dir/${dir_name}.fasta" -o "$OUTPUT_DIR/$dir_name/"
  rm "$OUTPUT_DIR/$dir_name/"*.json "$OUTPUT_DIR/$dir_name/"*.tsv "$OUTPUT_DIR/$dir_name/"*.log
done
