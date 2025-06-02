# Run the quality control on the raw data ( we have paired end sequencing results for sample)

# Run the fastqc on my raw data
#module load FastQC/0.11.9-Java-11
#fastqc -o results/qc_results data/raw_fastq/*.fastq.gz

#Run Multiqc to compile the FASTqc results
#module load MultiQC/1.14-foss-2022a
#multiqc -o results/multiqc_results results/qc_results

#Trimming the ADAPTER from the read sequences
#module load Trimmomatic/0.39-Java-13

#TRIMMOMATIC="java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar"

#for fwd in data/raw_fastq/*_1.fastq.gz
#do
 #   sample=$(basename $fwd _1.fastq.gz)
  #  rev="data/raw_fastq/${sample}_2.fastq.gz"

   # echo "Processing sample: $sample"

    #$TRIMMOMATIC PE \
    #data/raw_fastq/${sample}_1.fastq.gz data/raw_fastq/${sample}_2.fastq.gz \
    #data/trimmed_fastq/${sample}_1.paired.fastq.gz data/trimmed_fastq/${sample}_1.unpaired.fastq.gz \
    #data/trimmed_fastq/${sample}_2.paired.fastq.gz data/trimmed_fastq/${sample}_2.unpaired.fastq.gz \
    #ILLUMINACLIP:data/raw_fastq/NexteraPE-PE.fa:2:30:10 \
    #LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
#done


#Run the FASTQ on my trimmed data reads
module load FastQC/0.11.9-Java-11
mkdir data/fastqc_trimmed_results
fastqc -o data/fastqc_trimmed_results data/trimmed_fastq/*.fastq.gz

#Run MitliQC to compile the trimmed FASTQC results
module load MultiQC/1.14-foss-2022a

multiqc -o data/multi_fastqc_trimmed_results data/fastqc_trimmed_results
