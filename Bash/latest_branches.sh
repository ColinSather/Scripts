#!/bin/sh

for branch in `git branch -r | grep -v HEAD`; 
do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; 
done > ~/Projects/Shell_Scripts/outfiles/latest_branches.txt

sort ~/Projects/Shell_Scripts/outfiles/latest_branches.txt

