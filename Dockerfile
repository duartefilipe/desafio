FROM maven:3.6.3-openjdk-11 as build
COPY src /home/anakin/Documentos/desafio/src
COPY pom.xml /home/anakin/Documentos/desafio
RUN mvn -f /home/anakin/Documentos/desafio/pom.xml clean package -Dmavven.test.skip=true

FROM openjdk:11
COPY --from=build /home/anakin/Documentos/desafio/target/DesafioDevops-0.0.1-SNAPSHOT.jar /usr/local/lib/DesafioDevops-0.0.1-SNAPSHOT.jar
COPY target/DesafioDevops-0.0.1-SNAPSHOT.jar /user/local/lib/DesafioDevops-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "/user/local/lib/desafio.jar" ]
