FROM debian
MAINTAINER adrian@adrianperez.net

ENV JAVA_HOME /opt/java


RUN apt-get update -qq && \
	apt-get install -y -qq wget

RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jre-8u144-linux-x64.tar.gz -q -O- | tar -xz -C /opt
RUN wget http://ftp.cixug.es/apache/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz -q -O- | tar -xz -C /opt
RUN ln -s /opt/apache-tomcat* /opt/tomcat && ln -s /opt/jre* /opt/java
RUN PATH=$PATH:$JAVA_HOME

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
