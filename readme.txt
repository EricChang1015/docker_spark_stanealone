docker build -t ravenzz/spark-hadoop .


# Start Master
docker run -it  -p 50006:4040  50001:6066 -p 50002:7077 -p 50003:8080 -expose=7077 spark_spark-master bash


# Web to monitor, 192.168.56.105 is vm ip
http://192.168.56.105:50003/


# Start work1, 172.17.0.2 is master local ip
docker run -it -p 50004:8081 --link=a963c148d051 -e "SPARK_MASTER=spark://172.17.0.2:7077" spark_spark-worker1 bash


# Start work2
docker run -it -p 50005:8081 --link=a963c148d051 -e "SPARK_MASTER=spark://172.17.0.2:7077" spark_spark-worker2 bash
