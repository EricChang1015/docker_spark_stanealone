sudo http-server -p 54321 /root/Downloads &
docker images | grep "ravenzz\/spark-hadoop" >/dev/null || docker build -t ravenzz/spark-hadoop .
docker-compose up
