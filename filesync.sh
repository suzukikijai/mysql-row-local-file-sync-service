#!/bin/bash
cd ~/Downloads
query_array=(jobtitle LocationWithCountry pdatewords expwords badwords overviewwords jobDurTypeWords jobTitleOtherWordsCheck no_jobs skills no_of_pos_forDesc no_of_pos_forTitle ConjuctivesRmvWords CoreWords Dept FirstWords_ToFindJob SecondWords_ToFindJob WorngTitleWords CareerDeciderWordsFirst CareerDeciderWordsSecond jobboard MailFindingWordsFirst MailFindingWordsSecond SiteEntryWords)
for i in ${query_array[@]}
do 
#$i
mysql --host=192.168.1.15 --user=root --password=careersnow@123 --port=3306 -e "SELECT distinct $i FROM scrapperdb.matching_txts" > $i.txt
ex -sc '1d2|x' $i.txt
done

