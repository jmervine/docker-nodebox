## Node.js/Busybox Dockerfile

This repository contains **Dockerfile** of [Node.js](http://nodejs.org/) running with [Busybox](https://github.com/progrium/busybox) (~28 MB virtual size) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [progrium/busybox](https://registry.hub.docker.com/u/progrium/busybox/)

### Usage

    > docker run --rm -ti jmervine/nodebox:<VERSIOM>
    # node --version
    v<VERSION>

### Versions

* [`0.12.0`], [`0.12.0-onbuild`], [`latest`], [`latest-onbuild`]
* [`0.11.16`], [`0.11.16-onbuild`]
* [`0.11.14`], [`0.11.14-onbuild`]
* [`0.10.36`], [`0.10.36-onbuild`]
* [`0.10.34`], [`0.10.34-onbuild`]
* [`0.10.32`], [`0.10.32-onbuild`]

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

### Contributing: Building / Development

Fork this repo.

To add a new version, simply create a new directory -- updating the `latest` symlink if needed -- and run the following:

```bash
make generate/NEW_VERSION build/NEW_VERSION test/NEW_VERSION push/NEW_VERSION

# if latest is updated
make generate/latest build/latest test/latest
```

If updating either template, or the parent image:

```
make generate build test
```

Send me a pull request.

[`0.10.32`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.32/Dockerfile
[`0.10.32-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.32/onbuild/Dockerfile
[`0.10.34`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.34/Dockerfile
[`0.10.34-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.34/onbuild/Dockerfile
[`0.10.36`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.36/Dockerfile
[`0.10.36-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.36/onbuild/Dockerfile
[`0.11.14`]: https://github.com/jmervine/docker-nodebox/blob/master/0.11.14/Dockerfile
[`0.11.14-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.11.14/onbuild/Dockerfile
[`0.11.16`]: https://github.com/jmervine/docker-nodebox/blob/master/0.11.16/Dockerfile
[`0.11.16-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.11.16/onbuild/Dockerfile
[`0.12.0`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.0/Dockerfile
[`0.12.0-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.0/onbuild/Dockerfile
[`latest`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.0/Dockerfile
[`latest-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.0/onbuild/Dockerfile
