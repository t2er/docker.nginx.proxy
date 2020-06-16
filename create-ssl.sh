#!/bin/bash

if [[ -z $1 ]] 
then
  echo "specify a domain"
  exit
fi

DOMAIN=$1

echo """
==================================================
  Creating certificate for ${DOMAIN}
==================================================
"""
mkcert ${DOMAIN} *.${DOMAIN}

echo """
==================================================
  Copying ${DOMAIN} certificates to ./docker/certs
==================================================
"""
mv ./${DOMAIN}+1.pem ./docker/certs/${DOMAIN}.crt
mv ./${DOMAIN}+1-key.pem ./docker/certs/${DOMAIN}.key

echo """
==================================================
  Add the following to /etc/hosts file
  127.0.0.1 ${DOMAIN}
==================================================
"""

