#!/bin/bash

conda activate abricate

PLASMID_DIR="Case_study_mobsuite"
OUTPUT_DIR_VIR="Case_study_abricate/virulence"
OUTPUT_DIR_RES="Case_study_abricate/amr"

mkdir -p $OUTPUT_DIR_VIR $OUTPUT_DIR_RES

for dir in $PLASMID_DIR/*/; do
  sample=$(basename "$dir")
  abricate $dir/plasmid*.fasta --db vfdb > "$OUTPUT_DIR_VIR/${sample}_plasmid_virulence.tab"
  abricate $dir/plasmid*.fasta --db card > "$OUTPUT_DIR_RES/${sample}_plasmid_amr.tab"
done

abricate --summary "$OUTPUT_DIR_VIR"/*.tab > "$OUTPUT_DIR_VIR/virulence_summary.tab"
abricate --summary "$OUTPUT_DIR_RES"/*.tab > "$OUTPUT_DIR_RES/amr_summary.tab"
