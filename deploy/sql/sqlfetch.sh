#!/bin/bash
/usr/bin/curl ftp://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest > /tmp/import.txt
/usr/bin/mysql -u root  < /app/deploy/sql/sqlcreate.sql
/usr/bin/mysql -u root apnic < /app/deploy/sql/sqlimport.sql
