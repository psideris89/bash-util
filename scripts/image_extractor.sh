#!/bin/bash
# script that iterates over zip files and creates a new folder with all the
# .png files


DIR=`pwd`

cd $DIR
mkdir images_new

IMAGES_DIR=images_new
TEMP_DIR=temp

for arch in *zip; do
    echo
    echo "Processing archive: " $arch
    unzip -d $TEMP_DIR $arch > /dev/null

    for image in $(find $TEMP_DIR -type f -name "*.png"); do
        cp $image $IMAGES_DIR
    done

    zip -rv $arch $IMAGES_DIR
    rm -r $IMAGES_DIR/*
    rm -r $TEMP_DIR

done

rm -r $IMAGES_DIR/

