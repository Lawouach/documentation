#!/bin/bash

rm -rf tempdir

git clone -b gh-pages git@github.com:microserviceux/documentation.git tempdir

MYDIR=`pwd`

#find . -type d -print0 | xargs -0 -L1 sh -c 'cd "$0" && pwd && asciidoctor -D empdir *.adoc'
asciidoctor -D tempdir `find . -name *.adoc`

cd tempdir

git add .
git status
git commit -m "Update docs"
git push origin gh-pages

cd ..

rm -rf tempdir

