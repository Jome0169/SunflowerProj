for sample in `cat SUNFLOWERDIRECTORYNAMES.txt`; do cd $sample;
		oldschool=${PWD##*/} ; 
		for directory in *_VTrinityAlignemnt; do cd $directory ; result=${PWD##*/} ; 
		NewFile=${result%_VTrinityAlignemnt};
		output=`cat RSEM.isoforms.results | awk '{ sum+=$7} END {print sum}'`;
		cd .. ; echo $NewFile $output >> ${oldschool}_TotalFPKM.txt;  done ; cd .. ; done 
