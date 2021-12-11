[hub]: https://hub.docker.com/r/spritsail/velocity
[drone]: https://drone.spritsail.io/spritsail/velocity

# [Spritsail/Velocity][hub]

[![Docker Pulls](https://img.shields.io/docker/pulls/spritsail/velocity.svg)][hub]
[![Docker Stars](https://img.shields.io/docker/stars/spritsail/velocity.svg)][hub]
[![Build Status](https://drone.spritsail.io/api/badges/spritsail/velocity/status.svg)][drone]

An Alpine Linux based Dockerfile to run the Minecraft server proxy Velocity
It expects a volume to store data mapped to `/config` in the container. Enjoy!


## Example run command
```
docker run -d --restart=on-failure:10 --name velocity -v /volumes/velocity:/config -p 25577:25577 spritsail/velocity:latest
```
