#!/bin/bash

wikidir=/Users/wmusial/wiki

if [ $# -eq 1 ]; then
  if [ ! -f $1 ]; then
    echo "Supplied file not found -- $1"
    exit 
  fi
  fname=$1
  fdir=$(dirname "$fname")
  fname=$(basename "$fname")
  fbase="${fname%.*}"
  fext="${fname##*.}"
  cat $wikidir/tex/pre.tex $fname $wikidir/tex/post.tex > $wikidir/tmp/$fbase.tex
  

fi
