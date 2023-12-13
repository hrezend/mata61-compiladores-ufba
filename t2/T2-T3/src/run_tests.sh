#!/bin/bash

T2=$(pwd)
tests="$T2/tests"

# The function total_files reports a total number of files for a given directory. 
function total_files {
    find $1 -type f | wc -l
}

cd "$tests"
echo
echo "- `total_files "$tests"` inputs analisados:"
echo

mytests=$(ls *.in)

cd $T2
for t in $mytests; do
    name=$(basename $t .in)
    echo "- $t: "
    ./bminus < "$tests/$t"
    echo
done

rm "$T2/bminus"
rm "$T2/bminus.tab.h"
rm "$T2/bminus.tab.c"
rm "$T2/lex.yy.c"