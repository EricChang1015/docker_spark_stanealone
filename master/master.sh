#!/bin/sh

echo "master" > /etc/hostname
/spark/sbin/start-master.sh

sleep 3
# TODO: detect master exit
tail -F /spark/logs/*
