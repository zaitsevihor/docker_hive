#!/usr/bin/bash
#sudo docker network create --subnet=172.18.0.0/16 docker_subnet
n=1
sudo docker build --build-arg pass=$(pwgen 10 | awk '{print $1}') -t docker_hive -f Dockerfile .
while [ $n -ne 21 ]
do
	sudo docker run --rm --name docker_hive_${n} --net docker_subnet --ip 172.18.1.${n} docker_hive
	#sudo docker run -it --rm --name docker_hive_${n} --net docker_subnet --ip 172.18.1.${n} docker_hive ash
	#sudo docker rmi docker_hive
	n=$((${n}+1))
done
sudo docker rmi docker_hive
