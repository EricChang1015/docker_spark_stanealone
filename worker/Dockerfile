FROM ravenzz/spark-hadoop

MAINTAINER RavenZZ <raven.zhu@outlook.com> 
ADD worker.sh /spark/.

ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG /spark/logs
ENV SPARK_MASTER "spark://spark-master:32769"

EXPOSE 8081

#CMD ["/bin/bash","/spark/sbin/start-slave.sh"]
CMD ["/bin/bash","/spark/worker.sh"]
