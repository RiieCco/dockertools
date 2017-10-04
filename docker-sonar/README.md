# docker-sonarqube

Docker image based on default [SonarQube 5.6](https://hub.docker.com/_/sonarqube/) with manual installed plugins. 
The default provided plugins are removed and replaced by manual downloaded.

To add/remove plugins modify the Dockerfile and build your own version.

### Building the image
`docker build -t docker-sonarqube .`

### Running the image
`docker run -p 9000:9000 docker-sonarqube`

### Using Docker Compose
There is an assumption you have installed docker-compose!

`docker-compose up`

## Installed plugins
* sonar-findbugs-plugin-3.4.3.jar
* sonar-generic-coverage-plugin-1.2.jar
* sonar-groovy-plugin-1.3.1.jar
* sonar-java-plugin-4.0.jar
* sonar-javascript-plugin-2.8.jar
* sonar-pmd-plugin-2.6.jar
* sonar-scm-git-plugin-1.2.jar
* sonar-sonargraph-plugin-3.5.jar
* sonar-timeline-plugin-1.5.jar
* sonar-web-plugin-2.4.jar
* sonar-widget-lab-plugin-1.8.1.jar
* sonar-xml-plugin-1.4.1.jar
