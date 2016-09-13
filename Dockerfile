FROM sdhibit/rpi-raspbian:jessie

MAINTAINER Simon Chuang "simon.s.chuang@gmail.com"

RUN apt-get update --fix-missing && apt-get install -y \
    hostapd \
    dbus \
    net-tools \
    iptables \
    dnsmasq \
    vim

ADD hostapd.conf /etc/hostapd/hostapd.conf
ADD hostapd /etc/default/hostapd
ADD dnsmasq.conf /etc/dnsmasq.conf

Add entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
