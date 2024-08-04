# magento
https://github.com/markshust/docker-magento

## Quickstart bootstrap
```
# bash bootstrap.sh [project] [domain]
bash bootstrap.sh magento magento.test
```

## New Project
1. Create your project directory then go into it:
```
mkdir -p ~/Sites/magento
cd $_
```
2. Download the Docker Compose template:
```
curl -s https://raw.githubusercontent.com/markshust/docker-magento/master/lib/template | bash
```
3. Download the version of Magento you want to use with:
```
bin/download 2.4.7 community
```
You can specify the version and type (community, enterprise, mageos, mageos-nightly, mageos-mirror, mageos-hypernode-mirror, or mageos-maxcluster-mirror).
The mageos type is an alias for mageos-mirror.
If no arguments are passed, "2.4.7" and "community" are the default values used.
```
# or for Magento core development:
# bin/start --no-dev
# bin/setup-composer-auth
# bin/cli git clone git@github.com:magento/magento2.git .
# bin/cli git checkout 2.4-develop
# bin/composer install
```
```
# Want to install Magento <2.4.6? In bin/setup-install, replace the lines:
#  --elasticsearch-host="$ES_HOST" \
#  --elasticsearch-port="$ES_PORT" \
#  --opensearch-host="$OPENSEARCH_HOST" \
#  --opensearch-port="$OPENSEARCH_PORT" \
#  --search-engine=opensearch \
# with:
#  --elasticsearch-host="$ES_HOST" \
#  --elasticsearch-port="$ES_PORT" \
#  --search-engine=elasticsearch7 \
```
4. Run the setup installer for Magento:
```
bin/setup magento.test
```
```
open https://magento.test
```

rg-appsvcquickstart-eastus-dev-001

**Azure CLI**
```
sudo su root
curl -L https://aka.ms/InstallAzureCli | sudo bash
```
** Az Login and create ACR
```
az login --use-device-code
rg="rg-appsvcquickstart-eastus-dev-001"
acr="appsvcquickstart01"
az acr create --resource-group $rg --name $acr --sku Basic
# Login server: appsvcquickstart01.azurecr.io
az acr login --name $acr

```

### Containers
REPOSITORY                      TAG          IMAGE ID       CREATED        SIZE
linuxserver/phpmyadmin          latest       e16f5760c0a0   21 hours ago   137MB
mariadb                         10.6         4cb983cc407c   6 weeks ago    396MB
sj26/mailcatcher                latest       750c37a402e6   8 weeks ago    129MB
redis                           7.2-alpine   97ed3031282d   2 months ago   40.7MB
markoshust/magento-php          8.3-fpm-2    53a814ceeac4   3 months ago   1.3GB
markoshust/magento-opensearch   2.12-0       24058d03b46e   3 months ago   1.29GB
markoshust/magento-nginx        1.24-0       7c14fa38c2a5   3 months ago   52.6MB
markoshust/magento-rabbitmq     3.12-0       06973223469a   3 months ago   175MB
```
docker commit <container id> bn-magento:latest
docker images
docker tag <image id>


docker tag 7c14fa38c2a5 $acr.azurecr.io/magento-nginx
docker push $acr.azurecr.io/magento-nginx

docker tag 53a814ceeac4 $acr.azurecr.io/magento-php:8.3-fpm-2
docker push $acr.azurecr.io/magento-php:8.3-fpm-2

docker tag 24058d03b46e $acr.azurecr.io/magento-opensearch:2.12-0
docker push $acr.azurecr.io/magento-opensearch:2.12-0

docker tag 4cb983cc407c $acr.azurecr.io/mariadb:10.6
docker push $acr.azurecr.io/mariadb:10.6

docker tag 97ed3031282d $acr.azurecr.io/redis:7.2-alphine
docker push $acr.azurecr.io/redis:7.2-alphine

docker tag e16f5760c0a0 $acr.azurecr.io/phpmyadmin
docker push $acr.azurecr.io/phpmyadmin

docker tag 06973223469a $acr.azurecr.io/magento-rabbitmq:3.12-0
docker push $acr.azurecr.io/magento-rabbitmq:3.12-0

docker tag 750c37a402e6 $acr.azurecr.io/mailcatcher
docker push $acr.azurecr.io/mailcatcher
```

## Create new image from running container
```
docker ps -a
docker commit <container id> bit-magento:latest
docker images
docker tag <image id> $ACR.azurecr.io/bit-magento
docker push $ACR.azurecr.io/bit-magento
```



