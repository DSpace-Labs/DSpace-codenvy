#!/bin/bash

function die {
    echo $1
    exit 10
}

# Set the following
# DSPACE_SRC=/home/user/dspace-src/DSpace
# DSPACE_INSTALL=/home/user/dspace
# BASE_BRANCH=dspace-6_x
# LOAD_DIR=/projects/DSpace-codenvy/TestData

SRCROOT=$(dirname $DSPACE_SRC)
SCRIPTS=/projects/DSpace-codenvy/Scripts
TOMCAT=/home/user/tomcat8/bin/catalina.sh

if [ ! -e ${DSPACE_SRC} ]
then
  if [ ! -e $SRCROOT ]
  then 
    mkdir -p ${SRCROOT} || die "cannot mkdir ${SRCROOT}"
  fi
  
  cd ${SRCROOT}
  git clone https://github.com/DSpace/DSpace.git || die "cannot clone DSpace here"
  cd $DSPACE_SRC
  git checkout $BASE_BRANCH || die "cannot checkout $BASE_BRANCH"
fi

${SCRIPTS}/build.sh || die "build failed"

${DSPACE_INSTALL}/bin/dspace create-administrator -e test@test.edu -f Admin -l User -p admin -c en || die "create admin failed"

if [ -e $LOAD_DIR ]
then
  cd $LOAD_DIR
  for file in COMM* COLL* ITEM*; 
  do 
  ${DSPACE_INSTALL}/bin/dspace packager -r -t AIP -e test@test.edu -f -u $file
  done
fi

${TOMCAT} start

