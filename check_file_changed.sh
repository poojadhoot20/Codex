#!/bin/sh

check_file_changed()
{ if echo "$(git diff --name-only $TRAVIS_COMMIT_RANGE)" | grep -q $1 ; then return 0; else return 1; fi	}

check_file_changed
echo $?
