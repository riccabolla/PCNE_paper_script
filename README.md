# PCNE_paper_script
Tutorial to reproduce data presented in paper "TBD". 

# Requirements
You will need the following files:
* The chromosome file ([here](./data/chromosome/))
* The plasmid file ([here](./data/plasmid/))

The following tools and relative dependencies are required:
* [Shovill](https://github.com/tseemann/shovill)
* [Mob-SUITE](https://github.com/phac-nml/mob-suite)
* [Platon](https://github.com/oschwengers/platon)
* [PCNE](https://github.com/riccabolla/PCNE)
* [Art](https://www.niehs.nih.gov/research/resources/software/biostatistics/art)

All the analyses have been performed in separate conda env
```
conda create -n pcne -c bioconda pcne
conda create -n mobsuite -c bioconda mobsuite
conda create -n platon -c bioconda platon
conda create -n shovill -c bioconda shovill
conda create -n art -c bioconda art
```
# File prepartion
1) Create a folder named "Data"
2) Put the chromosome and plasmid file in Data

# Generate reads
In Data/ execute the script [art.sh](./script/art.sh)

