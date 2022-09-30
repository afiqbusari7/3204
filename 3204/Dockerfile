FROM tomcat:9.0.60-jre11-openjdk-slim-buster

ARG USER=victim
ARG USER2=victim2
ARG UID=1000
ARG GID=1000
ARG UID2=1001
ARG GID2=1001


# default password for user
ARG PW=docker
ARG PW2=docker2


# Option1: Using unencrypted password/ specifying password
RUN useradd -m ${USER} --uid=${UID}  --shell /bin/bash && echo "${USER}:${PW}" | \
     chpasswd

RUN useradd -m ${USER2} --uid=${UID2}  && echo "${USER2}:${PW2}" | \
      chpasswd


#change root password
RUN echo 'root:root' | chpasswd


ADD spring-form.war /usr/local/tomcat/webapps/

ADD flag.txt /usr/local/tomcat/webapps/

ADD victim2.txt ~/victim2/Desktop/





EXPOSE 8888

CMD ["catalina.sh", "run"]
