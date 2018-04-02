#!/bin/bash

# The following ENV vars should be set in the Codenvy Workspace
# DSPACE_SRC
# BASE_BRANCH
#
# This script takes an ordered list of pr numbers to merge into a local branch named "test-pr"

function die {
    echo $1
    exit 10
}

cd ${DSPACE_SRC} || die "src dir ${DSPACE_SRC} does not exist"
git fetch --all

git checkout -- .

git checkout $BASE_BRANCH

git branch -D test-pr

git checkout -b test-pr

for pr in $*
do
git merge origin/pr/$pr
done