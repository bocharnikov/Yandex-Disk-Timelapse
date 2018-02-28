#!/bin/bash

ls -l /mnt16/yandex.disk/timelapse/*.jpg | awk '{print $9}' >> /tmp/tmp
TMP=/tmp/tmp
MSG=`cat $TMP | wc -l`
BAR_WIDTH=50
BAR_CHAR_START="["
BAR_CHAR_END="]"
BAR_CHAR_EMPTY="."
BAR_CHAR_FULL="="
BRACKET_CHARS=2
LIMIT=$MSG

print_bar()
{
# Calculate how many characters will be full.
let "full_limit = ((($1 - $BRACKET_CHARS) * $2) / $LIMIT)"

# Calculate how many characters will be empty.
let "empty_limit = ($1 - $BRACKET_CHARS) - ${full_limit}"

# Prepare the bar.
bar_line="${BAR_CHAR_START}"
for ((j=0; j<full_limit; j++)); do
bar_line="${bar_line}${BAR_CHAR_FULL}"
done

for ((j=0; j<empty_limit; j++)); do
bar_line="${bar_line}${BAR_CHAR_EMPTY}"
done

bar_line="${bar_line}${BAR_CHAR_END}"

printf "Deleting file: %3d/$LIMIT %s" $2 ${bar_line}
}

while read init; do
let i++
rm -f $init
print_bar ${BAR_WIDTH} ${i}
echo -en "\r"
done < $TMP
echo ""
echo -e '\e[32m'"Done!"
rm -f /tmp/tmp

