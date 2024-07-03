FROM gradle:7.5.1-jdk17 AS build

COPY --chown=gradle:gradle . /home/gradle/project

WORKDIR /home/gradle/project

RUN gradle build --no-daemon -x test

FROM openjdk:17-jdk

COPY --from=build /home/gradle/project/build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]

