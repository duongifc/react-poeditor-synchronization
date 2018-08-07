#!/bin/sh

set -e
export API_KEY=$1
PROJECT_ID=$2
LANGUAGE_CODE=$3
FILE_NAME=$4
FILE_FORMAT=$5
FILE_PATH=$6
TYPE=$7

cd ../../
save_path="`pwd`/$FILE_PATH"

content=$(node -pe 'JSON.parse(process.argv[1]).result.url' "$(curl -X POST https://api.poeditor.com/v2/projects/export \
     -d api_token="$API_KEY" \
     -d id="$PROJECT_ID" \
     -d language="$LANGUAGE_CODE" \
     -d type="$TYPE")")

seperator="_"

if [ ! -d "$save_path" ]; then
  mkdir $save_path
fi

path="$save_path/$FILE_NAME$seperator"
     if [ "$FILE_FORMAT" == "apple_strings" ]; then
       curl $content > "$path$LANGUAGE_CODE"
     elif [ "$FILE_FORMAT" == "android_strings" ]; then
       curl $content > "$path$LANGUAGE_CODE.xml"
     else
       curl $content > "$path$LANGUAGE_CODE.$FILE_FORMAT"
     fi