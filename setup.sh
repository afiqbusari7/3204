#!/bin/sh

# Setup docker containers
sudo docker-compose build
sudo docker-compose up -d

sleep 5m

# Start log monitoring
sudo docker exec 3204_sshworkstation_1 /bin/bash -c "chmod go-w /etc/filebeat/filebeat.yml"
sudo docker exec 3204_sshworkstation_1 /bin/bash -c "filebeat setup"
sudo docker exec 3204_sshworkstation_1 /bin/bash -c "service filebeat start"
sudo docker exec 3204_sshworkstation_1 /bin/bash -c "chmod go-w /etc/packetbeat/packetbeat.yml"
sudo docker exec 3204_sshworkstation_1 /bin/bash -c "packetbeat setup"
sudo docker exec 3204_sshworkstation_1 /bin/bash -c "service packetbeat start"
sudo docker exec 3204_sshworkstation_1 /bin/bash -c "chmod go-w /etc/metricbeat/metricbeat.yml"
sudo docker exec 3204_sshworkstation_1 /bin/bash -c "metricbeat setup"
sudo docker exec 3204_sshworkstation_1 /bin/bash -c "service metricbeat start"
sudo docker exec 3204_sshworkstation_1 /bin/bash -c "service filebeat status"
sudo docker exec 3204_sshworkstation_1 /bin/bash -c "service packetbeat status"
sudo docker exec 3204_sshworkstation_1 /bin/bash -c "service metricbeat status"

sudo docker exec 3204_ftpserver_1 /bin/bash -c "chmod go-w /etc/filebeat/filebeat.yml"
sudo docker exec 3204_ftpserver_1 /bin/bash -c "filebeat setup"
sudo docker exec 3204_ftpserver_1 /bin/bash -c "service filebeat start"
sudo docker exec 3204_ftpserver_1 /bin/bash -c "chmod go-w /etc/packetbeat/packetbeat.yml"
sudo docker exec 3204_ftpserver_1 /bin/bash -c "packetbeat setup"
sudo docker exec 3204_ftpserver_1 /bin/bash -c "service packetbeat start"
sudo docker exec 3204_ftpserver_1 /bin/bash -c "chmod go-w /etc/metricbeat/metricbeat.yml"
sudo docker exec 3204_ftpserver_1 /bin/bash -c "metricbeat setup"
sudo docker exec 3204_ftpserver_1 /bin/bash -c "service metricbeat start"
sudo docker exec 3204_ftpserver_1 /bin/bash -c "service filebeat status"
sudo docker exec 3204_ftpserver_1 /bin/bash -c "service packetbeat status"
sudo docker exec 3204_ftpserver_1 /bin/bash -c "service metricbeat status"

sudo docker exec 3204_webapp_1 /bin/bash -c "chmod go-w /etc/filebeat/filebeat.yml"
sudo docker exec 3204_webapp_1 /bin/bash -c "filebeat setup"
sudo docker exec 3204_webapp_1 /bin/bash -c "service filebeat start"
sudo docker exec 3204_webapp_1 /bin/bash -c "chmod go-w /etc/packetbeat/packetbeat.yml"
sudo docker exec 3204_webapp_1 /bin/bash -c "packetbeat setup"
sudo docker exec 3204_webapp_1 /bin/bash -c "service packetbeat start"
sudo docker exec 3204_webapp_1 /bin/bash -c "chmod go-w /etc/metricbeat/metricbeat.yml"
sudo docker exec 3204_webapp_1 /bin/bash -c "metricbeat setup"
sudo docker exec 3204_webapp_1 /bin/bash -c "service metricbeat start"
sudo docker exec 3204_webapp_1 /bin/bash -c "service filebeat status"
sudo docker exec 3204_webapp_1 /bin/bash -c "service packetbeat status"
sudo docker exec 3204_webapp_1 /bin/bash -c "service metricbeat status"

sudo docker exec 3204_attacker_1 /bin/bash -c "chmod go-w /etc/filebeat/filebeat.yml"
sudo docker exec 3204_attacker_1 /bin/bash -c "filebeat setup"
sudo docker exec 3204_attacker_1 /bin/bash -c "service filebeat start"
sudo docker exec 3204_attacker_1 /bin/bash -c "chmod go-w /etc/packetbeat/packetbeat.yml"
sudo docker exec 3204_attacker_1 /bin/bash -c "packetbeat setup"
sudo docker exec 3204_attacker_1 /bin/bash -c "service packetbeat start"
sudo docker exec 3204_attacker_1 /bin/bash -c "chmod go-w /etc/metricbeat/metricbeat.yml"
sudo docker exec 3204_attacker_1 /bin/bash -c "metricbeat setup"
sudo docker exec 3204_attacker_1 /bin/bash -c "service metricbeat start"
sudo docker exec 3204_attacker_1 /bin/bash -c "service filebeat status"
sudo docker exec 3204_attacker_1 /bin/bash -c "service packetbeat status"
sudo docker exec 3204_attacker_1 /bin/bash -c "service metricbeat status"
