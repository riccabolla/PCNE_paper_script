# PCNE workflow
Tutorial to reproduce data presented in the paper: [PCNE: a tool to estimate plasmid copy number](). <br> 

## Requirements  
All the required files (reads, assemblies ...) are available here: https://doi.org/10.5281/zenodo.17550873

The following tools and relative dependencies are required:
* [Shovill](https://github.com/tseemann/shovill)
* [Mob-SUITE](https://github.com/phac-nml/mob-suite)
* [Platon](https://github.com/oschwengers/platon)
* [PCNE](https://github.com/riccabolla/PCNE)
* [Art](https://www.niehs.nih.gov/research/resources/software/biostatistics/art)
* [InSilicoSeq](https://github.com/HadrienG/InSilicoSeq)
* [Abricate](https://github.com/tseemann/abricate)

All the analyses have been performed in a separate conda env
```
conda create -n pcne -c bioconda pcne
conda create -n mobsuite -c bioconda mob_suite
conda create -n platon -c bioconda platon
conda create -n shovill -c bioconda shovill
conda create -n art -c bioconda art
conda create -n iss -c bioconda insilicoseq
conda create -n abricate -c bioconda abricate
```
For further details, look at the respective documentation pages.

## Simulated dataset
### Hardware 
All scripts require 5 CPUs and 16 GB of RAM maximum.

### File preparation
Go to the working directory and put the [chromosome](./CP003200.1_chrom.fasta) and [plasmid](./CP003223.1_plasmid.fasta) files in it.

### Generate reads
In the working directory, execute the script [art.sh](./Script/art.sh) and [iss.sh](./Script/iss.sh)

### Test PCNE
In the working directory, execute the script [pcne_50x.sh](./Script/pcne_50x.sh). 

### Assembly simulated reads
In the working directory, execute the script [shovill.sh](./Script/shovill.sh)

### Test PCNE + Platon
First, download the platon database following [instructions](https://github.com/oschwengers/platon), and put it in the working directory. <br>
In the working directory, execute the script [pcne_platon.sh](./Script/pcne_platon.sh)

### Test PCNE + MOBSuite
In the working directory, execute the script [pcne_mobsuite.sh](./Script/pcne_mobsuite.sh)

## Real dataset

### Hardware
To reproduce real data, 5 cpus and 32 GB of memory are required

### File preparation
Download filtered reads directly from https://doi.org/10.5281/zenodo.16928752, or in alternative you can use prefetch following the [instructions](https://github.com/ncbi/sra-tools). <br>
WGS reads are deposited at SRA archive under BioProject [PRJNA1044738](https://www.ncbi.nlm.nih.gov/sra/?term=PRJNA1044738) <br>
Once downloaded, rename the reads as their sample name (ex. EM4N2) <br>
To filter reads use [FastP](https://github.com/OpenGene/fastp) setting quality filter `-q 30`

### Assembly
Put the reads in a folder named "Real_data_reads", and from working directory launch [real_data_assembly.sh](./Script/real_data_assembly.sh)

### Plasmid identification
From working directory run [platon_real_data.sh](./Script/platon_real_data.sh)

### PCNE
From working directory run [pcne_real_data.sh](./Script/pcne_real_data.sh)

## Case study

### Hardware
To reproduce real data, 5 cpus and 32 GB of memory are required

### File preparation
Download filtered reads directly from , or in alternative raw reads from [SRA](https://www.ncbi.nlm.nih.gov/sra/?term=SRP473988). <br>
Once downloaded, rename the reads as their sample name (KP_01, ...) <br>
To filter reads use [FastP](https://github.com/OpenGene/fastp) setting quality filter `-q 30` 

### Assembly
Put reads in a folder named "Case_study_reads", and from working directory launch [case_study_shovill.sh](./Script/case_study_shovill.sh).

### Plasmid identification
From working directory run [case_study_mobsuite.sh](./Script/case_study_mobsuite.sh)

### Abricate
From working directory run [case_study_abricate.sh](./Script/case_study_abricate.sh)

### PCNE
From working directory run [case_study_pcne.sh](./Script/case_study_pcne.sh)

