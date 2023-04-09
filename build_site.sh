#!/bin/bash
set -e

BUILD_DIR=".build_temp"
DEST_DIR=".build_output"

cleanup_and_exit() {
# cleanup_and_exit [exit_code]
    echo "Removing temp work directory"
    rm -r "${BUILD_DIR}"
    if [[ $1 ]]; then
        exit $1
    else
        exit 0
    fi
}

# Setup and bootstrapping
if [[ $# -ne 1 ]]; then
	echo "!! Using the default output directory ${DEST_DIR}"
fi

if [[ ! -d "${BUILD_DIR}" ]]; then
	mkdir "${BUILD_DIR}"
fi

if [[ ! -d "${DEST_DIR}" ]]; then
	mkdir "${DEST_DIR}"
fi

# Do the build
# We want to ignore errors on the build so that we can properly cleanup
set +e
jekyll build --destination "${BUILD_DIR}"
set -e

# Post build check/cleanup
if [ $? -ne 0 ]; then
	exit 1
fi

# Check the output
tree "${BUILD_DIR}"
read -p "Does that file structure look correct? [Y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    cleanup_and_exit 1
fi

# Verify and copy
read -p "Would you like to copy to ${DEST_DIR}? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "cp -r ${BUILD_DIR}/* \"${DEST_DIR}\""
    cp -r ${BUILD_DIR}/* "${DEST_DIR}"
    cleanup_and_exit 0
else
    echo "Aborting build..."
    cleanup_and_exit 1
fi
