#!/bin/bash

while read badword
	do


	#echo "${badword}"


	while read line 
		do
                
		echo ${line}
		
		if test -f "${line}" && [[ "${line}" == *"${badword}"* ]]; then
                        
			echo "CENSORED" ${line} | tee -a censored.txt 
		
			mv ${line} "CENSORED/"

		fi

	done <sub_newsgroups.txt

done <badwords.csv



while read line 
		do
		if test -f ${line} && [[ ${line} == *".sex."* ]]; then
			echo "CENSORED" ${line} | tee -a censored.txt 
		
			mv ${line} "CENSORED/"

		fi


	done <sub_newsgroups.txt


# Big 8
mv sci*.pickle sci/
mv soc*.pickle soc/
mv humanities*.pickle humanities/
mv misc*.pickle misc/
mv talk*.pickle talk/
mv comp*.pickle comp/
mv rec*.pickle rec/
mv news*.pickle news/
# Alt
mv alt*.pickle alt/
# Everything Else
mv *.*.pickle OTHER/
