FROM anapsix/alpine-java:8

RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/edge/main libseccomp && \
    apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/edge/community docker

ADD http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar swarm-client.jar
ENTRYPOINT [ "java",  "-jar",  "swarm-client.jar" ]
