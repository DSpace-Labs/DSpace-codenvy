---
## Running DSpace on Codenvy

- Terry Brady, Georgetown University Library
- https://github.com/terrywbrady/info

+++
## Presentation with demonstration video
![Full Video](https://www.youtube.com/embed/Thdv7l-yHco?start=1190)

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
  - Sufficient for running DSpace in tomcat
    - and for loading "DSpace Release" code into Che
  
+++

## Codenvy Paid Tier
  - Workspaces shut down after 4 hours of inactivity
  - Usable for development
  - At 6GB, seems to be sufficient for running DSpace in tomcat
    - and for loading "DSpace src" code into Che  
    - Have not yet tested with 5GB
  
+++

## Codenvy for Teams

- Have not explored this
  - Pricing as $20/user/month
  - Unclear how much RAM is allocated in this instance
- Could there be an opportunity to make the service available to the DSpace developer community?

+++

## (For Time) Launch DSpace Workspace Factory

Once you have registered for Codenvy, click [here](https://codenvy.io/dashboard/#/load-factory/factoryb06wbz82fomzuvzq) to repeat this demo.

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

- A list of available commands can be defined within a stack.
- These commands are visible to the user.
- When a command is running, a preview link can be exposed for that command.
- This is the simplest way to find the public URL for a tomcat instance running inside of Che.

+++

## Che Workspace
A Che workspace is a virtual machine that hosts Che Stacks

- Built from a Che stack
- References code "projects"
- Has RAM allocation
- Is started and stopped

+++

## Che Workspace Snaptshots
- Snapshots are saved on shutdown
  - Still exploring how to configure Docker volumes within a workspace
- Project directories are refreshed from git on workspace startup

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
@[10-11](This defines the dependencies between the images)

+++

## DSpace DB image

_This was derived from https://github.com/DSpace-Labs/dspace-dev-docker/tree/master/postgres_

- This runs the official postgres docker image and ensures that pgcrypto has been loaded.
- Note: the environment variables could be externalized to the Che configuration
- PROPOSAL: DSpace should publish some form of this as a docker image.

+++?code=presentation/dspace-codenvy-pgcrypto
@[8](script to install pgcrypto)

+++?code=presentation/install-pgcrypto.sh
@[4](Call psql)
@[8](Install pgcrypto)

+++

## DSpace Dev Machine Image

+++?code=presentation/dspace-codenvy-tomcat
@[1](Built from eclipse/ubuntu_jdk8)
@[1](Image contains Java, Maven, Tomcat)
@[1](I think the image contains Che)
@[2-4](Exposes the ports used by the Che editor)
@[6-12](Intall Ant on the dev machine)
@[14-15](Build runtime directories)
@[14-15](Files in /home/user seem to persist within the workspace)
@[17-24](Symlink DSpace 6 and 7 webapp directories in tomcat webapp directories)
@[26](Provide default memory allocation for command line tasks)

--- 

## DSpace Workspace Config

+++?image=presentation/ws-machine.png

+++?image=presentation/ws-projects.png

+++?image=presentation/myworkspaces.png

---

## DSpace Che Project

- Populated from dspace-6_2-release
  - https://github.com/DSpace-Labs/DSpace-codenvy/tree/master/dspace
  - Will be migrating this to a new repo [DSpace-Labs/DSpace-rel-demo](https://github.com/DSpace-Labs/DSpace-rel-demo)
    - ["Making DSpace Your Own" Webinar](http://www.duraspace.org/news/registration-open-%E2%80%9Cmaking-dspace-your-own%E2%80%9D-webinar) on Apr 27 
- Overrides to support Codenvy - via module overlay
  - [Enable rest to run over http](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/dspace/modules/rest/src/main/webapp/WEB-INF/web.xml#L62-L74)
  - [Remove SOLR localhost restriction](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/dspace/modules/solr/src/main/webapp/WEB-INF/web.xml#L86-L91)

+++ 

## local.cfg for Che

- Until I figure out how to declare volumes in the Che config, 
  - /home/user seems to be the only writable directory within the workspace
- Postgres runs in a separate docker image, so localhost cannot be used
  - https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/CodenvyConfig/local.cfg

+++?code=CodenvyConfig/local.cfg
@[31](Set output directory)
@[75](Refrence db machine by hostname)
@[89](Set obvious password)

---

## Sample Data in the DSpace-codenvy project

- Some very simple test data to load into a newly created instance.
  - [TestData](TestData)

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
- Integrate Mirage2 build dependencies to Docker configs
- Configure code-style checks for DSpace 7
  - Does not seem possible in Che
