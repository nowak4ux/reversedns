#!/bin/bash

if [[ $1 == "" ]]
then
	echo -e "\nreversedns.sh [IP] [NETBLOCK] [ENDNETBLOCK] [URL]\n"
	echo -e "Ex:\n\n[IP] = 37.59.174\n[NETBLOCK] = 232\n[ENDNETBLOCK] = 255\n[URL] = globo.com - for clean output\n"
	exit
fi

echo -e ""

if [[ $2 !=  "" || $3 != "" ]]
then
	for block in $(seq $2 $3);do ahost $1.$block|grep "$4" >> reversedns.log;clear;done
else
	for block in {0..255};do ahost $1.$block|grep "$4" >> reversedns.log;clear;done
fi

echo -e "# RESULT #\n"
cat reversedns.log && rm -rf reversedns.log
echo -e ""
