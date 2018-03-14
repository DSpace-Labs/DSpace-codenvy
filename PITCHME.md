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