#!/bin/zsh
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

for f in ./*.txt; do
    # echo $f
    whole_line=$(head -n1 $f)
    # number=[[ $whole_line [0-9]\.[0-9]\.[0-9] ]]
	  number=$(echo $whole_line | ggrep -Eo "[0-9]+\.[0-9]+\.[0-9]+" | awk '{ gsub("\\.", "\t") ; print $0 }')
    title=$(echo $whole_line | ggrep -oP "\d+\.\d+\.\d+\K.+")
    # clean=$(echo $title | ggrep -oP "-|\s\K[a-zA-Z0-9]+" | awk '{print $0}')
    clean=$(echo $title | ggrep -oP "\s+-*\s*\K.+")
  # echo "${number}\t${title}"
	echo "${number}\t${clean}"
done
