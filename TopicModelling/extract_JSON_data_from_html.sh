#!/bin/bash

cat index.html | grep "m__DATA__tw" | sed 's/<script type="application\/json" id="m__DATA__tw">//g' | sed 's/<\/script>//g' | sed 's/^"\|"$//g' | sed 's/\\"/"/g' | sed 's/\\n/\n/g' > m__DATA__tw.json
cat index.html | grep "m__DATA__dt" | sed 's/<script type="application\/json" id="m__DATA__dt">//g' | sed 's/<\/script>//g' | sed 's/^"\|"$//g' | sed 's/\\"/"/g' | sed 's/\\n/\n/g' > m__DATA__dt.json
cat index.html | grep "m__DATA__meta" | sed 's/<script type="application\/json" id="m__DATA__meta">//g' | sed 's/<\/script>//g' | sed 's/^"\|"$//g' | sed 's/\\"/"/g' | sed 's/\\n/\n/g' > m__DATA__meta.json
cat index.html | grep "m__DATA__topic_scaled" | sed 's/<script type="application\/json" id="m__DATA__topic_scaled">//g' | sed 's/<\/script>//g' | sed 's/^"\|"$//g' | sed 's/\\"/"/g' | sed 's/\\n/\n/g' > m__DATA__topic_scaled.json
cat index.html | grep "m__DATA__info" | sed 's/<script type="application\/json" id="m__DATA__info">//g' | sed 's/<\/script>//g' | sed 's/^"\|"$//g' | sed 's/\\"/"/g' | sed 's/\\n/\n/g' > m__DATA__info.json


