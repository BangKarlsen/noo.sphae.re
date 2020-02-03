#!/bin/bash

# Compile new site
echo 'Building new site...'
clj -Assg
echo 'Done'

rm -rf docs/*

# Generate CNAME file for github custom domain
# echo -n requires bash or similar (not sh)
echo -n 'noo.sphae.re' > docs/CNAME

cp -r dist/* docs/

# Add, commit and push
git status -s
git add docs/*
git commit -m 'Publish new site'
echo 'Pushing new site to remote...'
git push
echo "We're live at https://noo.sphae.re"
