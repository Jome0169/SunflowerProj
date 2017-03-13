for line in `cat SUNFLOWERDIRECTORYNAMES.txt` ; do cd $line ;
oldschool=${PWD##*/} ; for sample in *_TrinityAlignemnt; 
do SampleName="${sample%_TrinityAlignemnt}"; 
echo $SampleName >> ${oldschool}_AllSamples.txt ; done ; 
mv ${oldschool}_AllSamples.txt /home/pabster212/bigdata1/sunflower_transcriptomes/DomesticatedLineageAlignments;
cd .. ; done


