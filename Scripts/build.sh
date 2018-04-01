#!/bin/bash

DSPACE_SRC=/home/user/dspace_src
DSPACE_INSTALL=/home/user/dspace
LOCAL_CFG=/projects/DSpace-Codenvy/local.cfg
MVN_TARGET=package
MVN_TARGET=package -Dmirage2.on=true
DSPACE_VER=6
START_TOMCAT=$1

echo $START_TOMCAT
exit

cd ${DSPACE_SRC}
mvn package
# mvn package -Dmirage2.on=true
cd dspace/target/dspace-installer

