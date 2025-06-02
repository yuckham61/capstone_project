# Shell script to allign the genome

\set -e #This set up is to stop the code if error arise in any step rather than going to the subsequent step



# Download the genome from this url
#genome_url="ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/017/985/GCA_000017985.1_ASM1798v1/GCA_000017985.1_ASM1798v1_genomic.fna.gz"

#To download the genome from the above url
#wget -O data/genomes/ecoli_rel606.fna.gz $genome_url
#gunzip data/genomes/ecoli_rel606.fna.gz


# Make all the required directories here
#mkdir data/genomes
#mkdir results/sam
#mkdir results/bam
mkdir  results/bcf results/vcf


# Load all the required modules here
#Load BWA
module load BWA/0.7.18-GCCcore-13.3.0

# Load Sam 
module load SAMtools/1.18-GCC-12.3.0 

# Load bcftools
module load BCFtools/1.18-GCC-12.3.0 

# Index the complete genome of E. coli
# bwa is one of the indexing tool
#bwa index data/genomes/ecoli_rel606.fna

#Once indexing is done, allignment needs to be done

# Loop over various paired reads only and allign the reads to the reference genome
for fwd in data/trimmed_fastq/*_1.paired.fastq.gz
do
sample=$(basename $fwd _1.paired.fastq.gz) 

rev="data/trimmed_fastq/${sample}_2.paired.fastq.gz"

#echo $sample
#echo $fwd
#echo $rev
echo "processing sample $sample"
# Alignment step with the bwa module
#bwa mem data/genomes/ecoli_rel606.fna "$fwd" "$rev" > results/sam/${sample}.sam

# Convert SAM files to BAM files
samtools view -S -b results/sam/$sample.sam > results/bam/$sample.bam


# Sorting the bam files for indexing and visualization

samtools sort results/bam/${sample}.bam -o results/bam/${sample}.sorted.bam

# Indexing the sorted BAM files
samtools index results/bam/${sample}.sorted.bam


# Variant calling: Generate bcf
bcftools mpileup -O b -o results/bcf/${sample}.bcf -f data/genomes/ecoli_rel606.fna results/bam/${sample}.sorted.bam


#Variant calling: Generate vcf file
bcftools call --ploidy 1 -m -v -o results/vcf/${sample}.vcf results/bcf/${sample}.bcf

echo "Finishing processing sample : $sample"

done

echo "All samples successfully porcessed"
