## Node.js/Busybox Dockerfile

This repository contains **Dockerfile** of [Node.js](http://nodejs.org/) running with [Busybox](https://github.com/progrium/busybox) (~28 MB virtual size) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/jmervine/nodebox/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [progrium/busybox](https://registry.hub.docker.com/u/progrium/busybox/)

### Usage

    > docker run --rm -ti jmervine/nodebox:<VERSIOM>
    # node --version
    v<VERSION>

### Versions

* 0.12.0 / latest
* 0.11.16
* 0.11.14
* 0.10.36
* 0.10.34
* 0.10.32
