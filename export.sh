#!/bin/sh

set -e
export API_KEY=$1
PROJECT_ID=$2
LANGUAGE_CODE=$3
FILE_NAME=$4
FILE_FORMAT=$5
FILE_PATH=$6

cd ../../
save_path="`pwd`/$FILE_PATH"

content=$(node -pe 'JSON.parse(process.argv[1]).item' "$(curl -X POST https://poeditor.com/api/ \
     -d api_token="$API_KEY" \
     -d action="export" \
     -d id="$PROJECT_ID" \
     -d language="$LANGUAGE_CODE" \
     -d type="$FILE_FORMAT")")

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
       fileName="temp.json"
       curl $content > $fileName

       echo $(cat $fileName | jq '.[] | {(.term) : (.definition)}') | jq --slurp 'reduce .[] as $item ({}; . * $item)' > "$path$LANGUAGE_CODE.$FILE_FORMAT"
     fi
