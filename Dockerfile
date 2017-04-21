FROM centos:7
MAINTAINER RavenZZ <raven.zhu@outlook.com>

# 安装系统工具
RUN yum update -y && \
yum upgrade -y && \
yum install -y byobu curl htop man unzip nano wget rsync && \
yum clean all

# 安装 Java
ENV JDK_VERSION 8u11
ENV JDK_BUILD_VERSION b12
# 如果网速快,可以直接从源站下载
RUN curl -LO "http://download.oracle.com/otn-pub/java/jdk/$JDK_VERSION-$JDK_BUILD_VERSION/jdk-$JDK_VERSION-linux-x64.rpm" -H 'Cookie: oraclelicense=accept-securebackup-cookie' && rpm -i jdk-$JDK_VERSION-linux-x64.rpm; rm -f jdk-$JDK_VERSION-linux-x64.rpm;
#RUN curl -LO "http://192.168.56.105:54321/jdk-8u11-linux-x64.rpm" && rpm -i jdk-$JDK_VERSION-linux-x64.rpm; rm -f jdk-$JDK_VERSION-linux-x64.rpm;
ENV JAVA_HOME /usr/java/default

#RUN yum remove curl;  yum clean all
WORKDIR spark

RUN \
 curl -LO 'http://192.168.56.105:54321/spark-2.1.0-bin-hadoop2.7.tgz' && \
 tar zxf spark-2.1.0-bin-hadoop2.7.tgz -C ./ --strip-components=1

RUN rm -rf spark-2.1.0-bin-hadoop2.7.tgz

# 安裝 sbt for build scala application (only master needed)
RUN curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo && \
yum install sbt


ENV SPARK_HOME /spark
ENV PATH /spark/bin:$PATH
ENV PATH /spark/sbin:$PATH
ENV PATH $JAVA_HOME/bin:$PATH
