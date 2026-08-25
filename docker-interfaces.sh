#!/usr/bin/env bash

# Colours
BLUE="\033[0;34m"
RESET="\033[0m"
YELLOW='\033[1;43m'
NC='\033[0m' # No Color
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'

for container in $(docker ps --format '{{.Names}}'); do
    # Use associative array to deduplicate veths per container
    declare -A seen_veths=()

    # Get all iflink values (no -t to avoid TTY issues)
    for net in $(docker exec "$container" sh -c 'cat /sys/class/net/eth*/iflink 2>/dev/null' | tr -d '\r'); do

        veth_path=$(grep -l "$net" /sys/class/net/veth*/ifindex 2>/dev/null)
        veth=$(echo "$veth_path" | sed -e 's;^.*net/\(.*\)/ifindex$;\1;')

        # Skip empty results
        [ -z "$veth" ] && continue

        # Deduplicate
        if [[ -z "${seen_veths[$veth]}" ]]; then
            seen_veths[$veth]=1

            # Print with colour
            echo -e "${GREEN}${container}${RESET}:${CYAN}${veth}${RESET}"
        fi
    done
done
