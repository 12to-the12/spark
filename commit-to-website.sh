#!/bin/bash

cd $PROJECTS_DIR/spark/
git add . && git commit -m "$1" && git push origin main

rsync -aPh ./spark $WEBDEV_PROJECTS_DIR/personal-website/dist/spark
rsync -aPh ./fedora $WEBDEV_PROJECTS_DIR/personal-website/dist/fedora


cd $WEBDEV_PROJECTS_DIR/personal-website/
git add . && git commit -m "$1" && git push origin main
