#!/bin/bash

# Iniciando cluster redis
echo "Iniciando cluster redis"
docker-compose up --build -d

echo "Inserindo senha master"
# Inserindo senha master
docker exec redis01 redis-cli CONFIG SET masterauth mudar@123
docker exec redis02 redis-cli CONFIG SET masterauth mudar@123
docker exec redis03 redis-cli CONFIG SET masterauth mudar@123
echo "inserindo senha padrão"
#inserindo senha padrão
docker exec redis01 redis-cli -a mudar@123 CONFIG SET requirepass mudar@123
docker exec redis02 redis-cli -a mudar@123 CONFIG SET requirepass mudar@123
docker exec redis03 redis-cli -a mudar@123 CONFIG SET requirepass mudar@123
echo "habilitando escrita no slave"
#habilitando escrita no slave
docker exec redis01 redis-cli -a mudar@123 SLAVEOF no one
docker exec redis02 redis-cli -a mudar@123 SLAVEOF no one
docker exec redis03 redis-cli -a mudar@123 SLAVEOF no one

