#!/bin/bash

find . -type d -print0 | xargs -0 -L1 sh -c 'cd "$0" && pwd && rm *.html'
git add --all . 
git commit -m "Remove stale html"
git push origin master

find . -type d -print0 | xargs -0 -L1 sh -c 'cd "$0" && pwd && asciidoctor *.adoc'

git checkout -f gh-pages
git add .
git commit -m "Update docs"
git push origin gh-pages
git checkout master
