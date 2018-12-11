#!/bin/bash
find . -type f -name "*.md" | sort | grep "_index${MARKDOWN_EXTENSION}\|${MARKDOWN_FILENAME}${MARKDOWN_EXTENSION}"