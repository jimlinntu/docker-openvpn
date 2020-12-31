#!/bin/bash

# https://wiki.archlinux.org/index.php/iptables

public_ips=("122.147.1.39" "122.147.1.40")
target_ip=127.0.0.1

for ip in "${public_ips[@]}"; do
    # check exist
    iptables -t nat -C PREROUTING -d "$ip" -j DNAT --to-destination "${target_ip}" 2>/dev/null || {
        iptables -t nat -A PREROUTING -d "$ip" -j DNAT --to-destination "${target_ip}"
    }

    # for debugging
    iptables -t nat -C OUTPUT -d "$ip" -j DNAT --to-destination "${target_ip}" 2>/dev/null || {
        iptables -t nat -A OUTPUT -d "$ip" -j DNAT --to-destination "${target_ip}"
    }
done

# Enable local routing, otherwise 127.0.0.1 will be thrown away
#echo 1 > /proc/sys/net/ipv4/conf/all/route_localnet
