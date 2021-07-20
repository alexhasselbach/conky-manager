#!/bin/bash

curr_theme=$(cat .current_theme)
selection=""

while [[ -z $selection ]]; do
	clear
	echo "Theme: $curr_theme"
	echo ""

	themes=$(find * -maxdepth 0 -type d)
	n=0
	for theme in $themes; do
		n=$(($n+1))
		echo $n: $theme
	done
	
	read selection
done

i=0
for theme in $themes; do
	i=$(($i+1));
	newtheme=$theme

	if [[ $i -eq $selection ]]; then break; fi
done

echo "Changing to $newtheme"

echo $newtheme>.current_theme
rm conky.conf
cp $newtheme/conky.conf conky.conf && echo "Successful"
