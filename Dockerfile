FROM gradle:6.8-jdk11 as compile
COPY . /home/source/java
WORKDIR /home/source/java
# Default gradle user is `gradle`. We need to add permission on working directory for gradle to build.
USER root
RUN chown -R gradle /home/source/java
USER gradle
RUN gradle clean build

FROM adoptopenjdk/openjdk11-openj9:ubuntu-jre
WORKDIR /home/application/java
COPY --from=compile "/home/source/java/build/libs/restApi-0.0.1-SNAPSHOT.jar" .
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "/home/application/java/restApi-0.0.1-SNAPSHOT.jar"]