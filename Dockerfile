FROM openjdk:17
COPY build/libs/loginapi2.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]