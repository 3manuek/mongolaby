#!/bin/bash

# credit: Robert Larsen

# Thanks Scien !! https://gist.github.com/scien/10000797
# http://alexyu.se/content/2012/04/mongodb-quick-start-replica-sets-and-sharding

tableOfServers=serverList.txt

function create_shard(){
    shard=$1
    repl_factor=$2
    shard_name="shard_${shard}"
    shard_dir=shard${shard}
    init='rs.initiate({_id:"'${shard_name}'",members:['
    mkdir ${shard_dir}
    for server in $(seq 1 $repl_factor); do
        port=$((26000+(shard-1)*repl_factor+server))
        dir=${shard_dir}/${server}
        mkdir ${dir}
        mongod --quiet --smallfiles --nojournal --oplogSize 50 --fork --port ${port} --dbpath ${dir} --logpath ${shard_dir}/${server}.log --replSet ${shard_name} >/dev/null
        if test ${server} -gt 1; then
            init=${init}','
        fi
        init=${init}'{_id:'$((server-1))',host:"'${HOSTNAME}':'${port}'"}'
    done
    init=${init}']})'
    #Initialize the replication set
    mongo localhost:${port} --eval "${init}" >/dev/null
    echo "${shard_name}/${HOSTNAME}:${port}"
}

function create_cluster(){
    num_shards=$1
    repl_factor=$2

    #Create config servers
    mkdir -p cfg/{1,2,3}
    mongod --configsvr --smallfiles --nojournal --dbpath cfg/1 --port 26050 --fork --logpath cfg/1.log >/dev/null
    mongod --configsvr --smallfiles --nojournal --dbpath cfg/2 --port 26051 --fork --logpath cfg/2.log >/dev/null
    mongod --configsvr --smallfiles --nojournal --dbpath cfg/3 --port 26052 --fork --logpath cfg/3.log >/dev/null

    #Create a single mongos server on the default port
    sleep 2
    mongos --configdb ${HOSTNAME}:26050,${HOSTNAME}:26051,${HOSTNAME}:26052 --fork --logpath mongos.log >/dev/null

    #Create shards
    init=""
    for shard in $(seq 1 $num_shards); do
        host=$(create_shard $shard $repl_factor)
        init=${init}"sh.addShard('${host}');"
    done

    #Wait for replication sets to initialize
    count=0
    while [ "${count}" != "${num_shards}" ]; do
        sleep 1
        count=$(grep -l PRIMARY shard*/1.log|wc -l)
        echo -en "\rReplication sets ready: ${count} out of ${num_shards}"
    done
    echo
    mongo --shell --eval "${init}"
}

if [ "$2" == "" ]; then
    echo "Usage: $0 <shards> <replication factor>"
else
    killall mongod 2>/dev/null
    killall mongos 2>/dev/null
    rm -rf shard* cfg mongos.log
    create_cluster $1 $2
fi
