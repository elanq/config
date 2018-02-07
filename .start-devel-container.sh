#!/bin/bash
cd /Users/eq/Documents/ruby/mothership
bundle install
NEW_CLUSTER=( http://192.168.99.100:9400 http://127.0.0.1:9200 )
OLD_CLUSTER=http://192.168.99.100:8600

eval $(docker-machine env master)
docker container start redis-mothership
docker container start elasticsearch5
docker container start elasticsearch24
# kafka and zookeeper container
docker container start kafka-container
# check if everything is running
docker ps -a -f STATUS=running | awk '{print $2}'


echo "checking backburner service"
if pgrep -x "backburner" > /dev/null
then
  echo "backburner is alredy running"
else
  echo "starting backburner"
  nohup bundle exec backburner >/dev/null 2&1 &
  echo "backburner started"
fi

# init mothership development elasticsearch data
echo "start filling elasticsearch cluster"
for cluster in "${NEW_CLUSTER[@]}"
do
  echo "executing create indices on cluster $cluster"
  bundle exec rake searcheror:create_indices ELASTICSEARCH_PRODUCT_CLUSTER=$cluster
  bundle exec rake searcheror:reindex ELASTICSEARCH_PRODUCT_CLUSTER=$cluster
done

bundle exec rake elasticsearch:create_indices ELASTICSEARCH_URL=$OLD_CLUSTER
bundle exec rake elasticsearch:reindex_index ELASTICSEARCH_URL=$OLD_CLUSTER
echo "indexing done"

