# devpi-docker

Docker deployment of the [devpi](http://doc.devpi.net/latest/) PyPI server.
Automated builds are hosted at hub.docker.com/danielunderwood/devpi

## Running

Run with `docker run -p 3141:3141 --name devpi danielunderwood/devpi` to pull
from docker hub or build manually with
`docker build -t danielunderwood/devpi .`.

The `ENTRYPOINT` instruction is used, so optional arguments to `devpi-server`
may be supplied after the `docker run` command. Particularly, you may want to
use `--host 0.0.0.0` to listen for external connections.

