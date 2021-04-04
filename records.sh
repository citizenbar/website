#!/bin/bash

curl -w '\n' -sSL "https://docs.google.com/spreadsheets/d/e/2PACX-1vTyoMcI-aqWgYfdLocDbBhyFX5MmTtgrWR2CDMSHhtb1yVFTaorw9elsMpFo245ExFBaOPIWSPcn4gC/pub?gid=1308892709&single=true&output=tsv" | sed 's/\r$//' | sed 1d | tee podcasts.tsv

mkdir -p content/records/
rm content/records/*.md

cat > content/records/_index.md <<EOF
---
title: Enregistrements
date: 2021-03-11
csstemplate: itemsLists
---

Ci-dessous la liste des enregistrements à voir en replay
EOF

while read line
do
    if [ ! -z "$line" ]
    then
        IFS=$'\t'
        set -- $line
        cat > content/records/${3}.md <<EOF
---
title: $1
watch: $2
date:  $3
type:  records
genre: $4
csstemplate: itemsDetails
---
EOF
    fi
done < podcasts.tsv

ls -l content/records/
