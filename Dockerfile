FROM tomcat:9.0
MAINTAINER mohammedmainetrabzi
RUN apt-get update
ADD ./target/java-jsp-diary.war /usr/local/tomcat/webapps/ 
EXPOSE 8080
CMD ["catalina.sh","run"]
