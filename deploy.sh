#!/bin/bash
set -e
message=$1
jekyll build
cd ./source 
git add ./ 
git commit -m '$message'
git push origin gh-pages