#!/bin/sh


# because the hostname only resolves locally
export SPARK_LOCAL_HOSTNAME=$(hostname -i)

/spark/sbin/start-slave.sh spark://spark-master:7077

sleep 1
echo .
sleep 1
echo .
sleep 1
echo .
sleep 1
echo .

# TODO: detect slave exit
tail -F /spark/logs/*
