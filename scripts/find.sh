#!/bin/bash
# used this for filtering blob files from OpenComputers 2 (minecraft mod) when there was a server-crashing ram module in the world
for file in *; do 
	if [ -f "$file" ]; then 
		if strings $file | grep -sq micropython; then
			echo "found!"
		elif true; then
			echo "not found in $file"
			mv $file ../dumbness
		fi 
    fi 
done
