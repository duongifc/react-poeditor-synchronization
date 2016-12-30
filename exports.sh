#!/bin/sh

set -e

export CONFIG_FILE_PATH=$1

API_KEY=$(cat $CONFIG_FILE_PATH | jq -r '. | .api_key')
PROJECT_ID=$(cat $CONFIG_FILE_PATH | jq -r '. | .project_id')
LANGUAGE_CODES=$(cat $CONFIG_FILE_PATH | jq -r '. | .languages')
FILE_NAME=$(cat $CONFIG_FILE_PATH | jq -r '. | .file_name')
FILE_FORMAT=$(cat $CONFIG_FILE_PATH | jq -r '. | .file_format')
FILE_PATH=$(cat $CONFIG_FILE_PATH | jq -r '. | .path')

set -f                      # avoid globbing (expansion of *).
array=(${LANGUAGE_CODES//,/ })
for i in "${!array[@]}"
do
    ./export.sh $API_KEY $PROJECT_ID ${array[i]} $FILE_NAME $FILE_FORMAT $FILE_PATH
done
