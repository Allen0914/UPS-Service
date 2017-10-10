FROM docker.tradeshift.net/jetty-9.4.0-jre8u92:3ef648dcbbf69ccc98d71092b3273dff85924fd6
MAINTAINER skw@cn.tradeshift.com

#Configure java opts. This can be overridden when running the container with the '--env' parameter
ENV JAVA_OPTIONS -Xmx2g

#Add maven war
ADD webapp.xml /opt/jetty/webapps/webapp.xml
ADD *.war /opt/jetty/webapps/webapp.war

CMD /opt/jetty/bin/run-jetty.sh
