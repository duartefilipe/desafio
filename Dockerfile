FROM maven:3.6.3-openjdk-21 as build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvnn -f /home/app/pom.xml clean package -Dmavven.test.skip=true

FROM openjdk:21
COPY --from=build /home/app/target/app.war /user/local/lib/app.war
COPY target/app.war /user/local/lib/app.war
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "/user/local/lib/app.war" ]
