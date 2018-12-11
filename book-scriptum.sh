#!/bin/bash
find . -type f -name "*.pandoc" | sort | grep "_index${MARKDOWN_EXTENSION}\|${MARKDOWN_FILENAME}${MARKDOWN_EXTENSION}"