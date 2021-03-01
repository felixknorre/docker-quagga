FROM alpine:latest
LABEL maintainer="felix-knorre@hotmail.de"

# install quagga, quagga example configs and telnet 
RUN apk update && apk add --no-cache quagga busybox-extras


# create config file
RUN touch /etc/quagga/bgpd.conf \
        && touch /etc/quagga/isisd.conf \
        && touch /etc/quagga/ospf6d.conf \
        && touch /etc/quagga/ospfd.conf \
        && touch /etc/quagga/pimd.conf \
        && touch /etc/quagga/ripd.conf \
        && touch /etc/quagga/ripngd.conf \
        && touch /etc/quagga/vtysh.conf \
        && touch /etc/quagga/zebra.conf

# change owner and group 
RUN chown quagga:quagga /etc/quagga/*.conf

# create log files
RUN mkdir  /var/log/quagga/ \
        && touch /var/log/quagga/isisd.log \
        && touch /var/log/quagga/ospf6d.log \
        && touch /var/log/quagga/ospfd.log \
        && touch /var/log/quagga/pimd.log \
        && touch /var/log/quagga/ripd.log \
        && touch /var/log/quagga/ripngd.log \
        && touch /var/log/quagga/vtysh.log \
        && touch /var/log/quagga/zebra.log

# change owner and group
RUN chown quagga:quagga /var/log/quagga/*.log

# store config files in a volume
VOLUME ["/etc/"]