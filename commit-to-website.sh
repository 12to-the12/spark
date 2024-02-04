#!/bin/bash

cd $PROJECTS_DIR/spark/
git add . && git commit -m "$1" && git push origin main

function syncfile() {
    rsync -aPh ./$1 $WEBDEV_PROJECTS_DIR/personal-website/dist/$1

}
syncfile spark
syncfile fedora
syncfile sd-fedora
syncfile sd-mac
syncfile test
syncfile test.html




cd $WEBDEV_PROJECTS_DIR/personal-website/
git add . && git commit -m "$1" && git push origin main
