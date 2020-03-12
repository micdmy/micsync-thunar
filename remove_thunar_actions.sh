#!/bin/bash

UCA_XML="$HOME/.config/Thunar/uca.xml"

# get Begin and End lines of <action>...</action> blocks:
BEGIN_ACTION_LINES="$(grep -n "<action>" $UCA_XML | cut -f1 -d:)"
END_ACTION_LINES="$(grep -n "</action>" $UCA_XML | cut -f1 -d:)"
# put Begin and End lines to bash arrays:
readarray -t BEGIN_LINES < <(echo "$BEGIN_ACTION_LINES")
readarray -t END_LINES < <(echo "$END_ACTION_LINES")
B_LEN="${#BEGIN_LINES[*]}"
E_LEN="${#END_LINES[*]}"
if (( ${B_LEN} != ${E_LEN} )); then
	echo "Bad syntax of ${UCA_XML} file."
	echo "File contains ${B_LEN} '<action>', but ${E_LEN} '</action>'."
	echo "Fix file and try again."
	exit
fi
# for each <action>...</action> block:
for ((IDX=B_LEN-1;IDX>=0;IDX--)); do
	BEGIN=${BEGIN_LINES[IDX]}
	END=${END_LINES[IDX]}
	# check if BEGIN and END are numeric
	# because if no blocks were found arrays have one empty element)
	REG='^[0-9]+$'
	if ! [[ $BEGIN =~ $REG ]] ; then
		exit
	fi
	if ! [[ $END =~ $REG ]] ; then
		exit
	fi
	# if block contains "micsync":
	if sed -n "${BEGIN},${END} p" $UCA_XML | grep -q "micsync"; then
		#remove block:
		sed -i "${BEGIN},${END} d" ${UCA_XML}
	fi
done

