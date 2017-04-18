#!/bin/bash

FILES=$(find . -type f -perm +111 -print)
echo "link: $FILES to ~/bin?"
read Q
[[ $Q != "y" ]] && exit 1

for file in $FILES
do
    ln -s ${PWD}/$file ~/bin/ 2>/dev/null
done
            
