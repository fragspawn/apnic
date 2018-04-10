#!/bin/bash
#take a $1 for db pass
curl ftp://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest > /tmp/import.txt
mysql -u root -p"$1" < sqlcreate.sql
mysql -u root -p"$1" apnic < sqlimport.sql
