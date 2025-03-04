#!/bin/bash

echo {1000..2000}>p
pattern="(^[01]+$)"
cat p | sed 's/ /\n/g' | { sum=0; while read n; do if [[ $n =~ $pattern ]] ; then sum=$(($sum+$n)); fi; done; echo "sum is $sum"; }
