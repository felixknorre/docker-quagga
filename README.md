# docker-quagga

Dockerfile with Alpine Linux and Quagga Version 1.2.2 for GNS3.

Docker Hub: `fknorre/quagga:1.2.2-alpine`

## Usage

Run
```bash
docker run --rm -t -d --name quagga fknorre/quagga:1.2.1-alpine
```

## Re-/Build

Re-/Build:
```bash
docker build --tag fknorre/quagga:1.2.2-alpine .
```

