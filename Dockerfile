FROM maven:latest

# Copy the pom.xml file to the working directory
COPY pom.xml .

# Download the Maven dependencies
RUN mvn dependency:go-offline

# Copy the source code to the working directory
COPY src/ /app/src/

# Build the Java server using Maven
RUN mvn package

# Expose port 8080 for the server
EXPOSE 8080

# Start the Java server
CMD ["java", "-jar", "/app/target/server.jar"]
