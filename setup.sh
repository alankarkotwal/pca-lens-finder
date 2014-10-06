#!/bin/bash

direc=${PWD##*/}
echo $direc

if [ "$direc" != "pca-lens-finder" ]
then
	echo "Go to the pca-lens-finder folder and execute the script."
		exit 0
else
	echo "Setting up..."
fi

mkdir -p images
cd images

wget http://metcalf1.bo.astro.it/~bmetcalf/Data/21_9_2014/blf_kids_gband.tar.gz
mv blf_kids_gband.tar.gz images.tar.gz
gunzip images.tar.gz
tar -xvf images.tar
rm -f images.tar

echo "All done!"
