# magento
https://github.com/markshust/docker-magento

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