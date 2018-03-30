# Script Notes

## Image Notes
- add ant to path
- add dspace_install/bin to path
- custom tasks
  - chmod 744 /projects/DSpace-Codenvy/Scripts/*.sh
  - initRepo();echo ${server.8080}
  - buildRepo()
  - start tomcat
  - echo ${server.8080}

## ENV VARIABLES

- BASE_BRANCH
  - dspace-6_x
  - master
- DSPACE_SRC
  - /projects/DSpace
  - /home/user/dspace_src
- DSPACE_INSTALL
  - /home/user/dspace
- LOAD_DIR
  - /projects/DSpace-Codenvy/TestData
- LOCAL_CFG
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

## INIT SCRIPT

- If DSPACE_SRC does not exist
  - mkdir $DSPACE_SRC
  - cd $(dirname $DSPACE_SRC)
  - git clone https://github.com/DSpace/DSpace.git
  - git checkout BASE_BRANCH
- cd $DSPACE_SRC
- cp build.properties / load.cfg if needed
  - If DSPACE_VER = 5
      cp $LOCAL_CFG DSPACE_SRC/local.cfg
    else
      cp $LOCAL_CFG DSPACE_SRC/build.properties
- mvn $MVN_TARGET
- cd dspace/target/dspace_target
- stop tomcat if needed
- if $1 is true
  start tomcat

## Start tomcat
- start
- echo

## PR test