#!/bin/bash 

conda activate art

mkdir -p Sim_50x
cd Sim_50x
art_illumina -ss MSv3 -p -l 150 -m 500 -s 50 -f 50 -i ../CP003200.1_chrom.fasta -o chrom_50x_
art_illumina -ss MSv3 -p -l 150 -m 500 -s 50 -f 50 -i ../CP003223.1_plasmid.fasta -o plasmid_1x_
art_illumina -ss MSv3 -p -l 150 -m 500 -s 50 -f 100 -i ../CP003223.1_plasmid.fasta -o plasmid_2x_
art_illumina -ss MSv3 -p -l 150 -m 500 -s 50 -f 250 -i ../CP003223.1_plasmid.fasta -o plasmid_5x_

rm *.aln

rename 's/_1\./_R1./' *.fq
rename 's/_2\./_R2./' *.fq

cat chrom_50x_R1.fq plasmid_1x_R1.fq > Sim_50x_1copy_R1.fastq
cat chrom_50x_R2.fq plasmid_1x_R2.fq > Sim_50x_1copy_R2.fastq
cat chrom_50x_R1.fq plasmid_2x_R1.fq > Sim_50x_2copy_R1.fastq
cat chrom_50x_R2.fq plasmid_2x_R2.fq > Sim_50x_2copy_R2.fastq
cat chrom_50x_R1.fq plasmid_5x_R1.fq > Sim_50x_5copy_R1.fastq
cat chrom_50x_R2.fq plasmid_5x_R2.fq > Sim_50x_5copy_R2.fastq

gzip *.fastq
rm *.fq
