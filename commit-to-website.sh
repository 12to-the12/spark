#!/bin/bash

cd $PROJECTS_DIR/spark/
git add . && git commit -m "$1" && git push origin main

rsync -aPh ./spark $WEBDEV_PROJECTS_DIR/personal-website/dist/spark
rsync -aPh ./fedora $WEBDEV_PROJECTS_DIR/personal-website/dist/fedora
rsync -aPh ./sd-fedora $WEBDEV_PROJECTS_DIR/personal-website/dist/sd-fedora
rsync -aPh ./sd-mac $WEBDEV_PROJECTS_DIR/personal-website/dist/sd-mac



cd $WEBDEV_PROJECTS_DIR/personal-website/
git add . && git commit -m "$1" && git push origin main
