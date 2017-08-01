#!/bin/bash

set -e
set -x
export DEVPI_SERVER_DIR=${DEVPI_SERVER_DIR:-/opt/devpi}
export ROOT_PASSWD=${DEVPI_ROOT_PASSWORD:-`openssl rand -base64 16`}

init_devpi()
{
	echo "Initializing devpi server"
	echo "Devpi root password ${ROOT_PASSWD}"
	devpi-server --init --serverdir $DEVPI_SERVER_DIR
	devpi-server --start --serverdir $DEVPI_SERVER_DIR
	devpi use http://localhost:3141
	devpi login root --password=''
	devpi user -m root password=${ROOT_PASSWD}
	devpi-server --stop --serverdir $DEVPI_SERVER_DIR
}

if [[ ! -f $DEVPI_SERVER_DIR/.serverversion ]]; then
	init_devpi
fi

devpi-server --serverdir ${DEVPI_SERVER_DIR} $@
