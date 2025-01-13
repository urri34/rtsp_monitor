#!/bin/bash

# Define the GitHub repository
REPO="bluenviron/mediamtx"
# GitHub API URL for the latest release
API_URL="https://api.github.com/repos/$REPO/releases/latest"
# Define the target directory
TARGET_DIR="/rtsp_monitor"

# Determine the CPU architecture
ARCH=$(uname -m)
case "$ARCH" in
    x86_64)
        ASSET_SUFFIX="_linux_amd64.tar.gz"
        ;;
    armv8*|aarch64)
        ASSET_SUFFIX="_linux_arm64v8.tar.gz"
        ;;
    armv6*)
        ASSET_SUFFIX="_linux_armv6.tar.gz"
        ;;
    armv7*)
        ASSET_SUFFIX="_linux_armv7.tar.gz"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

# Ensure the target directory exists
mkdir -p "$TARGET_DIR"

# Fetch the latest release data from GitHub API and parse the download URL
DOWNLOAD_URL=$(curl -s $API_URL | jq -r ".assets[] | select(.name | endswith(\"$ASSET_SUFFIX\")) | .browser_download_url")

if [[ $DOWNLOAD_URL != null && $DOWNLOAD_URL != "" ]]; then
    # Download the latest release tarball
    echo "Downloading $DOWNLOAD_URL"
    curl -L $DOWNLOAD_URL -o $TARGET_DIR/mediamtx.tar.gz
    echo "Download completed."

    # Extract the tar.gz file to the target directory
    tar -xzf $TARGET_DIR/mediamtx.tar.gz -C "$TARGET_DIR"
fi
