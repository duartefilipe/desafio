#FROM maven:3.6.3-openjdk-11 as build
#LABEL authors="Filipe Duarte"
#WORKDIR /home/anakin/Documentos/desafio
#COPY src /home/anakin/Documentos/desafio/src
#COPY pom.xml /home/anakin/Documentos/desafio
#RUN mvn -f /home/anakin/Documentos/desafio/pom.xml clean package -Dmavven.test.skip=true

FROM maven:3.6.3-openjdk-11 as build
LABEL authors="Filipe Duarte"
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests=true 

#FROM openjdk:11
#WORKDIR /home/anakin/Documentos/desafio
#COPY --from=build /home/anakin/Documentos/desafio/target/*.jar /usr/local/lib/DesafioDevops-0.0.1-SNAPSHOT.jar
#COPY target/DesafioDevops-0.0.1-SNAPSHOT.jar /user/local/lib/DesafioDevops-0.0.1-SNAPSHOT.jar
#EXPOSE 8080
#ENTRYPOINT [ "java", "-jar", "/user/local/lib/DesafioDevops-0.0.1-SNAPSHOT.jar" ]

FROM maven:3.6.3-openjdk-11
WORKDIR /app
COPY --from=build /app/target/*.jar DesafioDevops-0.0.1-SNAPSHOT.jar
CMD ["java", "-jar", "DesafioDevops-0.0.1-SNAPSHOT.jar"]
