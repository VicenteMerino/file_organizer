#!/bin/bash

# Move images extension from Downloads and Desktop to Documents/Images, if not exist create it
mkdir -p ~/Documents/Images
mkdir -p ~/Documents/PDFs
mkdir -p ~/Documents/DOCs
mkdir -p ~/Documents/ZIPs
mkdir -p ~/Documents/GIFs

function move_files {
  for dir in ~/Downloads ~/Desktop; do
    for file in $dir/*.{jpg,jpeg,png,JPG,JPEG,PNG}; do if [ -f "$file" ]; then mv "$file" ~/Documents/Images; fi; done
    for file in $dir/*.{pdf,PDF}; do if [ -f "$file" ]; then mv "$file" ~/Documents/PDFs; fi; done
    for file in $dir/*.{doc,docx,DOC,DOCX}; do if [ -f "$file" ]; then mv "$file" ~/Documents/DOCs; fi; done
    for file in $dir/*.{zip,ZIP}; do if [ -f "$file" ]; then mv "$file" ~/Documents/ZIPs; fi; done
    for file in $dir/*.{gif,GIF}; do if [ -f "$file" ]; then mv "$file" ~/Documents/GIFs; fi; done
  done

}

export -f move_files
fswatch -o ~/Downloads ~/Desktop | xargs -n1 -I{} bash -c move_files
