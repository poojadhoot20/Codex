#!/bin/bash

check_file_changed()
{
        pwd
	echo "In the script"	
	if $(git whatchanged -n 1 | grep -q "$1");
	then
		cp "nomad_jobs/$1" ".travisci/upload_activation_s3/$(cut -d"." -f1<<<$1)_`date -I`_$TRAVIS_BUILD_NUMBER.$(cut -d"." -f2<<<$1)"
		echo "Coding in echo"
		return 0;
	else
		return 1;

#	if $(git whatchanged -n 1 | grep -q "$1") ;
#		pwd
#		echo "Life in Pune"
#		#cp "../nomad_jobs/$1" ".travisci/upload_activation_s3/$(cut -d"." -f1<<<$1)_`date -I`_$TRAVIS_BUILD_NUMBER.$(cut -d"." -f2<<<$1)"
#		echo "Code is in if loop"
#		then return 0; 
#	else 
#		echo "Code is in else loop"
#		print "Code is in print loop"
#		return 1; 
	fi	
}

check_file_changed "$@"
echo $?

