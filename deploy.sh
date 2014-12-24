#!/bin/bash
set -e
message=$1
jekyll build
cd ./source 
git add ./ 
git commit -m "deploying new pages"
git push origin gh-pages