#!/bin/bash

UCA_XML="$HOME/.config/Thunar/uca.xml"
# create uca.xml if it doesn't exist:
mkdir -p ~/.config/Thunar
cp -n uca-template.xml $UCA_XML

TEMP_FILE=micsync_thunar_temp.txt
for ACTION_FILE in *_action.xml; do
	#generate unique id for action:
	UUID="$(uuidgen)"
	#replace "UUID" with generated id and save action to temporary file:
	sed "s/UUID/$UUID/" $ACTION_FILE > $TEMP_FILE
	#copy action from temporary file to uca.xml
	sed -i -e "/<actions>/r $TEMP_FILE" $UCA_XML
done

rm -f $TEMP_FILE
