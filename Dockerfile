From ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_SERVER_NAME localhost

Run apt-get update
Run apt-get install -yq --no-install-recommends apache2 php7.2 php-mysql

ENV DB_HOST='dockermysql2'
ENV DB_USER='dockertest'
ENV DB_PASS='dockertest'
ENV DB_NAME='dockertest'

copy pdo-master /var/www/html/

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
