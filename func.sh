#!/bin/sh
#create table animals (animal varchar(100));

animal=$(echo $(cat local/payload.txt) | tr '[:lower:]' '[:upper:]')

sleep 10

mysql -h 192.168.100.101 -u root -prooooot -D handson -e "insert into animals values (\""${animal}"\")"
