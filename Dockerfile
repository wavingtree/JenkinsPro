EXPOSE 8080

COPY ./target/java-maven-app-1.0-SNAPSHOT.jar /usr/app/
COPY ./target/java-maven-app-*.jar /usr/app/
WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "java-maven-app-1.0-SNAPSHOT.jar"]
CMD java -jar java-maven-app-*.jar
