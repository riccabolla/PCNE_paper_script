# PCNE workflow
Tutorial to reproduce data presented in the paper "TBD". 

## Requirements
You will need the following files:
* The chromosome file ([here](./data/chromosome/))
* The plasmid file ([here](./data/plasmid/))

The following tools and relative dependencies are required:
* [Shovill](https://github.com/tseemann/shovill)
* [Mob-SUITE](https://github.com/phac-nml/mob-suite)
* [Platon](https://github.com/oschwengers/platon)
* [PCNE](https://github.com/riccabolla/PCNE)
* [Art](https://www.niehs.nih.gov/research/resources/software/biostatistics/art)

All the analyses have been performed in a separate conda env
```
conda create -n pcne -c bioconda pcne
conda create -n mobsuite -c bioconda mobsuite
conda create -n platon -c bioconda platon
conda create -n shovill -c bioconda shovill
conda create -n art -c bioconda art
```
For further details, look at the respective manual.

## File preparation
Go to the working directory and put the chromosome and plasmid files in it.

## Generate reads
In the working directory, execute the script [art.sh](./Script/art.sh)

## Test PCNE
In the working directory, execute the script [pcne_30x.sh](./Script/pcne_30x.sh) and [pcne_50x.sh](./Script/pcne_50x.sh). 

## Assembly simulated reads
In the working directory, execute the script [shovill.sh](./Script/shovill.sh)

## Test PCNE + Platon
In the working directory, execute the script [pcne_platon.sh](./Script/pcne_platon.sh)

## Test PCNE + MOBSuite
In the working directory, execute the script [pcne_mobsuite.sh](./Script/pcne_mobsuite.sh)

