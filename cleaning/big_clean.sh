#!/bin/bash


# Check there is only 1 argument 
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

# Argument: the name of the compressed tar archive

archive="$1"

# Creates a temporary scratch directory 

scratch=$(mktemp -d)

# Extract the contents of the tar archive into the scratch directory
tar -xzf "$archive" -C "$scratch"

# Remove files from scratch directory containing line "DELETE ME"
find "$scratch" -type f -exec grep -l "DELETE ME!" {} \; | xargs rm -f

# Create a new compressed tar archive with cleaned files 

archive_name=$(basename "$archive" .tgz)

tar -czf "cleaned_$archive_name.tgz" -C "$scratch" "$archive_name" 

# Clean up: remove the scratch directory 



rm -r "$scratch"

echo "Cleaning completed. New archive: cleaned_$archive_name.tgz"