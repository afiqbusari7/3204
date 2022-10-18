FROM tomcat:8.0.36-jre8

#Update package lists
RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv 648ACFD622F3D138
RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv 0E98404D386FA1D9
RUN gpg --export --armor 648ACFD622F3D138 | apt-key add -
RUN gpg --export --armor 0E98404D386FA1D9 | apt-key add -

RUN echo "deb http://httpredir.debian.org/debian stretch main \n deb http://httpredir.debian.org/debian stretch-updates main \n deb http://security.debian.org stretch/updates main" > /etc/apt/sources.list

RUN apt-get update;true || :
RUN apt-get install -y \
    libpcap0.8 || :


#Packetbeat installation
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-8.4.3-amd64.deb
RUN dpkg -i packetbeat-8.4.3-amd64.deb

#Filebeat installation
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.4.3-amd64.deb
RUN dpkg -i filebeat-8.4.3-amd64.deb

#Auditbeat installation
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-8.4.3-amd64.deb
RUN dpkg -i auditbeat-8.4.3-amd64.deb



RUN rm -rf /usr/local/tomcat/webapps/*

ADD target/root.war /usr/local/tomcat/webapps/ROOT.war

#ADD catalina.sh /usr/local/tomcat/

ADD filebeat.yml /etc/filebeat/filebeat.yml
ADD server.xml /usr/local/tomcat/conf/server.xml

EXPOSE 8080 


#CMD ["cp", "/usr/local/tomcat/catalina.sh", "/usr/local/tomcat/bin/catalina.sh"]

CMD ["catalina.sh", "run"]


