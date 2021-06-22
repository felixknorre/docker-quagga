# docker-quagga

Dockerfile with alpine linux and quagga for GNS3.

This is a container which I used for education purposes. 

You can find this container on Docker Hub: [fknorre/quagga](https://hub.docker.com/repository/docker/fknorre/quagga)

## Usage Docker

Run
```bash
docker run --rm -t -d --name quagga fknorre/quagga:1.2.2-alpine
```

Re-/Build:
```bash
docker build --tag fknorre/quagga:<version> .
```

## Usage Quagga

The config files are located under `/etc/quagga` and are empty so that the students can configure them. If you want to preconfigure the config files add them to the Dockerfile or create an new image from a preconfigured container uning `docker commit <container-name>`.

If you want to use RIP, use `fknorre/quagga:1.2.2-alpine`.

### Example configuration

zebra.conf:
```
hostname R1
password pw
enable password pw
log file /var/log/quagga/zebra.log
```

ripd.conf
```
hostname R1
password pw
enable password pw
log file /var/log/quagga/ripd.log
```


```bash
# start zebra
zebra -d
# start rip
ripd -d
# connect with zebra console
telnet localhost 2601
# connect with rip console
telnet localhost 2602
```



