FROM openjdk
COPY target/devops_calculator-1.0-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app
CMD ["java" , "-jar" , "devops_calculator-1.0-SNAPSHOT.jar"]

