#!/bin/bash
num=$1
if test $num -ge 160
then
	echo "number of insts exceed 160"
	exit
fi
if test $num -le 0
then
	echo "number of insts can't be 0 or less"
	exit
fi
echo "number of insts: $num"

DATE=$(date +"%m-%d-%y-%H-%M")
PCAP_FILE=maccdc2012_00001.pcap

for ((i = 1; i <= $num; i++))
do
	PCAP_LIST+="$PCAP_FILE"
	if test $i -lt $num
	then
		PCAP_LIST+=" "
	fi
done
PCAP_LIST_OPT="--pcap-list=\"${PCAP_LIST}\""
echo "$PCAP_LIST"
echo "$PCAP_LIST_OPT"
HYPERSCAN="search_engine.search_method = \"hyperscan\""
#COMMAND="taskset -c 1-$num snort -z 0  -v --rule-path /usr/local/etc/rules/ -c /usr/local/etc/snort/snort.lua --lua 'search_engine.search_method = "hyperscan"' --pcap-list="$PCAP_LISTi""
if test $num -eq 80
	CMD="taskset -c 0-79 snort -z 0  -v --rule-path /usr/local/etc/rules/ -c /usr/local/etc/snort/snort.lua --lua '$HYPERSCAN' $PCAP_LIST_OPT"
then
	CMD="taskset -c 1-$num snort -z 0  -v --rule-path /usr/local/etc/rules/ -c /usr/local/etc/snort/snort.lua --lua '$HYPERSCAN' $PCAP_LIST_OPT"
fi

eval $CMD
echo "$CMD"
