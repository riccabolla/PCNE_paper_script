#!/bin/bash

conda activate mobsuite

INPUT_DIR="Case_study_assembly" 
OUTPUT_DIR="Case_study_mobsuite"

for dir in "$INPUT_DIR"/*/; do
  dir_name=$(basename "$dir")
  mkdir -p "$OUTPUT_DIR/$dir_name"
  mob_recon --infile "$dir/${dir_name}.fasta" -n 5 --outdir "$OUTPUT_DIR/$dir_name/" --force
done
