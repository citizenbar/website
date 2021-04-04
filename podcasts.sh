#!/bin/bash

curl -w '\n' -sSL "https://docs.google.com/spreadsheets/d/e/2PACX-1vTyoMcI-aqWgYfdLocDbBhyFX5MmTtgrWR2CDMSHhtb1yVFTaorw9elsMpFo245ExFBaOPIWSPcn4gC/pub?gid=0&single=true&output=tsv" | sed 's/\r$//' | sed 1d | tee podcasts.tsv

mkdir -p content/podcasts/
rm content/podcasts/*.md

cat > content/podcasts/_index.md <<EOF
---
title: Podcasts
date: 2021-03-11
---

Ci-dessous la liste des podcasts
EOF

while read line
do
    if [ ! -z "$line" ]
    then
        IFS=$'\t'
        set -- $line
        cat > content/podcasts/${3}.md <<EOF
---
title: $1
watch: $2
date:  $3
type:  podcasts
---
EOF
    fi
done < podcasts.tsv

ls -l content/podcasts/
