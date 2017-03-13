for sample in *VTrinityAlignemnt; do oldschool=${PWD##*/} ; cd ${sample} ; homesweet=${PWD##*/} ;
		NewFile=${homesweet%_VTrinityAlignemnt}; variable=`samtools view -c bowtie.bam` ; 
		echo ${NewFile}	${variable} > ${NewFile}_MappedRead.txt; mv ${NewFile}_MappedRead.txt .. ; cd .. ;
		cat ${NewFile}_MappedRead.txt >> ${oldschool}FPKMMappedReads.txt ; rm ${NewFile}_MappedRead.txt ; done  










