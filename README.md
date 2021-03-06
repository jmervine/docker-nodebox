> ## DEPRICATION NOTICE
>
> #### I'm abandoning this in favor of [jmervine/mininode](https://registry.hub.docker.com/u/jmervine/mininode/) for newer version due to changes in Busybox which makes building things annoying. I will be added new versions there as they become available in Alpine's package manager. I've also included [jmervine/miniiojs](https://registry.hub.docker.com/u/jmervine/miniiojs/) as part of this switch.

## Node.js/Busybox Dockerfile

> ### WARNING!!!
>
> With the exception of `-fat` variants, which are much larger, these images
> don't contain `python`. As such, `node-gyp` and therefore native extensions
> will not work.

This repository contains **Dockerfile** of [Node.js](http://nodejs.org/) running with [Busybox](https://github.com/progrium/busybox) (~28 MB virtual size) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [progrium/busybox](https://registry.hub.docker.com/u/progrium/busybox/)

### Usage

    > docker run --rm -ti jmervine/nodebox:<VERSIOM>
    # node --version
    v<VERSION>

### Versions

* [`0.12.6`], [`0.12.6-onbuild`], [`0.12.6-fat`],
  [`0.12`], [`0.12-onbuild`], [`0.12-fat`],
  [`latest`], [`latest-onbuild`], [`latest-fat`]
* [`0.12.5`], [`0.12.5-onbuild`], [`0.12.5-fat`]
* [`0.12.4`], [`0.12.4-onbuild`], [`0.12.4-fat`]
* [`0.12.3`], [`0.12.3-onbuild`], [`0.12.3-fat`]
* [`0.12.2`], [`0.12.2-onbuild`], [`0.12.2-fat`]
* [`0.12.0`], [`0.12.0-onbuild`], [`0.12.0-fat`]
* [`0.11.16`], [`0.11.16-onbuild`], [`0.11.16-fat`]
* [`0.11.14`], [`0.11.14-onbuild`], [`0.11.14-fat`]
* [`0.10.40`], [`0.10.40-onbuild`], [`0.10.40-fat`],
  [`0.10`], [`0.10-onbuild`], [`0.10-fat`]
* [`0.10.38`], [`0.10.38-onbuild`], [`0.10.38-fat`]
* [`0.10.36`], [`0.10.36-onbuild`], [`0.10.36-fat`]
* [`0.10.34`], [`0.10.34-onbuild`], [`0.10.34-fat`]
* [`0.10.32`], [`0.10.32-onbuild`], [`0.10.32-fat`]
* [`0.10.25`], [`0.10.25-onbuild`], [`0.10.25-fat`]

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
# version are for example only

# create new version
cp -r 0.12.5 0.12.6

# update symlinks
rm latest 0.12
ln -s 0.12.6 latest
ln -s 0.12.6 0.12

# generate new Dockerfile(s)
make generate/0.12.6

# build new images
make build/{0.12.6,0.12,latest}

# test new images
make test/{0.12.6,0.12,latest}

# commit changes
git add -A
git commit -a -m 'Adding version 0.12.6'

```

If updating either the template or the parent image:

```
make generate build test
```

Send me a pull request.

[`0.10.25`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.25/Dockerfile
[`0.10.25-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.25/onbuild/Dockerfile
[`0.10.25-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.25/fat/Dockerfile
[`0.10.32`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.32/Dockerfile
[`0.10.32-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.32/onbuild/Dockerfile
[`0.10.32-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.32/fat/Dockerfile
[`0.10.34`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.34/Dockerfile
[`0.10.34-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.34/onbuild/Dockerfile
[`0.10.34-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.34/fat/Dockerfile
[`0.10.36`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.36/Dockerfile
[`0.10.36-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.36/onbuild/Dockerfile
[`0.10.36-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.36/fat/Dockerfile
[`0.10.38`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.38/Dockerfile
[`0.10.38-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.38/onbuild/Dockerfile
[`0.10.38-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.38/fat/Dockerfile
[`0.10.40`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.40/Dockerfile
[`0.10.40-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.40/onbuild/Dockerfile
[`0.10.40-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.40/fat/Dockerfile

[`0.10`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.40/Dockerfile
[`0.10-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.40/onbuild/Dockerfile
[`0.10-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.10.40/fat/Dockerfile

[`0.11.14`]: https://github.com/jmervine/docker-nodebox/blob/master/0.11.14/Dockerfile
[`0.11.14-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.11.14/onbuild/Dockerfile
[`0.11.14-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.11.14/fat/Dockerfile
[`0.11.16`]: https://github.com/jmervine/docker-nodebox/blob/master/0.11.16/Dockerfile
[`0.11.16-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.11.16/onbuild/Dockerfile
[`0.11.16-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.11.16/fat/Dockerfile

[`0.12.0`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.0/Dockerfile
[`0.12.0-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.0/onbuild/Dockerfile
[`0.12.0-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.0/fat/Dockerfile
[`0.12.2`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.2/Dockerfile
[`0.12.2-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.2/onbuild/Dockerfile
[`0.12.2-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.2/fat/Dockerfile
[`0.12.3`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.3/Dockerfile
[`0.12.3-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.3/onbuild/Dockerfile
[`0.12.3-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.3/fat/Dockerfile
[`0.12.4`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.4/Dockerfile
[`0.12.4-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.4/onbuild/Dockerfile
[`0.12.4-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.4/fat/Dockerfile
[`0.12.5`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.5/Dockerfile
[`0.12.5-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.5/onbuild/Dockerfile
[`0.12.5-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.5/fat/Dockerfile
[`0.12.6`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.6/Dockerfile
[`0.12.6-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.6/onbuild/Dockerfile
[`0.12.6-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.6/fat/Dockerfile

[`0.12`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.6/Dockerfile
[`0.12-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.6/onbuild/Dockerfile
[`0.12-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.6/fat/Dockerfile

[`latest`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.6/Dockerfile
[`latest-onbuild`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.6/onbuild/Dockerfile
[`latest-fat`]: https://github.com/jmervine/docker-nodebox/blob/master/0.12.6/fat/Dockerfile

