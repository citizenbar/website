#!/bin/bash

curl -w '\n' -sSL "https://docs.google.com/spreadsheets/d/e/2PACX-1vTyoMcI-aqWgYfdLocDbBhyFX5MmTtgrWR2CDMSHhtb1yVFTaorw9elsMpFo245ExFBaOPIWSPcn4gC/pub?gid=1595323090&single=true&output=tsv" | sed 's/\r$//' | sed 1d | tee events.tsv

mkdir -p content/events/
rm -f content/events/*.md

cat > content/events/_index.md <<EOF
---
title: "Évènements"
date: "2021-03-11"
csstemplate: "itemsLists"
---

Ci-dessous la liste des enregistrements à voir en replay
EOF

while read line
do
    if [ ! -z "$line" ]
    then
        IFS=$'\t'
        set -- $line
        cat > content/events/${3}.md <<EOF
---
title: "$1"
watch: "$2"
date:  "$3"
type:  "events"
genre: "$4"
csstemplate: "itemsDetails"
---
EOF
    fi
done < events.tsv

ls -l content/events/
