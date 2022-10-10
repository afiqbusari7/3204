# 3204


# run file
#sudo docker-compose build<br/>
#sudo docker-coompose up -d 


# check IP
#sudo docker-compose ps 
	sudo docker-compose <id container> | grep IPAddress
  
# stop docker 
	sudo docker-compose kill && docker-compose rm -f 

# Network connectivity
	docker network connect bridge web-server
	docker network connect bridge ldap-server
	docker network connect bridge 3204-logstash-1
	docker network connect bridge 3204-kibana-1
	docker network connect bridge 3204-elasticsearch-1

	docker network disconnect attacker_log4j web-server
	docker network disconnect attacker_log4j ldap-server
	docker network disconnect 3204_elk 3204-logstash-1
	docker network disconnect 3204_elk 3204-kibana-1
	docker network disconnect 3204_elk 3204-elasticsearch-1

	docker network rm attacker_log4j<br/>
	docker network rm 3204_elk
