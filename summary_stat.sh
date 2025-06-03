for raw in data/raw_fastq/*.fastq.gz
do 
echo $raw
zcat $raw | wc -l
done 

for trim in data/trimmed_fastq/*.fastq.gz
do
echo $trim
zcat $trim | wc -l
done
