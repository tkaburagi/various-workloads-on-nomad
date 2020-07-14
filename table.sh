#!/bin/sh

mysql -u root -prooooot -D handson -e "drop table if exists animals"
mysql -u root -prooooot -D handson -e "create table animals (animal varchar(100));"