
# Supported tags and respective `Dockerfile` links

-	[`1.1.2`, `1.1`, `latest` (*1.1.2/Dockerfile*)](https://github.com/conjecto/docker-rdf-delta/blob/master/1.1.2/Dockerfile)
-	[`0.8.2`, `0.8` (*0.8.2/Dockerfile*)](https://github.com/conjecto/docker-rdf-delta/blob/master/0.8.2/Dockerfile)
-	[`0.8.1` (*0.8.1/Dockerfile*)](https://github.com/conjecto/docker-rdf-delta/blob/master/0.8.1/Dockerfile)
-	[`0.8.0` (*0.8.0/Dockerfile*)](https://github.com/conjecto/docker-rdf-delta/blob/master/0.8.0/Dockerfile)

# What is RDF Delta ?

RDF Delta is a system for recording and publishing changes to RDF Datasets.

For more information, please visit [https://afs.github.io/rdf-delta/](https://afs.github.io/rdf-delta/).

# How to use this image

## Run a patch log server

Starting a patch log server instance is simple:

```console
$ docker run --name rdf-delta-server -d -p 1066:1066 conjecto/rdf-delta:tag
```

... where `rdf-delta-server` is the name you want to assign to your container, `tag` is the tag specifying the RDF Delta version you want. See the list above for relevant tags.

## ... via [`docker stack deploy`](https://docs.docker.com/engine/reference/commandline/stack_deploy/) or [`docker-compose`](https://github.com/docker/compose)

Example `stack.yml` for `blazegraph`:

```yaml
version: '3.1'

services:

    rdf-delta:
        image: conjecto/rdf-delta
        environment:
            JAVA_XMS: 512m
            JAVA_XMX: 1g

```

[![Try in PWD](https://github.com/play-with-docker/stacks/raw/cff22438cb4195ace27f9b15784bbb497047afa7/assets/images/button.png)](http://play-with-docker.com?stack=https://raw.githubusercontent.com/conjecto/rdf-delta/master/stack.yml)

Run `docker stack deploy -c stack.yml conjecto/rdf-delta` (or `docker-compose -f stack.yml up`), wait for it to initialize completely, and visit `http://swarm-ip:1066`, `http://localhost:1066`, or `http://host-ip:1066` (as appropriate).