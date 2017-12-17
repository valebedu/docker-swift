# docker-swift

docker-swift help you to build swift applications on ubuntu systems.

## Table of Contents

*   [Getting started](#getting_started)
*   [Documentation](#documentation)
*   [Reference](#reference)
*   [Contributing](#contributing)
*   [Licensing](#licensing)
*   [Changelog](#changelog)

## Getting started

### Installation

Be sure Docker is installed on your machine before continuing. To ensure that docker is installed on your machine and running, run the following command.

``` shell
docker --version
```

The image will be downloaded automatically by running a script using it but if you want to download it manually, you can run the following command.

``` shell
docker pull valentinbercot/docker-swift
```

### How to use

#### Docker run

To run this docker image with `docker run` you just have to run the following command in your terminal.

```shell
docker run --interactive --tty --name yourContainerName valentinbercot/docker-swift /bin/bash
```

You can add the following options to this command to complete your configuration.

*   set a content volume: `--volume /path/to/project:/path/to/project`

#### Dockerfile

To run this docker image with a dockerfile you should first create a `Dockerfile` as following.

``` dockerfile
FROM valentinbercot/docker-swift

VOLUME /path/to/project /path/to/project
```

Then build your image.

``` shell
docker build --tag yourName/yourImage .
```

And run it.

``` shell
docker run --interactive --tty --name yourContainerName yourName/yourImage /bin/bash
```

#### Docker-compose

To run this docker image with docker-compose you should first create a `docker-compose.yml` as following.

``` yaml
version: '2.0'

services:
    yourComposeName:
        container_name: "yourContainerName"
        image: "valentinbercot/docker-swift"
        volumes:
            - "/path/to/project:/path/to/project"
        command: "swift --version"
```

Then build and run your docker-compose.

``` shell
docker-compose up
```

## Documentation

If you want to know more about Docker or Swift please refer to official documentations in [reference](#reference).

## Reference

*   [Docker][docker]
*   [Swift][swift]

## Contributing

You're free to contribute, please fork my project and send me a pull request.

If you want to contribute please be aware of my [CODE OF CONDUCT][code_of_conduct].

## Licensing

This repository is under this [LICENSE][license].

## Changelog

The complete changelog could be found in [CHANGELOG][changelog].

[docker]: https://docker.com
[swift]: https://swift.org
[code_of_conduct]: CODE_OF_CONDUCT.md
[license]: LICENSE.md
[changelog]: CHANGELOG.md
