#!/bin/sh

nomad job stop r2-periodic-curl
nomad job stop r2-periodic-backup
nomad job stop r2-parameterized-toUpper

sleep 5

aws s3 rb s3://mysql-dump-tkaburagi --force

mysql -u root -prooooot -D handson -e "drop table if exists animals"
mysql -u root -prooooot -D handson -e "create table animals (animal varchar(100));"

sleep 5

nomad job stop r2-api-go
nomad job stop r2-ui-java
nomad job stop r2-mysql-v5-7-28