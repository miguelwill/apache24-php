#!/bin/bash

PHPINI=/usr/local/lib/php.ini

echo "date.timezone = \"${TZ:-"UTC"}\"" >> $PHPINI
echo "memory_limit = ${PHP_MEMORY_LIMIT:-"256M"}" >> $PHPINI
echo "upload_max_filesize = ${PHP_UPLOAD_MAX_FILESIZE:-"50M"}" >> $PHPINI
echo "post_max_size = ${PHP_POST_MAX_SIZE:-"80M"}"  >> $PHPINI
echo "log_errors = ${PHP_LOG_ERRORS:-"On"}"  >> $PHPINI
echo "display_errors = ${PHP_DISPLAY_ERRORS:-"Off"}"  >> $PHPINI

postconf -e relayhost=${RELAY_HOST:-""}

/etc/init.d/postfix start

exec apache2 -DFOREGROUND
