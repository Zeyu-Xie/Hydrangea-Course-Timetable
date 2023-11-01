#!/bin/zsh
source ~/.zshrc
source ~/.zprofile

filePath="$(readlink -f "$0")"
dirPath="$(dirname $filePath)"
srcPath="$dirPath/main.py"

python $srcPath