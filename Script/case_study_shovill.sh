#!/bin/bash

conda activate shovill

READS_DIR="Case_study_reads"
OUTDIR="Case_study_assembly"

for f1 in $READS_DIR/*_R1.fastq.gz; do
  f2="${f1/_R1.fastq.gz/_R2.fastq.gz}"
  sample_name=$(basename "$f1" _R1.fastq.gz)
  out="$OUTDIR/$sample_name"
  shovill --R1 "$f1" --R2 "$f2" --outdir "$out" --cpus 5 --ram 16 --assembler spades
  mv "$out/contigs.fa" "$out/${sample_name}.fasta"
done
