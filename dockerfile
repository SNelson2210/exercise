FROM alpine/git as clone (1)
WORKDIR /app
RUN git clone https://github.com/wowcher/wowcher_exercise.git

FROM maven:3.5-jdk-8-alpine as build (2)
WORKDIR /app
COPY --from=clone /app/wowcher_exercise /app (3)
RUN mvn install

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/target/test.jar /app
EXPOSE 8080
CMD ["java -jar test.jar"]

HEALTHCHECK CMD /healthcheck
