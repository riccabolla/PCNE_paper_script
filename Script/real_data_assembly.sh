#!/bin/bash

conda activate shovill

INPUT_DIR="Real_data_reads"
OUTPUT_DIR="Real_data_assembly"

for f1 in "$INPUT_DIR"/*_R1.fastq.gz; do
	sample_name=$(basename "$f1" _R1.fastq.gz)
	f2="${f1/_R1.fastq.gz/_R2.fastq.gz}"
	out="$OUTPUT_DIR/$sample_name"
	shovill --R1 "$f1" --R2 "$f2" --outdir "$out" --cpus 5 --ram 16 --assembler spades
done
