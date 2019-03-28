# HyperDev GOGS
GOGS image for Hyperdev.io, configurable via env vars

## Available env vars
For gogs itself:
- GOGS_DOMAIN `gogs.test.dashboard.hyperdev.cloud`: you should set this to `"${HYPERDEV}"`
- GOGS_HTTP_PORT `3000`: port gogs will listen on within the container, also used for http git clone url

For gogs' connection to the postgres DB
- GOGS_POSTGRES_HOST `db`
- GOGS_POSTGRES_PORT `5432`
- GOGS_POSTGRES_DB_NAME `gogs`
- GOGS_POSTGRES_USER `gogs`
- GOGS_POSTGRES_PASSWORD `gogs`

For gogs' connection to LDAP
- GOGS_LDAP_HOST: set this to `"ldap.${HYPERDEV_PROJECT}.hyperdev.cloud"`
- GOGS_LDAP_PORT `389`: you shoudn't need to changes this
- GOGS_LDAP_BIND_DN: set this to `"cn=readonly,dc=${HYPERDEV_PROJECT},dc=hyperdev,dc=cloud"`
- GOGS_LDAP_BIND_PASSWORD `"readonly"`: you shouldn't need to change this.
- GOGS_LDAP_USER_BASE: you should set this to `"dc=${HYPERDEV_PROJECT},dc=hyperdev,dc=cloud"`

## Volumes that need to be persisted
- /data

## To configure Jenkins <-> Gogs integration
- Add Gogs plugin to Jenkins and restart Jenkins
- Create an SSH key pair:
`ssh-keygen -t rsa -b 4096 -C "jenkins@mail.project.hyperdev.cloud"`
- Create new Jenkins credentials with the private key
  - domain = Global
  - kind = ssh username with private key
- Add the public key to Gogs for the Jenkins user
- Add a webhook to the Gogs repo at
`http://www.gogs.project-name.hyperdev.cloud:3000/appstarter/appstarter/settings/hooks`
to
`http://www.jenkins.project-name.hyperdev.cloud:8080/gogs-webhook/?job=pipelineName`
- Test the delivery (button on the bottom of the webhook screen)
