# Dockerfile to illustrate how Filebeat can be used with nginx
# Filebeat 8.3.3

# Build with:
# docker build -t filebeat-nginx-example .

# Run with:
# docker run -p 80:80 -it --link <elk-container-name>:elk \
#     --name filebeat-nginx-example filebeat-nginx-example

FROM tomcat:8.0.36-jre8

###############################################################################
#                                INSTALLATION
###############################################################################

### install Filebeat

ENV FILEBEAT_VERSION 8.3.3
ENV FILEBEAT_BASE_VERSION 8.3.3

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 605C66F00D6C9793
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138

RUN echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list
RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
RUN sed -i '/deb http:\/\/\(deb\|httpredir\).debian.org\/debian jessie.* main/d' /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update -qq

RUN apt-get install -qqy curl rsyslog nano scanlogd iptables\
 && apt-get clean

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${FILEBEAT_VERSION}-amd64.deb \
 && dpkg -i filebeat-${FILEBEAT_VERSION}-amd64.deb \
 && rm filebeat-${FILEBEAT_VERSION}-amd64.deb


###############################################################################
#                                CONFIGURATION
###############################################################################
#RUN iptables -A INPUT  -j LOG --log-prefix ' SUSPECT '

# Disable imklog module
RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf

### Move war file

RUN rm -rf /usr/local/tomcat/webapps/*
ADD target/root.war /usr/local/tomcat/webapps/ROOT.war

### configure Filebeat

# config file
ADD filebeat.yml /etc/filebeat/filebeat.yml
RUN chmod 644 /etc/filebeat/filebeat.yml

# PMACCT
#ADD pmacctd.conf /etc/filebeat/pmacctd.conf
#RUN chmod 644 /etc/filebeat/pmacctd.conf

# CA cert
RUN mkdir -p /etc/pki/tls/certs
ADD logstash-beats.crt /etc/pki/tls/certs/logstash-beats.crt

# create template based on filebeat version (assumption: it is the same version as elasticsearch version)
RUN filebeat export template --es.version ${FILEBEAT_BASE_VERSION} > /etc/filebeat/filebeat.template.json

###############################################################################
#                                    START
###############################################################################
EXPOSE 8080 

#RUN iptables -A INPUT  -j LOG --log-prefix ' SUSPECT '

ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
CMD [ "/usr/local/bin/start.sh" ]
