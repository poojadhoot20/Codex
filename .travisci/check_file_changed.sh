#!/bin/bash

check_file_changed()
{ 
	if $(git diff --name-only $TRAVIS_COMMIT_RANGE | grep -q "$1") ;
		cp "nomad_jobs/a.sh" ".travisci/upload_activation_s3/$(cut -d"." -f1<<<$1)_`date -I`_$TRAVIS_BUILD_NUMBER.$(cut -d"." -f2<<<$1)"
		then return 0; 
	else 
		return 1; 
	fi	
}

check_file_changed "$@"
echo $?

