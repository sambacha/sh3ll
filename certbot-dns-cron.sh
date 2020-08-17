#!/bin/bash
sudo yum -y install --setopt=obsoletes=0 python2-certbot-dns-route53

sudo tee /etc/cron.daily/certbot << EOF
#!/bin/sh
EMAIL=email@domain.com
DOMAIN=subnet.domain.com
CUR_HASH=\`md5sum /etc/letsencrypt/live/"\${DOMAIN}"/fullchain.pem | cut -d ' ' -f 1\`
/usr/bin/certbot-2 --text --agree-tos --non-interactive --email "\${EMAIL}" -d "\${DOMAIN}" --dns-route53 --dns-route53-propagation-seconds 30 --preferred-challenges dns --expand --manual-public-ip-logging-ok certonly
NEW_HASH=\`md5sum /etc/letsencrypt/live/"\${DOMAIN}"/fullchain.pem | cut -d ' ' -f 1\`
if [ "\${CUR_HASH}" = "\${NEW_HASH}" ]; then
    exit 0
fi

# this is for mongodb - can be changed to any other service
cat /etc/letsencrypt/live/"\${DOMAIN}"/privkey.pem /etc/letsencrypt/live/"\${DOMAIN}"/fullchain.pem > /etc/ssl/mongodb.pem
chown mongod:mongod /etc/ssl/mongodb.pem
chmod 600 /etc/ssl/mongodb.pem
systemctl restart mongod
EOF
