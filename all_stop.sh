#!/usr/bin/bash
n=1
while [ $n -ne 21 ]
do
	sudo docker kill -s=9 docker_hive_${n}
        n=$((${n}+1))
done 
