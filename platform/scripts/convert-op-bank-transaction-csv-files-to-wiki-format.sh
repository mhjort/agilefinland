#!/bin/bash

WIKI_FILE=COPY_PASTE_THIS_TO_WIKI
rm -f $WIKI_FILE
for FILE in *.csv; do dos2unix $FILE && iconv --from-code=ISO_8859-1 --to-code=UTF-8 $FILE |sed '/^$/d'| sed 's/|/,/g' |sed 's/;/|/g' |sed 's/$/|/g' |sed 's/^/|/g' |sed '1d' >> $WIKI_FILE; done
echo "Now open $WIKI_FILE and copy-paste the contents to Confluence"
