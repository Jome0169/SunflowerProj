for line in `cat SUNFLOWERDIRECTORYNAMES.txt` ; do cp fpkmCalculation.sh $line/; 
		cd $line ; `bash fpkmCalculation.sh`; cd ..;   done 

