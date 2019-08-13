FROM openjdk:8
WORKDIR /build
RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastStableBuild/artifact/target/BuildTools.jar && \
    java -jar BuildTools.jar --rev 1.14.4
