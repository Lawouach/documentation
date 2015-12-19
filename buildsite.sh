#!/bin/bash

rm -rf tempdir

git clone -b gh-pages git@github.com:microserviceux/documentation.git tempdir

MYDIR=`pwd`

find -iname '*.adoc' -execdir asciidoctor {} \;

rsync -av --exclude='tempdir/' --include='*.adoc' . tempdir/


cd tempdir

git add .
git status
git commit -m "Update docs"
git push origin -f gh-pages

cd ..

rm -rf tempdir

find -iname '*.html' -execdir rm {} \;
