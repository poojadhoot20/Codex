#!/bin/bash

check_file_changed() {
	if $(git whatchanged -n 1 | grep -q "$1");
	then
		cp "nomad_jobs/$1" ".travisci/upload_activation_s3/$(cut -d"." -f1<<<$1)_`date -I`_$TRAVIS_BUILD_NUMBER.$(cut -d"." -f2<<<$1)"
		return 100;
	else
		return 99;

	fi	
}

check_file_changed "$@"
echo $?
