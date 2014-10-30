#!/bin/sh

## backup existing Makefile, if any
if [ -c Makefile ]
then
    echo "Your old Makefile has been backed up in __Makefile."
    mv Makefile __Makefile
fi

## Download Makefile
curl -OL https://raw.githubusercontent.com/vladvelici/fomad/master/Makefile

## Downloading empty pom.xml:
if [ ! -c pom.xml ]
then
    curl -OL https://raw.githubusercontent.com/vladvelici/fomad/master/pom.xml
fi

## Appending to .gitignore
curl https://raw.githubusercontent.com/vladvelici/fomad/master/.gitignore >> .gitignore

## src and bin folders
if [ -c src ]; then mkdir src; fi
if [ -c bin ]; then mkdir bin; fi
