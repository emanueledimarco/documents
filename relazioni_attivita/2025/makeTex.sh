#! /bin/bash

what=$1
rm -f *.aux *.bbl *.blg *.log
echo "Starting..."
pdflatex $what
auxfiles=`ls *.aux`
for a in $auxfiles; do
    echo "Compiling aux file: " $a
    bibtex $a
done
pdflatex $what
pdflatex $what
rm -f *.aux *.bbl *.blg *.log
echo "Done."
