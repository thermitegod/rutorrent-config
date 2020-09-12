#!/bin/sh
#1.1.0
#2020-07-15

emerge -1 rutorrent

cp /var/www/localhost/htdocs/rutorrent/conf/config.php /tmp

rm -rf /var/www/localhost/htdocs/rutorrent

webapp-config --server lighttpd -d rutorrent -I rutorrent 9999

chown -R brandon:brandon /var/www/localhost/htdocs/rutorrent

echo "diff -Naur /tmp/config.php /var/www/localhost/htdocs/rutorrent/conf/config.php"
