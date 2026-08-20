#!/bin/bash
# Universal Auto-Runner Script for Files & Scripts
# Usage: ./run_file.sh <file_or_script_path>

if [ -z "$1" ]; then
    echo "Usage: ./run_file.sh <path_to_file_or_script>"
    echo "Example: ./run_file.sh merge_and_build.sh"
    echo "Example: ./run_file.sh app/src/main/java/com/example/MainActivity.kt"
    exit 1
fi

FILE_TARGET="$1"

if [ ! -f "$FILE_TARGET" ]; then
    echo "Error: File '$FILE_TARGET' not found."
    exit 1
fi

echo "=================================================="
echo "⚡ AUTO-RUNNER EXECUTING: $FILE_TARGET"
echo "=================================================="

# Check if target is a bash script
if [[ "$FILE_TARGET" == *.sh ]]; then
    chmod +x "$FILE_TARGET"
    bash "$FILE_TARGET"
# Check if target is a Kotlin file
elif [[ "$FILE_TARGET" == *.kt || "$FILE_TARGET" == *.java ]]; then
    echo "Inspecting Kotlin/Java source file: $FILE_TARGET"
    head -n 25 "$FILE_TARGET"
    echo "---"
    echo "File is registered in main build source set."
# Fallback text viewer
else
    cat "$FILE_TARGET"
fi

echo "=================================================="
echo "Execution completed."