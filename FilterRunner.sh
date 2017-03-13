while read p; do
		cd $p
		python TableFilter.py
		cd ..
  done < SUNFLOWERDIRECTORYNAMES.txt











