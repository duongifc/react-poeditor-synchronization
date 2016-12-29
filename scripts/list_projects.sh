#!/bin/sh

set -e

API_KEY=$(cat ../config.json | jq -r '. | .api_key')
echo $API_KEY

node -pe 'JSON.parse(process.argv[1]).list' "$(curl -X POST https://poeditor.com/api/ \
     -d api_token="$API_KEY" \
     -d action="list_projects")"