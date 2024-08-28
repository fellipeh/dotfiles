#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

SOURCE_DIR="$SCRIPT_DIR/config"


TARGET_DIR="$HOME/.config"

# Checking if path exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Source path not found: $SOURCE_DIR"
  exit 1
fi

# Create destination, if not exist
mkdir -p "$TARGET_DIR"

# Create symlink for each files
for file in "$SOURCE_DIR"/*; do
  filename=$(basename "$file")
  ln -sfn "$file" "$TARGET_DIR/$filename"
  echo "Symlink created $file -> $TARGET_DIR/$filename"
done

echo "Script finished."

