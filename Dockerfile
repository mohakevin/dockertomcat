FROM debian
LABEL MAINTAINER adrian@adrianperez.net

ENV JAVA_HOME /opt/java


RUN apt-get update -qq && \
	apt-get install -y -qq wget

RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz  -q -O- | tar -xz -C /opt
RUN wget http://ftp.cixug.es/apache/tomcat/tomcat-8/v8.5.27/bin/apache-tomcat-8.5.27.tar.gz -q -O- | tar -xz -C /opt
RUN ln -s /opt/apache-tomcat* /opt/tomcat && ln -s /opt/jdk* /opt/java && rm -rf /opt/tomcat/webapps/{docs,examples}
RUN PATH=$PATH:$JAVA_HOME

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
