#!/bin/bash
passwdFile=
cd /TxtModule
query_array=(jobtitle LocationWithCountry pdatewords expwords badwords overviewwords jobDurTypeWords jobTitleOtherWordsCheck no_jobs skills no_of_pos_forDesc no_of_pos_forTitle ConjuctivesRmvWords CoreWords Dept FirstWords_ToFindJob SecondWords_ToFindJob WorngTitleWords CareerDeciderWordsFirst CareerDeciderWordsSecond jobboard MailFindingWordsFirst MailFindingWordsSecond SiteEntryWords)
echo $passwdFile| sudo -S chown root:root -R /TxtModule
echo $passwdFile| sudo -S chmod 777 -R /TxtModule
for i in ${query_array[@]}
do 
#$i
echo $passwdFile| sudo -S mysql --host=192.168.1.15 --user=root --password=careersnow@123 --port=3306 -e "SELECT distinct $i FROM scrapperdb.matching_txts" > $i.txt
sleep .01
echo $passwdFile| sudo -S ex -sc '1d2|x' $i.txt
sleep .01
done
touch log
echo `date +%Y-%m-%d.%H:%M`:: The txt files were updated | cat - /TxtModule/log > temp && mv temp /TxtModule/log
echo $passwdFile| sudo -S chmod 755 -R /TxtModule
echo $passwdFile| sudo -S rm /TxtModule/*.*~
