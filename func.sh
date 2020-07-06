#!/bin/sh
#create table animals (animal varchar(100));

animal=$(echo $(cat local/payload.txt) | tr '[:lower:]' '[:upper:]')

mysql -u root -prooooot -D handson -e "insert into animals values (\""${animal}"\")"