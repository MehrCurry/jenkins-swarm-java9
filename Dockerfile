FROM marvambass/oracle-java9

ADD http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar swarm-client.jar
CMD java -jar swarm-client.jar -labels swarm,java9 -mode exclusive
