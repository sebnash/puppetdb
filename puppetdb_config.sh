#!/bin/sh

cat > /etc/puppetlabs/puppetdb/conf.d/database.ini <<-EOINI
	[database]
	classname = org.postgresql.Driver
	subprotocol = postgresql
	subname = $POSTGRES_PORT/$POSTGRES_ENV_POSTGRES_USER
	username = $POSTGRES_ENV_POSTGRES_USER
EOINI
