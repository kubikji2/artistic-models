#!/usr/bin/env bash

# check for the number of arguments
# https://linuxhint.com/check-the-number-of-arguments-in-bash/
if [ "$#" -lt 1 ]; then
    echo "[error] not enough arguments."
    echo "usage: $0 <path-to-stl-to-be-centered>"
    exit
fi

# extract first argument
fn_in=$1
fn_out=$2

# create default output value if no argument present
if [ "$#" -lt 2 ]; then
    fn_out=${fn_in/".stl"/"-center.stl"}
fi

# run prusaslicer
# see: https://manual.slic3r.org/advanced/command-line
prusaslicer -g $fn_in --export-stl --center 0,0 --output $fn_out 

