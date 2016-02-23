#!/bin/bash
source /data/env
eval "$(weave proxy-env)"

docker build -t lvshun/elasticsearch .
docker rm -f elasticsearch2X1
docker rm -f elasticsearch2X2
docker run -d --name elasticsearch2X1 \
	-p 9201:9200 \
	-p 9301:9300 \
    lvshun/elasticsearch \
    -Des.node.name="ES2X1" \
    -Des.cluster.name="elasticsearch" \
    -Des.transport.publish_host="{HOST}" \
    -Des.transport.publish_port="9301"
docker run -d --name elasticsearch2X2 \
	-p 9202:9200 \
	-p 9302:9300 \
	lvshun/elasticsearch \
	-Des.node.name="ES2X2" \
    -Des.cluster.name="elasticsearch" \
    -Des.transport.publish_host="{HOST}" \
    -Des.transport.publish_port="9302"