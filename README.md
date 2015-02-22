## Node.js/Busybox Dockerfile

This repository contains **Dockerfile** of [Node.js](http://nodejs.org/) running with [Busybox](https://github.com/progrium/busybox) (~28 MB virtual size) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


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

#### ONBUILD variant

All versions support an `-onbuild` variant. This is based on the core nodejs docker image, and expects the following:

* Your `Dockerfile` is in your project root along side your `package.json`.
* Your app to be started via `npm start`.

Example tree:

```
.
├── Dockerfile
├── app.js
└── package.json
```

Example Dockerfile:

```
FROM jmervine/nodebox:0.10.36-onbuild
# replace this with your application's default port
EXPOSE 8888
```
