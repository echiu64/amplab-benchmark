#!/bin/bash

function run(){
  mkdir -p ./logs
  for i in `ls *.sql`
  do
    echo $i
    rm -rf ./logs/$i.log
    hive -i /grid/0/amplab-benchmark/runner/tez/Stinger-Preview-Quickstart/configs/stinger.settings -f $i 2>&1 | tee ./logs/$i.log 
  done
}

function get_logs(){
  cd logs
  for x in *.sql.log; do 
    apps=$(grep "application id:" $x | sed "s/.*application id: \([^)]*\)).*/\1/" | sort | uniq); 
    for i in $apps; do
      test -f $i.$x.gz || (yarn logs -applicationId $i > $i.$x && gzip $i.$x)
    done
  done
  cd ..
}

./clear-cache.sh -f
run
get_logs
