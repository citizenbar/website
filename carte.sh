#!/bin/bash -x

curl -sSL "https://docs.google.com/spreadsheets/d/e/2PACX-1vTyoMcI-aqWgYfdLocDbBhyFX5MmTtgrWR2CDMSHhtb1yVFTaorw9elsMpFo245ExFBaOPIWSPcn4gC/pub?gid=0&single=true&output=tsv" | sed 's/\r$//' | sed 1d | tee carte.tsv

mkdir -p content/carte/
rm content/carte/*.md

cat > content/carte/_index.md <<EOF
---
title: Carte
date: 2021-03-11
---

Ci-dessous la carte du Citizen
EOF

while read line
do
    if [ ! -z "$line" ]
    then
        IFS=$'\t'
        set -- $line
        cat > content/carte/${3}.md <<EOF
---
title: $1
watch: $2
date:  $3
---
EOF
    fi
done < carte.tsv

ls -l content/carte/
