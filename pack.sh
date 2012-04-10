#!/bin/sh

rm -f wot.zip

zip -r wot . -x manifest.xml pack.sh ".git/*" ".idea/*" "*.DS_Store" .gitignore
