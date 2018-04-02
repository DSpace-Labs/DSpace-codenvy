## ENV Variables set in Codenvy Stack

- DSPACE_SRC
  - /projects/DSpace
    - If you intend to modify code, you will add the DSpace code base as a project and set this variable.
    - Note about Codenvy RAM
      - DSpace "release" code requires 3GB RAM
      - DSpace "src" code requires 5-6GB RAM
  - /home/user/dspace_src
    - Use this value to clone DSpace locally (for testing rather than code editing)
- BASE_BRANCH
  - If DSpace code will be cloned, define the branch to checkout after cloning
  - dspace-6_x
  - master
- DSPACE_INSTALL
  - /home/user/dspace
- LOAD_DIR
  - Use this variable to load a directory with Collection and Item AIP files
  - /projects/DSpace-Codenvy/TestData
- LOCAL_CFG
  - Use this variable to set the appropriate local overrides
  - /projects/DSpace-Codenvy/local.cfg
  - /projects/DSpace-Codenvy/build.properties
  - blank
- MVN_TARGET
  - package
  - package -Dmirage2.on=true
- DSPACE_VER
  - 5 (cp to build.properties)
  - 6
  - 7

## Other Useful Commands

  - git config --add remote.DSpace.fetch "+refs/pull/*/head:refs/remotes/origin/pr/*"


