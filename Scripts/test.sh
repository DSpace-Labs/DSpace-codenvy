#!/bin/bash
cd /home/user/dspace-src/DSpace
mvn package
# mvn package -Dmirage2.on=true
cd dspace/target/dspace-installer

