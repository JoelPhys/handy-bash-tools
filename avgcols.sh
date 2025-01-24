#!/bin/bash

function avgcols() {

if [ -z "$2" ]
then
	echo "missing start and end line to average between. setting to first and last line."
	start=1
	end=$(wc -l < $1)
else
	start=$2
	end=$3
fi

awk "
{
	if (($start <= FNR) && (FNR <= $end)) 
	
	for(i=1; i<=NF; i++) {
        a[i]+=\$i
        if(\$i!=\"\")
            b[i]++}
    }
END {
    for(i=1; i<=NF; i++)
        printf \"%s%s\", a[i]/b[i], (i==NF?ORS:OFS)
}" $1
}

avgcols $1
