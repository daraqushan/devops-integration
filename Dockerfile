FROM openjdk:21
EXPOSE 8080
ADD target/devops-integraton.jar devops-integration.jar
ENTRYPOINT [ "java","-jar","devops-integration.jar" ]