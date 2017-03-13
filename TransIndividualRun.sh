while IFS= read -r file ; do echo -e "

../../trinityrnaseq_r20140717/util/align_and_estimate_abundance.pl --transcripts /home/pabster212/bigdata1/Trinity.fasta --seqType fq --thread_count 20 --left $PWD/${file}_total_forward.fq --right $PWD/${file}_total_reverse.fq --est_method RSEM --aln_method bowtie --bowtie_RSEM '--all --best --strata -v 3 -m 700 --chunkmbs 512' --prep_reference --output_dir ${file}_VTrinityAlignemnt

" >> "${PWD##*/}".sh ; done < "UniqDirectory"





