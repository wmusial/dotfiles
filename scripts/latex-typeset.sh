#!/bin/bash

echo ""
echo "----- LaTeX Typeset ------"

fname=""

if [ $# -eq 1 ]; then
  # filename in argument
  if [ ! -f $1 ]; then
    echo "Supplied file not found -- $1"
    exit 
  fi
  # file exists
  fname=$1
else 
  # check for files in the current directory
  nofiles=`ls *.tex | wc -l`
  if [ "$nofiles" -gt "1" ]; then
    i=1
    default=1
    for file in *.tex
    do
      echo "$i  $file"
      i=$(($i+1))
      f=$file
    done
    echo "choose file to typeset:"
  else   
    # only one file found, grab it
    for file in *.tex
    do
      fname=$file
    done
  fi
fi


# process the file
fdir=$(dirname "$fname")
fname=$(basename "$fname")
fbase="${fname%.*}"
fext="${fname##*.}"

echo "processing file $fdir/$fname"

mkdir /tmp/latex
latexcmd="pdflatex -file-line-error -halt-on-error -output-directory=/tmp/latex -interaction nonstopmode $fdir/$fbase.tex"
echo "> $latexcmd"
output=$($latexcmd)

echo "$output" | grep "This is"
echo "$output" | grep "Warning"
echo "$output" | grep "Output"

if [ "$?" -eq 0 ]; then
  #mv /tmp/latex/$fbase.pdf $fdir/
  open "/tmp/latex/$fbase.pdf"
else
  echo "$output" | grep -E ":[0-9]*:"
fi
