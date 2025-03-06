#!/bin/bash 

if [[ $# -lt 1 ]] || [[ $# -gt 2 ]]; then
    echo "usage: $0 <column> [file.csv]" 1>&2
    exit 1
fi

column="$1"
file="${2:-/dev/stdin}"

if ! [[ "$column" =~ ^[0-9]+$ ]]; then
    echo "error: column must be a positive integer." 1>&2
    exit 1
fi

cut -d ',' -f "$column" "$file" | tail -n +2 | {
    sum=0
    count=0
    while read -r value; do
	sum=$(echo "$sum + $value" | bc -l)
	count=$((count+1))
    done
    if [ "$count" -gt 0 ]; then
	echo "scale=6; $sum / $count" | bc -l
    else
	echo "error: no valid data in column $column." 1>&2
    fi
}
