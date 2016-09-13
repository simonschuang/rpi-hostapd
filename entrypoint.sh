#!/bin/bash

ifconfig wlan0 10.0.0.1/24

/etc/init.d/dbus start
/etc/init.d/hostapd start
/etc/init.d/dnsmasq start

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -C POSTROUTING -o eth0 -j MASQUERADE
if [ ! $? -eq 0 ]
then
    iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
fi

sleep infinity
