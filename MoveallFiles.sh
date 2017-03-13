for line in `cat SUNFLOWERDIRECTORYNAMES.txt` ; do cd $line ; 
		mv *TotalFPKM.txt ..  ; cd ..   ; done 

