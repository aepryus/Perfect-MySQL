#!/bin/bash
arc=$(arch)
repo=rockywei/perfectmysql:5.6.$arc
docker build -t $repo --build-arg arch=$arc .
docker run -it -v $PWD:/home -w /home --network perfect-mysql_mysql $repo /bin/bash -c \
"swift test --filter testSelfJunctionJoin --filter testCodableProperty && swift test --skip testSelfJunctionJoin --skip testCodableProperty"
