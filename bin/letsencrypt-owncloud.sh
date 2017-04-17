set -x
ssh gateway -t 'sudo service nginx stop'
ssh gateway -t 'letsencrypt certonly -d owncloud.keyvan.pw'
ssh gateway -t 'sudo service nginx start'
rsync -L -av gateway:/etc/letsencrypt/live/owncloud.keyvan.pw/ ~/owncloud.keyvan.pw
rsync -av ~/owncloud.keyvan.pw owncloud:/etc/apache2/ssl
ssh owncloud -t 'sudo service apache2 restart'
