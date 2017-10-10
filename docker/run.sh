#!/bin/bash

# Set some defaults if they are not provided
if [ -z "$POSTGRES_PORT_5432_TCP_ADDR" ]; then
	export POSTGRES_PORT_5432_TCP_ADDR=192.168.59.103
fi

if [ -z "$POSTGRES_PORT_5432_TCP_PORT" ]; then
    export POSTGRES_PORT_5432_TCP_PORT=5432
fi

if [ -z "$DB_ENV_POSTGRES_USER" ]; then
    export DB_ENV_POSTGRES_USER=porta
fi

if [ -z "$DB_ENV_POSTGRES_PASSWORD" ]; then
    export DB_ENV_POSTGRES_PASSWORD=porta
fi

export DB_ENV_POSTGRES_HOST="jdbc:postgresql://${POSTGRES_PORT_5432_TCP_ADDR}:${POSTGRES_PORT_5432_TCP_PORT}/ups"

echo "CONNECTION TO DB: $DB_ENV_POSTGRES_HOST with user: $DB_ENV_POSTGRES_USER"

cat >/config.properties <<EOF
zookeeper.connectString=${ZOO_PORT_2181_TCP_ADDR}:${ZOO_PORT_2181_TCP_PORT}
zookeeper.myURI=${MYURI}

#Postgresql, works with a linked postgres database with alias 'db', with user and database named 'translation'
db.url=${DB_ENV_POSTGRES_HOST}
db.user=${DB_ENV_POSTGRES_USER}
db.pass=${DB_ENV_POSTGRES_PASSWORD}

EOF


/opt/jetty/bin/jetty.sh run
