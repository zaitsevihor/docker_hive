#!/usr/bin/bash
#sudo docker network create --subnet=172.18.0.0/16 docker_subnet
n=1
#while [ $n -ne 21 ]
#do
	sudo docker build -t docker_hive -f Dockerfile .
	#sudo docker run --rm -it docker_hive /bin/ash
	#sudo docker run -t -d --rm --name docker_hive_${n} docker_hive
	sudo docker run -it --rm --name docker_hive_${n} --net docker_subnet --ip 172.18.1.${n} docker_hive /bin/bash
	#sudo docker rmi docker_hive
	#n=$((${n}+1))
#done
