#!/bin/bash
#
# This script reads URLs from file
# and makes them static
#
#
# Options
#
# -k : convert links to relative
# -K : keep an original versions of files without the conversions made by wget
# -E : rename html files to .html (if they don’t already have an htm(l) extension)
# -r : recursive… of course we want to make a recursive copy
# -l 10 : the maximum level of recursion. if you have a really big website you may need to put a higher number, but 10 levels should be enough.
# -p : download all necessary files for each page (css, js, images)
# -N : Turn on time-stamping.
# -F : When input is read from a file, force it to be treated as an HTML file.
# -nH : By default, wget put files in a directory named after the site’s hostname. This will disabled creating of those hostname directories and put everything in the current directory.
#
if [ "$#" -eq 1 -a -f "$1" ]
then
    for site in $(cat $1)
    do
        name=$(cut -d'.' -f1 <<< $site)
        echo $name
        mkdir $name
        cd $name
        echo $name
        wget -k -K -E -r -l 10 -p -N -F -nH -nv --show-progres $site
        cd ..
    done
else
    echo "Wrong number of arguments or files."
fi