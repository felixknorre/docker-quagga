FROM alpine:3.12
LABEL maintainer="felix-knorre@hotmail.de"

# install tool to build quagga
RUN apk update \
        && apk add --no-cache git \
        autoconf \
        automake \
        libtool \
        texinfo \
        gawk \
        alpine-sdk \
        linux-headers \
        readline-dev \
        iptables \
        c-ares-dev \
        wget \
        pkgconfig \
        ncurses-dev \
        net-snmp-dev \
        busybox-extras

# clone repo and install quagga 1.2.2
RUN git clone https://github.com/Quagga/quagga.git \
        && cd quagga \
        && git checkout tags/quagga-1.2.2 \
        && ./bootstrap.sh \
        && ./configure --enable-vtysh --localstatedir=/var/run/quagga --sysconfdir=/etc/quagga \
        && make \
        && make install

# create empty config and log file & run dir
RUN rm /etc/quagga/*.sample* \
        && touch /etc/quagga/bgpd.conf \
        && touch /etc/quagga/isisd.conf \
        && touch /etc/quagga/ospf6d.conf \
        && touch /etc/quagga/ospfd.conf \
        && touch /etc/quagga/pimd.conf \
        && touch /etc/quagga/ripd.conf \
        && touch /etc/quagga/ripngd.conf \
        && touch /etc/quagga/vtysh.conf \
        && touch /etc/quagga/zebra.conf \
	&& mkdir  /var/log/quagga/ \
        && touch /var/log/quagga/isisd.log \
        && touch /var/log/quagga/ospf6d.log \
        && touch /var/log/quagga/ospfd.log \
        && touch /var/log/quagga/pimd.log \
        && touch /var/log/quagga/ripd.log \
        && touch /var/log/quagga/ripngd.log \
        && touch /var/log/quagga/vtysh.log \
        && touch /var/log/quagga/zebra.log \
	&& mkdir /var/run/quagga


# change owner and group
RUN addgroup -S quagga && adduser -S quagga -G quagga \
	&& chown quagga:quagga /etc/quagga \
        && chown quagga:quagga /var/run/quagga \
        && chown quagga:quagga /etc/quagga/*.conf \
        && chown quagga:quagga /var/log/quagga/*.log


# store config files in a volume
VOLUME ["/etc/"]