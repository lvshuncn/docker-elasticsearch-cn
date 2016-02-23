#!/bin/bash
source /data/env
eval "$(weave proxy-env)"

docker build -t lvshun/elasticsearch .
docker rm -f elasticsearch2X1
docker run -d --name elasticsearch2X1 \
    lvshun/elasticsearch \
    -Des.node.name="ES2X1" \
    -Des.cluster.name="elasticsearch"