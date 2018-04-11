FROM tutum/lamp:latest

RUN apt-get update
RUN apt-get install -y curl

WORKDIR /app

RUN rm -rf /app 
RUN git clone https://github.com/fragspawn/apnic.git /app
EXPOSE 80 3306

RUN /usr/bin/mysql_install_db --datadir=/var/lib/mysql
#RUN cat /root/.mysql_secret

RUN sh /app/deploy/sql/sqlfetch.sh {MYSQL_ROOT_PASSWORD}
RUN echo "<?php \$pass = '{MYSQL_ROOT_PASSWORD}' ?>" >  /app/ws/pass.php 