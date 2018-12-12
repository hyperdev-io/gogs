FROM gogs/gogs:0.11.79

RUN apk --update --no-cache add gettext

ENV GOGS_CUSTOM /app/gogs/custom
ENV GOGS_LDAP_PORT 389
ENV GOGS_POSTGRES_HOST db
ENV GOGS_POSTGRES_PORT 5432
ENV GOGS_POSTGRES_DB_NAME gogs
ENV GOGS_POSTGRES_USER gogs
ENV GOGS_POSTGRES_PASSWORD gogs

ADD app.ini $GOGS_CUSTOM/conf/app.ini
ADD ldap_bind_dn.conf $GOGS_CUSTOM/conf/auth.d/ldap_bind_dn.conf
ADD hyperdev.sh /app/gogs/docker/hyperdev.sh

ENTRYPOINT ["/app/gogs/docker/hyperdev.sh"]
