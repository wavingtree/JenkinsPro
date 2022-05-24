FROM openjdk:8-jre-alpine

EXPOSE 8080

COPY ./target/my-app-1.0-SNAPSHOT.jar /usr/app/
COPY ./target/my-app-*.jar /usr/app/
WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
CMD java -jar my-app-*.jar

