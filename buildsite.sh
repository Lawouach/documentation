#!/bin/bash

rm -rf tempdir

git clone -b gh-pages git@github.com:microserviceux/documentation.git tempdir

find . -type d -print0 | xargs -0 -L1 sh -c 'cd "$0" && pwd && asciidoctor -D tempdir *.adoc'

cd -v tempdir


git add .
git status
git commit -m "Update docs"
git push origin gh-pages

cd ..

rm -rf tempdir

