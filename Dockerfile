FROM tomcat:9.0-jdk17
RUN cp -r /usr/local/tomcat/webapps.dist/manager /usr/local/tomcat/webapps/manager
RUN cp -r /usr/local/tomcat/webapps.dist/host-manager /usr/local/tomcat/webapps/host-manager

RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY target/sample-webapp.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
