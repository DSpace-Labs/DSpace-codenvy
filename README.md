
# DSpace on Codenvy
This is a fork of the DSpace 6.2 (non-source) release: https://github.com/DSpace/DSpace/releases/tag/dspace-6.2

This repository will also contain the [configuration files and source Dockerfiles for use on the Codenvy service](CodenvyConfig/Readme.md).

The repository will also contain instructions on how to configure a Codenvy workspace using this code.

## Using Codenvy
Codenvy offers a free tier that includes a server with 3GB of memory.  The server will stay alive for 15 minutes of inactivity.

With a paid plan, more memory is available.  Servers running within a paid plan stay alive for 4 hours of inactivity.

## Try it yourself
A [local.cfg](dspace/config/local.cfg) file has been pre-configured for use on Codenvy.  This file will be installed from Docker.

It is possible to give Codenvy access to your GitHub credentials.  In this example, a repository has been cloned without read/write credentials.  The project should discuss our advice on enabling write access.

Once you have registered for Codenvy, click [here](https://codenvy.io/dashboard/#/load-factory/factoryb06wbz82fomzuvzq) to replicate the sample DSpace workspace.

## Demonstration Video 
[![Demonstration Video](https://i.ytimg.com/vi/LX6RfNr0bLk/hqdefault.jpg)](https://www.youtube.com/watch?v=LX6RfNr0bLk)


Note: Codenvy will deploy apps over http (not https).  
  - XMLUI, JSPUI, and OAI will be accessible.  
  - The [REST web.xml file](dspace/modules/rest/src/main/webapp/WEB-INF/web.xml#L62-L74) has been modified to disable https on Codenvy.

<hr/>
[DSpace README](https://github.com/DSpace/DSpace/blob/master/README.md)
<hr/>
