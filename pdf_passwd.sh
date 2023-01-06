#!/bin/bash

name="PASS" # First 4 letters of your name         
FILEIN="sample_out.pdf" # Input file name
FILEOUT="sample_open.pdf" # Output file name

for mm in $(seq -f "%02g" 1 12)
do
    for dd in $(seq -f "%02g" 1 31)
    do
        qpdf -password="${name}"$dd$mm -decrypt $FILEIN $FILEOUT
        if test -f "$FILEOUT"; then
            echo File Opened!
            echo Password "${name}"$dd$mm
            break
        fi
    done
done
echo all done

