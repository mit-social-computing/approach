#! bin/sh
echo 'Setting full permissions on EE Cache'
echo
chmod 777 webroot/system/expressionengine/cache
echo 'Setting full permissions images folder and all sub folders'
echo
chmod -R 777 webroot/images


