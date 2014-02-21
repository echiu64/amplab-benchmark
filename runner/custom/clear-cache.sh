#!/bin/bash -x
 
function clear_cache(){
   echo "Clearing cache"
   pdsh -w hdpbench-slave[0-4] "sync && echo 3 > /proc/sys/vm/drop_caches" 
}

OPT=$1;
OPT="-f";# comment this line to turn off cache flushes

if [ "x$OPT" == "x-f" ]; then
	clear_cache;
fi
