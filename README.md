
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

Once you have registered for Codenvy, click [here](https://codenvy.io/dashboard/#/load-factory/factoryae32f6c71pprrp4g) to replicate the sample DSpace workspace.

The following [Video](https://youtu.be/LX6RfNr0bLk) illustrates how to use the service.

<hr/>
DSpace README below...
<hr/>

# DSpace

[![Build Status](https://travis-ci.org/DSpace/DSpace.png?branch=master)](https://travis-ci.org/DSpace/DSpace)

[DSpace Documentation](https://wiki.duraspace.org/display/DSDOC/) | 
[DSpace Releases](https://github.com/DSpace/DSpace/releases) |
[DSpace Wiki](https://wiki.duraspace.org/display/DSPACE/Home) | 
[Support](https://wiki.duraspace.org/display/DSPACE/Support)

DSpace open source software is a turnkey repository application used by more than 
1000+ organizations and institutions worldwide to provide durable access to digital resources.
For more information, visit http://www.dspace.org/

## Downloads

The latest release of DSpace can be downloaded from the [DSpace website](http://www.dspace.org/latest-release/) or from [GitHub](https://github.com/DSpace/DSpace/releases).

Past releases are all available via GitHub at https://github.com/DSpace/DSpace/releases

## Documentation / Installation

Documentation for each release may be viewed online or downloaded via our [Documentation Wiki](https://wiki.duraspace.org/display/DSDOC/). 

The latest DSpace Installation instructions are available at:
https://wiki.duraspace.org/display/DSDOC6x/Installing+DSpace

Please be aware that, as a Java web application, DSpace requires a database (PostgreSQL or Oracle) 
and a servlet container (usually Tomcat) in order to function.
More information about these and all other prerequisites can be found in the Installation instructions above.

## Contributing

DSpace is a community built and supported project. We do not have a centralized development or support team, 
but have a dedicated group of volunteers who help us improve the software, documentation, resources, etc.

We welcome contributions of any type. Here's a few basic guides that provide suggestions for contributing to DSpace:
* [How to Contribute to DSpace](https://wiki.duraspace.org/display/DSPACE/How+to+Contribute+to+DSpace): How to contribute in general (via code, documentation, bug reports, expertise, etc)
* [Code Contribution Guidelines](https://wiki.duraspace.org/display/DSPACE/Code+Contribution+Guidelines): How to give back code or contribute features, bug fixes, etc.
* [DSpace Community Advisory Team (DCAT)](https://wiki.duraspace.org/display/cmtygp/DSpace+Community+Advisory+Team): If you are not a developer, we also have an interest group specifically for repository managers. The DCAT group meets virtually, once a month, and sends open invitations to join their meetings via the [DCAT mailing list](https://groups.google.com/d/forum/DSpaceCommunityAdvisoryTeam).

We also encourage GitHub Pull Requests (PRs) at any time. Please see our [Development with Git](https://wiki.duraspace.org/display/DSPACE/Development+with+Git) guide for more info.

In addition, a listing of all known contributors to DSpace software can be
found online at: https://wiki.duraspace.org/display/DSPACE/DSpaceContributors

## Getting Help

DSpace provides public mailing lists where you can post questions or raise topics for discussion.
We welcome everyone to participate in these lists:

* [dspace-community@googlegroups.com](https://groups.google.com/d/forum/dspace-community) : General discussion about DSpace platform, announcements, sharing of best practices
* [dspace-tech@googlegroups.com](https://groups.google.com/d/forum/dspace-tech) : Technical support mailing list. See also our guide for [How to troubleshoot an error](https://wiki.duraspace.org/display/DSPACE/Troubleshoot+an+error).
* [dspace-devel@googlegroups.com](https://groups.google.com/d/forum/dspace-devel) : Developers / Development mailing list

Additional support options are listed at https://wiki.duraspace.org/display/DSPACE/Support

DSpace also has an active service provider network. If you'd rather hire a service provider to 
install, upgrade, customize or host DSpace, then we recommend getting in touch with one of our 
[Registered Service Providers](http://www.dspace.org/service-providers).

## Issue Tracker

The DSpace Issue Tracker can be found at: https://jira.duraspace.org/projects/DS/summary

## License

DSpace source code is freely available under a standard [BSD 3-Clause license](https://opensource.org/licenses/BSD-3-Clause).
The full license is available at http://www.dspace.org/license/
