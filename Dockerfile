FROM ubuntu:14.04


RUN apt-get update -qq && apt-get install -qqy curl apt-transport-https software-properties-common python-software-properties
RUN curl https://get.docker.com/gpg | apt-key add -
RUN echo deb http://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list
RUN apt-get update -qq && apt-get install -qqy iptables ca-certificates lxc git-core zip graphviz python
RUN curl -sSL https://get.docker.com/ | sh

RUN echo oracle-java9-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

RUN add-apt-repository -y ppa:webupd8team/java && \
    apt-get update; \
    apt-get install -y oracle-java9-installer; \
    apt-get install -y oracle-java9-set-default; \
    rm -rf /var/cache/oracle-jdk9-installer

RUN curl -L https://github.com/docker/compose/releases/download/1.4.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
	chmod +x /usr/local/bin/docker-compose
	
ADD http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar swarm-client.jar
ENTRYPOINT [ "java",  "-jar",  "swarm-client.jar" ]
 
