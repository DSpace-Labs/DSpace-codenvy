---
## Running DSpace on Codenvy

- Terry Brady, Georgetown University Library
- https://github.com/terrywbrady/info

---
## What is Codenvy

https://codenvy.com/

- Cloud-based development environment
- Uses [Eclipse Che](https://www.eclipse.org/che/)
  - browser-based IDE
    - the IDE seems to run in a Docker Image (from eclipse/*)
  - execution environments running inside of Docker Images
  
+++

## Codenvy Service

- Free account tier (up to 3GB RAM)
- Paid account tier ($10/mo per additional GB)
- Paid account for teams

+++

## Codenvy Free Tier
  - Workspaces shut down after 15 min of inactivity
  - Running applications are internet accessible
  - Usable as a trial/experiment 
    - probably not reliable for meaningful development
  - Seems to be sufficient for running "DSpace release" code
  
+++

## Codenvy Paid Tier
  - Workspaces shut down after 4 hours of inactivity
  - Usable for development
  - At 4GB, ieems to be sufficient for running "DSpace src" code  
  - Have not yet tested with 5GB
  
+++

## Codenvy for Teams

- Have not explored this
- Could there be an opportunity to make the service available to the DSpace developer community?

--- 

## Eclipse Che Concepts

- Stacks
- Workspaces
- Factories

+++
## Che Stacks

- Stacks
  - Selectable Docker images for running code
  - Single machine or multi-machine
    - At least one machine needs to contain Eclipse Che (eclipse/*) for the IDE
    - MySQL support is available by default

+++?image=presentation/stacks.png

+++

## Stack Commands

A list of available commands can be defined within a stack.
These commands are visible to the user.
When a command is running, a preview link can be exposed for that command.
This is the simplest way to file the public URL for a tomcat instance running inside of Che.

+++

## Che Workspace
A Che workspace is a virtual machine that hosts Che Stacks

- Built from a Che stack
- References code "projects"
- Has RAM allocation
- Is started and stopped
- Snapshots are saved - this is how data is persisted from session to session

+++

## Che Factory

A factory provides a single-click replication of a workspace.

--- 

## DSpace Configuration in Code Envy

+++

## DSpace Che Stack
A Codenvy Stack contains several components including a docker compose file.

        "recipe": {
          "type": "compose",
          "content": "services:\n db:\n  image: 'terrywbrady/dspacedb:latest'\n  mem_limit: 536870912\n  environment:\n   PGDATA: /home/user/pgdata\n dev-machine:\n  image: 'terrywbrady/dspace:latest'\n  mem_limit: 2684354560\n  depends_on:\n   - db\n",
          "contentType": "application/x-yaml"
        }

Volumes cannot be declared in the compose file.

+++
## Che Docker Compose

        services:
          db:
            image: 'terrywbrady/dspacedb:latest'
            mem_limit: 536870912
            environment:
              PGDATA: /home/user/pgdata
          dev-machine:
            image: 'terrywbrady/dspace:latest'
            mem_limit: 2684354560
            depends_on:
            - db
@[2-6](Database Image)
@[6](Postgres data is written to the workspace rather than in transient storage in the docker image)
@[7-11](Dev Machine Image - for Che and Tomcat)
@[11](Thie defines the dependencies between the images)

+++

## DSpace DB image

_This was derived from https://github.com/DSpace-Labs/dspace-dev-docker/tree/master/postgres_

This runs the official postgres docker image and ensures that pgcrypto has been loaded.

Note: the environment variables could be externalized to the Che configuraiton

PROPOSAL: DSpace should publish some form of this as a docker image.

+++?code=CodenvyConfig/db/Dockerfile
@[8](install pgcrypto)

+++?code=CodenvyConfig/db/install-pgcrypto.sh

+++

## DSpace Dev Machine Image

+++?code=CodenvyConfig/dev-machine/Dockerfile
@[1](Built from eclipse/ubuntu_jdk8)
@[1](Image contains Java, Maven, Tomcat)
@[1](I think the image contains Che)
@[2-4](Exposes the ports used by the Che editor)
@[6-12](Intall Ant on the dev machine)
@[14-15](Build runtime directories)
@[14-15](Files in /home/user seem to persist within the workspace)
@[17-24](Symlink DSpace 6 and 7webapp directories in tomcat webapp directories)
@[26](Provide default memory allocation for command line tasks)

--- 

## DSpace Workspace Config

+++?image=presentation/ws-machine.png

+++?image=presentation/ws-projects.png

---

## DSpace Che Project

- Populated from dspace-6_2-release
  - https://github.com/DSpace-Labs/DSpace-codenvy/tree/master/dspace
- Overrides to support Codenvy - via module overlay
  - [Enable rest to run over http](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/dspace/modules/rest/src/main/webapp/WEB-INF/web.xml#L62-L74)
  - [Remove SOLR localhost restriction](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/dspace/modules/solr/src/main/webapp/WEB-INF/web.xml#L86-L91)

+++ 

## local.cfg for Che

/home/user seems to be the only writable directory (I think)

+++?code=CodenvyConfig/local.cfg
@[31](Set output directory)
@[75](Refrence db machine by hostname)
@[89](Set obvious password)

---

## Commands Palette for DSpace

+++?code=CodenvyConfig/dspace-with-db.stack.json
@[71-74](Git refresh - not sure if this happens automatically)
@[77-80](Install local.cfg)
@[83-86](Maven build - this might be easier to do from the terminal)
@[89-92](Ant deploy - this might be esier to do in the command line)
@[95-98](Create default administrator with predictable password)
@[101-106](Start tomcat and display the preview link)
@[109-112](Load a predictable set of test data)
@[65-68](Repair sequences after AIP ingest - run against the db server)

---

## Demonstration

---

## Possibilities

- Fast on-boarding of new contributors
- Sharable test environments
- Dev environment requiring only a browser
- Auto-build servers with PR code

---

## TODO's

- Figure out how to declare volumes in [Che](https://www.eclipse.org/che/docs/6/che/docs/volumes.html)
- Integrate Mirage2 build steps
- Determine the optimal RAM for DSpace contributions

