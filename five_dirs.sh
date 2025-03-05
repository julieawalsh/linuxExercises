#!/bin/bash

rm -r five 2>/dev/null

mkdir -p five/dir{1..5}

for dir in five/dir{1..5}; do
    for i in {1..4}; do
	yes "$i" | head -n "$i" > "$dir/file$i"
    done
done
