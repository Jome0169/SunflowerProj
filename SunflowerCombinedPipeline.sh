DirectoryList=SUNFLOWERDIRECTORYNAMES.txt
UniqueFileNames=SunflowerEcotype.txt


for directory in $SUNFLOWERDIRECTORYNAMES;
do
	ls ${directory}/*.fq | xargs -n 1 basename | sed 's/_.*//g' | uniq > $UniqueFileNames
	cp TotalIsoforms.txt ${directory}
	
	while read p; do
			
		java -jar /home/pabster212/bigdata1/trinityrnaseq-2.1.1/trinity-plugins/Trimmomatic/trimmomatic.jar PE -phred64 ${directory}/${p}_1.fq ${directory}/${p}_2.fq ${directory}/${p}_forward_paired.fq ${directory}/${p}_forward_unpaired.fq ${directory}/${p}_reverse_paired.fq ${directory}/${p}_reverse_unpaired.fq ILLUMINACLIP:/home/pabster212/bigdata1/sunflower_transcriptomes/contaminants.fa:2:30:10 LEADING:10 TRAILING:10 MINLEN:74
	
	
		trinityrnaseq_r20140717/util/align_and_estimate_abundance.pl --transcripts /home/pabster212/bigdata1/Trinity.fasta --seqType fq --thread_count 20 --left ${directory}/${p}_total_forward.fq --right ${directory}/${p}_total_reverse.fq --est_method RSEM --aln_method bowtie --bowtie_RSEM '--all --best --strata -v 3 -m 700 --chunkmbs 512' --prep_reference --output_dir ${directory}/${p}_TrinityAlignemnt
	
	
	done < $UniqueFileNames	

done


for directory in $SUNFLOWERDIRECTORYNAMES;
do
	for Sample in ${directory}/*_TrinityAlignemnt;
	do
		homesweet=${PWD##*/}; mv TotalIsoforms.txt ${homesweet}_totalisoforms.txt; cd $Sample ; awk '{print $6}' RSEM.isoforms.results > TempFile.txt ; result=${PWD##*/} NewFile=${result%_TrinityAlignemnt}; sed 's/TPM/'"$NewFile"'/g' TempFile.txt >  CuteFile.txt ; mv CuteFile.txt .. ; cd .. ; paste ${homesweet}_totalisoforms.txt CuteFile.txt > temptable.txt; mv temptable.txt ${homesweet}_totalisoforms.txt;

	done


	while read p; do
                cd $p
                python TableFilter.py
                cd ..
  	done < ${DirectoryList}


done



fpkmCalculation.sh

TPM.cat







