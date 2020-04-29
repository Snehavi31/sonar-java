FROM openjdk:8u151-jdk-alpine
USER root
RUN apk add --no-cache curl maven && apk add maven && apk add --no-cache curl git 
WORKDIR /opt
RUN git clone https://github.com/spring-projects/spring-petclinic.git
WORKDIR /opt/spring-petclinic
RUN mvn clean package sonar:sonar -Dsonar.projectKey=demo -Dsonar.host.url=http://ec2-3-15-4-244.us-east-2.compute.amazonaws.com:9000 -Dsonar.login=b45128756a0b50b7de5176daf5e1e879e23cedf5
