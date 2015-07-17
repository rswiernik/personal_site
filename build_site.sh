#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Please provide a destination dir"
	exit 1
fi

BUILD_DIR="."
DEST_DIR="$1"

if [[ ! -d "./.build_temp" ]]; then
	mkdir "${BUILD_DIR}/.build_temp"
fi

jekyll build --destination "${BUILD_DIR}/.build_temp"

if [ $? -ne 0 ]; then
	exit 1
else
	tree "${BUILD_DIR}/.build_temp" | less

	read -p "Did the file structure look correct? [Y/n]" -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		read -p "Would you like to copy to ${DEST_DIR}? [Y/n]" -n 1 -r
		echo
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			echo "${BUILD_DIR}/.build_temp  ->  ${DEST_DIR}"
			cp -r ${BUILD_DIR}/.build_temp/* "${DEST_DIR}"
		else
			echo "Aborting build..."
		fi
	fi
fi
echo "Removing temp work directory"
rm -r "${BUILD_DIR}/.build_temp"
