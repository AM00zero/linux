#!/bin/bash

age=$(awk -F '\t' '{print $6}' worldcupplayerinfo.tsv)
total=0
age20=0
age2030=0
age30=0
oldest=0
oldesrname=''
young=50
youngname=''
for n in $age
do
	if [ "$n" != 'Age' ] ;
	then
		let total+=1
		if [ "$n" -lt 20 ] ;
		then
			let age20+=1		
		fi
		if [ "$n" -ge 20 ]&&[ "$n" -le 30 ] ;
		then
			let age2030+=1
		fi
		if [ "$n" -gt 30 ] ;
		then
			let age30+=1		
		fi
		if [ "$n" -gt "$oldest" ] ;
		then 
			oldest=$n
			oldestname=$(awk -F '\t' 'NR=='$[$total +1]' {print $9}' worldcupplayerinfo.tsv)
		fi
		if [[ $n -lt $young ]]
		then 
			young=$n
			youngname=$(awk -F '\t' 'NR=='$[$total +1]' {print $9}' worldcupplayerinfo.tsv)
		fi
	fi
done
propo20=$(awk 'BEGIN{printf "%.2f",'$age20*100/$total'}')
propo23=$(awk 'BEGIN{printf "%.2f",'$age2030*100/$total'}')
propo30=$(awk 'BEGIN{printf "%.2f",'$age30*100/$total'}')
echo '20�����µ������ͱ����ֱ�Ϊ��'$age20' '$propo20'%'
echo '20��30��������ͱ����ֱ�Ϊ��'$age2030' '$propo23'%'
echo '30�����µ������ͱ����ֱ�Ϊ��'$age30' '$propo30'%'
echo ''
echo $oldestname'�����곤����Ա,����'$oldest'��'
echo $youngname'�����������Ա,����'$young'��'
echo ''

position=$(awk -F '\t' '{print $5}' worldcupplayerinfo.tsv)
declare -A dic
for p in $position
do
	if [ "$p" != 'Position' ] ;
	then 
		if [[ !${dic[$p]} ]]
		then	
			let dic[$p]+=1
		else
			dic[$p]=0
		fi
	fi	
done
for k in ${!dic[@]}
do
	echo "$k : ${dic[$k]}"" ��ռ����Ϊ��"$(awk 'BEGIN{printf "%.2f",'${dic[$k]}*100/$total'}')'%'
done

namelen=$( awk -F '\t' '{print length($9)}' worldcupplayerinfo.tsv)
minlen=40
maxlen=0
minname=''
maxname=''
COUNT=0
for na in $namelen
do 	
	COUNT=$[$COUNT + 1]	
	if [[  $na -gt $maxlen ]]
	then
		maxlen=$na
		maxname=$(sed -n $COUNT'p' 'worldcupplayerinfo.tsv'|awk -F '\t' '{print $9}')
	fi
	if [[  $na -lt $minlen ]]
	then
		minlen=$na
		minname=$(sed -n $COUNT'p' 'worldcupplayerinfo.tsv'|awk -F '\t' '{print $9}')
	fi			

done
echo ''
echo '���������Ա�ǣ�'$maxname'����'$maxlen'���ַ�'
echo '������̵���Ա�ǣ�'$minname'����'$minlen'���ַ�'