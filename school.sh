#!/bin/bash


cat Property_Tax_Roll.csv | grep 'MADISON SCHOOLS' | cut -d ',' -f 7 | { sum=0;count=0; while read n; do sum=$(($sum + $n));count=$(($count+1)); avg=$(($sum/$count)); done; echo "sum is \$$sum and average is \$$avg"; }

