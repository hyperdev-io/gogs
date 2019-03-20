# HyperDev GOGS
GOGS image for Hyperdev.io, configurable via env vars

## Available env vars
- GOGS_LDAP_HOST
- GOGS_LDAP_PORT
- GOGS_LDAP_BIND_DN
- GOGS_LDAP_BIND_PASSWORD
- GOGS_LDAP_USER_BASE
- GOGS_POSTGRES_HOST
- GOGS_POSTGRES_PORT
- GOGS_POSTGRES_DB_NAME
- GOGS_POSTGRES_USER
- GOGS_POSTGRES_PASSWORD
- GOGS_DOMAIN

## Volumes that need to be persisted
- /data
- /app/gogs/conf

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
