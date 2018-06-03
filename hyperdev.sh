#!/bin/sh

envsubst < ${GOGS_CUSTOM}/conf/app.ini > ${GOGS_CUSTOM}/conf/app.ini
envsubst < ${GOGS_CUSTOM}/conf/auth.d/ldap_bind_dn.conf > ${GOGS_CUSTOM}/conf/auth.d/ldap_bind_dn.conf
/app/gogs/docker/start.sh $@
