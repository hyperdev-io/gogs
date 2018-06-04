FROM gogs/gogs:0.11.43

RUN apk --update --no-cache add gettext

ENV GOGS_CUSTOM /app/gogs

ADD app.ini $GOGS_CUSTOM/conf/app.ini
ADD ldap_bind_dn.conf $GOGS_CUSTOM/conf/auth.d/ldap_bind_dn.conf
ADD hyperdev.sh /app/gogs/docker/hyperdev.sh

ENTRYPOINT ["/app/gogs/docker/hyperdev.sh"]
