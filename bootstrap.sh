#!/usr/bin/env bash

SITE=${1:-magento}
DOMAIN=${2:-magento.test}

echo "Creating site (${SITE}) directory..."
mkdir -p ~/Sites/${SITE}
cd $_

echo "Downloading bootstrap files..."
curl -s https://raw.githubusercontent.com/markshust/docker-magento/master/lib/template | bash

echo "Installing latest Magento community build..."
bin/download 2.4.7 community

echo "Run the setup installer for Magento with domain ${DOMAIN}..."
bin/setup "${DOMAIN}"

cd ~/Sites/"${SITE}"