#!/bin/bash

# List all the ips in the given network prefix
# /24 only

# Usage: bash IPList.bash 10.0.17
[ $# -ne 1 ] && echo "Usage: $0 <network_prefix>" && exit 1

# Prefix is the first input taken
prefix=$1

# Verify input length
[ ${#prefix} -lt 5 ] && \
printf "Prefix length is too short\nPrefix example: 10.0.17\n" && \
exit 1

for i in {0..255}
do
	ping -c 1 -W 1 ${prefix}.${i} > /dev/null 2>&1 && echo ${prefix}.${i} | \
	grep -v '127.0.0.1' | grep -o -E '([0-9]{1,3}\.){3}[0-9]{1,3}' > /dev/null 2>&1 && echo ${prefix}.${i}
done
