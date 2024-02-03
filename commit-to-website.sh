#!/bin/bash

cd $PROJECTS_DIR/spark/
git add ./* && git commit -m "$1" && git push

rsync -aPh ./spark $WEBDEV_PROJECTS_DIR/personal-website/dist/spark

cd $WEBDEV_PROJECTS_DIR/personal-website/
git add ./* && git commit -m "$1" && git push
