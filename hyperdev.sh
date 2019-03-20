#!/bin/sh

envsubst < ${GOGS_CUSTOM}/conf/app.ini.orig > ${GOGS_CUSTOM}/conf/app.ini
envsubst < ${GOGS_CUSTOM}/conf/auth.d/ldap_bind_dn.conf.orig > ${GOGS_CUSTOM}/conf/auth.d/ldap_bind_dn.conf
/app/gogs/docker/start.sh "$@"
