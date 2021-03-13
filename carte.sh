#!/bin/bash

curl -sSL "https://docs.google.com/spreadsheets/d/e/2PACX-1vTyoMcI-aqWgYfdLocDbBhyFX5MmTtgrWR2CDMSHhtb1yVFTaorw9elsMpFo245ExFBaOPIWSPcn4gC/pub?gid=843506310&single=true&output=tsv" | sed 's/\r$//' | sed 1d | tee carte.tsv

mkdir -p content/carte/
rm content/carte/*.md

cat > content/carte/_index.md <<EOF
---
title: Carte
date: 2021-03-11
type: carte
---

Ci-dessous la carte du Citizen
EOF

CURSOR=0
while read line
do
    CURSOR=$((CURSOR+1))
    PREFIX=$(printf "%02d" $CURSOR)
    #echo "========== $CURSOR $PREFIX"
    if [ ! -z "$line" ]
    then
        IFS=$'\t'
        set -- $line
        fname="$( echo "$2" | tr [:upper:] [:lower:] | tr -dc '[[:print:]]' | sed -e 's/ $//' -e 's/ /_/g')"
        cat > content/carte/${PREFIX}_${fname}.md <<EOF
---
title: $2
desc:  $3
prix:  $4
dose:  $5
categorie: $1
type:  carte
---
EOF
    fi
done < carte.tsv

ls -l content/carte/
