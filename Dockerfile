FROM maven:3.6.3-openjdk-11 as build
LABEL authors="Filipe Duarte"
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests=true 

FROM maven:3.6.3-openjdk-11
WORKDIR /app
COPY --from=build /app/target/*.jar DesafioDevops-0.0.1-SNAPSHOT.jar
CMD ["java", "-jar", "DesafioDevops-0.0.1-SNAPSHOT.jar"]

