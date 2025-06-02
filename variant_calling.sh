# Shell script to allign the genome

\set -e #This set up is to stop the code if error arise in any step rather than going to the subsequent step



# Download the genome from this url
#genome_url="ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/017/985/GCA_000017985.1_ASM1798v1/GCA_000017985.1_ASM1798v1_genomic.fna.gz"

#To download the genome from the above url
#wget -O data/genomes/ecoli_rel606.fna.gz $genome_url
gunzip data/genomes/ecoli_rel606.fna.gz


# Make all the required directories here
#mkdir data/genomes




# Load all the required modules here


