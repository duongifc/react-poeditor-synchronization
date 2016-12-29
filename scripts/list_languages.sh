#!/bin/sh

set -e

API_KEY=$(cat ../config.json | jq -r '. | .api_key')
PROJECT_ID=$(cat ../config.json | jq -r '. | .project_id')

node -pe 'JSON.parse(process.argv[1]).list' "$(curl -X POST https://poeditor.com/api/ \
                                                    -d api_token="$API_KEY" \
                                                    -d action="list_languages" \
                                                    -d id="$PROJECT_ID")"