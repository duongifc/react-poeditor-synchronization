#!/bin/sh

set -e

API_KEY=$(cat config.json | jq -r '. | .api_key')
PROJECT_ID=$(cat config.json | jq -r '. | .project_id')
LANGUAGE_CODES=$(cat config.json | jq -r '. | .languages')
FILE_NAME=$(cat config.json | jq -r '. | .file_name')
FILE_FORMAT=$(cat config.json | jq -r '. | .file_format')
FILE_PATH=$(cat config.json | jq -r '. | .path')

set -f                      # avoid globbing (expansion of *).
array=(${LANGUAGE_CODES//,/ })
for i in "${!array[@]}"
do
    ./export.sh $API_KEY $PROJECT_ID ${array[i]} $FILE_NAME $FILE_FORMAT $FILE_PATH
done
