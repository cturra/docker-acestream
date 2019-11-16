## About this container
This container runs the [AceStream](http://www.acestream.org/) client console on [Debian Linux](https://www.debian.org/). More about
AceStream can be found at:

  http://www.acestream.org/


## Quick Run
Check out the [container options](#container-options) below if you want more details about each of the options. If you just want to get
up and running, here is the minimum you'll need:

1. [build](#build)
2. [run](#run-or-start)
3. [connect](#connecting-to-stream)


## Container Options
The `Makefile` included in this repo should help with all the interactions you may need to make with the `cturra/acestream` container.


#### Build
Build container image locally from Dockerfile.

```
$> make build
```


#### Run or Start
:warning: Requirement: container has been [built](#build)

Run (or start) conatiner:

```
$> make run
```


#### Stop
:warning: Requirement: container is [running](#run-or-start)

Stop and tear down the AceStream service. This will both stop and remove the container.

```
$> make stop
```


#### Logs
:warning: Requirement: container is [running](#run-or-start)

Fetch and follow the container logs.

```
$> make logs
```


#### Shell
:warning: Requirement: container is [running](#run-or-start)

Drop into the container to interact with it.

```
$> make shell
```


#### Stats
:warning: Requirement: container is [running](#run-or-start)

Display a live stream of the container resource usage statistics.

```
$> make stats
```


## Connecting to Stream
Once the container is running, connect to the network stream with a multimedia player like [VLC](http://www.videolan.org/) from the same or another
computer on your network.

```
http://<DOCKER_HOST>:6878/ace/getstream?id=<CONTENT_ID>
```
