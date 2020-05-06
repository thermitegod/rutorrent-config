#!/bin/sh
#1.0.0
#2019-12-29

emerge -1 rutorrent

rm -rf /var/www/localhost/htdocs/rutorrent

webapp-config --server lighttpd -d rutorrent -I rutorrent 9999

chown -R brandon:brandon /var/www/localhost/htdocs/rutorrent
