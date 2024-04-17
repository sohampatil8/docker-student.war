FROM centos:7

USER root

RUN yum update -y

RUN yum install java -y

WORKDIR /opt

ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.99/bin/apache-tomcat-8.5.99.tar.gz /opt/

RUN tar -xzf apache-tomcat-8.5.99.tar.gz

WORKDIR /opt/apache-tomcat-8.5.99

COPY student.war webapps/student.war

COPY context.xml conf/context.xml

ADD https://s3.ap-south-1.amazonaws.com/host-student.war/mysql-connector.jar lib/mysql-connector.jar

EXPOSE 8080

CMD ["./bin/catalina.sh" , "run"]
