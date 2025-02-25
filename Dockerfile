# Use the official Maven image to build the app
FROM maven:3.6.3-jdk-11 as build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code into the container
COPY src ./src

# Package the application into a JAR file
RUN mvn clean package -DskipTests

# Use the official OpenJDK image to run the app
FROM openjdk:11-jre-slim

# Set the working directory in the final image
WORKDIR /app

# Copy the packaged JAR file from the build stage
COPY --from=build /app/target/registration-0.0.1-snapshot.jar app.jar

# Expose the port the app will run on
EXPOSE 8082

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
