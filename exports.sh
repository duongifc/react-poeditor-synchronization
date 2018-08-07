#!/bin/sh

set -e

export CONFIG_FILE_PATH=$1

lib_path="`pwd`/`dirname $0`"
config_path="`pwd`/$CONFIG_FILE_PATH"

API_KEY=$(cat $config_path | jq -r '. | .api_key')
PROJECT_ID=$(cat $config_path | jq -r '. | .project_id')
LANGUAGE_CODES=$(cat $config_path | jq -r '. | .languages')
FILE_NAME=$(cat $config_path | jq -r '. | .file_name')
FILE_FORMAT=$(cat $config_path | jq -r '. | .file_format')
FILE_PATH=$(cat $config_path | jq -r '. | .path')
TYPE=$(cat $config_path | jq -r '. | .type')

set -f                      # avoid globbing (expansion of *).
array=(${LANGUAGE_CODES//,/ })
for i in "${!array[@]}"
do
    cd
    cd $lib_path
    "./export.sh" $API_KEY $PROJECT_ID ${array[i]} $FILE_NAME $FILE_FORMAT $FILE_PATH $TYPE
done