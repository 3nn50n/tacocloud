FROM maven:3.8.5-openjdk-17 AS bulid
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-slim
COPY --from=bulid /tacocloud-0.0.1-SNAPSHOT.jar taco.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "taco.jar"]