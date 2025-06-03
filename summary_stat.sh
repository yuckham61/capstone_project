# To make summary of reads (raw, trimmed and alligned)

# To redirect the files to the tidy format file
#echo -e interprets this \t as a tab function to give distinction
#echo -e "filename\ttype\treads" > summary_stats.tsv

#for raw in data/raw_fastq/*.fastq.gz
#do 
#reads=$(zcat $raw | wc -l |awk '{print $1/4}')
#echo -e "$raw\traw\t$reads" >> summary_stats.tsv
#done 


#To get the read length from the trimmed file

#for trim in data/trimmed_fastq/*.fastq.gz
#do
#echo $trim
#reads=$(zcat $trim | wc -l |awk '{print $1/4}')
#echo -e "$trim\ttrimmed\t$reads" >> summary_stats.tsv
#done


#To count alligned reads from the sorted bam files
#module load SAMtools/1.18-GCC-12.3.0

#echo -e "sample\taligned_reads" > aligned_counts.tsv

#for bam in results/bam/*.sorted.bam
#do
#echo $bam
 # reads=$(samtools view -F 0x4 "$bam" | wc -l) #samtools view... filters out unmapped reads and counts only rads that aligned to the genome
  #echo -e "$bam\taligned\t$reads" >> summary_stats.tsv
#done

#To get the variant site counting step
for vcf in results/vcf/*.vcf
do
echo $vcf
done
