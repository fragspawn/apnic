#!/bin/bash
/usr/bin/curl ftp://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest > /tmp/import.txt
/usr/bin/mysql -u root -p"$1" < sqlcreate.sql
/usr/bin/mysql -u root -p"$1" apnic < sqlimport.sql
