#get docker mysql password
docker run --name=apnic-test --env="MYSQL_ROOT_PASSWORD=$1" php
docker cp ../*|- apnic-test:/var/www/html  
docker exec -d apnic-test sh /var/www/html/deploy/sql/sqlfetch.sh $1
docker exec -d apnic-test echo "<?php $pass = '$1' ?>" >  /var/www/html/ws/pass.php 
