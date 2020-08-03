#!/bin/sh

MYSQL_HOST=192.168.100.101

nomad job stop -purge r2-periodic-curl
nomad job stop -purge r2-periodic-backup
nomad job stop -purge r2-parameterized-toUpper
nomad job stop -purge r2-ui-java
nomad job stop -purge r2-api-go
curl -X PUT http://localhost:4646/v1/system/gc

mysql -h ${MYSQL_HOST} -u root -prooooot -D handson -e "drop table if exists animals"
mysql -h ${MYSQL_HOST} -u root -prooooot -D handson -e "create table animals (animal varchar(100));"

aws s3 rm s3://mysql-dump-tkaburagi --recursive
