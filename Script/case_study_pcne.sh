#!/bin/bash 

conda activate pcne

READS_DIR="Case_study_reads"
MOBSUITE_DIR="Case_study_mobsuite"
PCNE_DIR="Case_study_pcne"

for f1 in "$READS_DIR"/*_R1.fastq.gz; do
    sample_name=$(basename "$f1" _R1.fastq.gz)
    f2="${f1/_R1.fastq.gz/_R2.fastq.gz}"
    mob_sample_dir="$MOBSUITE_DIR/$sample_name"
    chrom_fasta="$mob_sample_dir/chromosome.fasta"
    out_pcne_sample_dir="$PCNE_DIR/$sample_name"
    mkdir -p "$out_pcne_sample_dir"
    plasmid_files=$(find "$mob_sample_dir" -maxdepth 1 -type f -name "*.fasta" ! -name "chromosome.fasta")
    for plasmid_fasta in $plasmid_files; do
        plasmid_name=$(basename "$plasmid_fasta" .fasta)
        pcne_output_prefix="$out_pcne_sample_dir/${sample_name}_${plasmid_name}_gc_cor"        
        pcne -c "$chrom_fasta" -p "$plasmid_fasta" -r "$f1" -R "$f2" \
             --gc-correction --gc-plot -t 5 \
             --single-plasmid --plot \
             -o "$pcne_output_prefix"
    done
done
