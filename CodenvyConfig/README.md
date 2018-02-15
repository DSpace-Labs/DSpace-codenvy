# Codenvy Configuration for DSpace

DSpace runs as a multi-machine instance on Codenvy.

- db - postgres database server
- dev-machine - code server, build server, tomcat server

## Docker file configurations

- [db](db/Dockerfile)
  - will be published as Docker config: terrywbrady/dspacedb
- [dev-machine](dev-machine/Dockerfile)
  - published as Docker config: terrywbrady/dspace

## Codenvy Configuration Notes
