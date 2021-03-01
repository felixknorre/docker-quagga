# docker-quagga

Dockerfile with Alpine Linux and Quagga for GNS3.

Docker Hub: fknorre/quagga:latest

## Usage

Run
```bash
docker run --rm -t -d fknorre/quagga
```

Shell
```bash
docker exec -it <container-name> sh
```

Config-Files 
```bash
cd /etc/quagga/
```

Log-Files 
```bash
cd /var/log/quagga/
```

Run telnet
```bash
telnet localhost 2602
```

## Build


Re-/Build:

```bash
docker build --tag fknorre/quagga:latest .
```
