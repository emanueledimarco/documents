#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -a x -b x -c x ...."
   echo -e "\t-a attivita di ricerca"
   echo -e "\t-b elenco conferenze"
   echo -e "\t-c contratti"
   echo -e "\t-d responsabilita, review, congressi"
   echo -e "\t-e trasferimento tecnologico"
   echo -e "\t-f 10 prodotti"
   echo -e "\t-g pubblicazioni complessive"
   exit 1 # Exit script after printing help
}

while getopts "a:b:c:d:e:f:g:" opt
do
   case "$opt" in
      a ) parameterA="$OPTARG" ;;
      b ) parameterB="$OPTARG" ;;
      c ) parameterC="$OPTARG" ;;
      d ) parameterD="$OPTARG" ;;
      e ) parameterE="$OPTARG" ;;
      f ) parameterF="$OPTARG" ;;
      g ) parameterG="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$parameterA" ] && [ -z "$parameterB" ] && [ -z "$parameterC" ] && [ -z "$parameterD" ] && [ -z "$parameterD" ] && [ -z "$parameterE" ] && [ -z "$parameterF" ] && [ -z "$parameterG" ]
then
   echo "All the parameters are empty";
   helpFunction
fi

if [ ! -z "$parameterB" ]
then
    echo "making the list of the 20 conferences"
    pdflatex conflist.tex
fi


if [ ! -z "$parameterG" ]
then
    echo "making the list of all publications"
    pdflatex publist_upto2019.tex
    bibtex publist_upto2019
    pdflatex publist_upto2019.tex
    pdflatex publist_upto2019.tex
fi
