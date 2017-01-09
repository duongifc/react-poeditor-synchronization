#!/usr/bin/env bash

set -e

export IMAGE_PATH=$1
OUTPUT_PATH=$2

config_path="`pwd`/$IMAGE_PATH"
output_path="`pwd`/$OUTPUT_PATH/images.js"

find="-"
replace="_"

echo "const Images = {" > $output_path
for file in "$config_path/"*
do
    filename=$(basename "$file")
    fileNameWithoutFormat="${filename%.*}"

    fileNameWithoutFormat="${fileNameWithoutFormat/\-/_}"
    fileNameWithoutFormat="${fileNameWithoutFormat/\-/_}"
    fileNameWithoutFormat="${fileNameWithoutFormat/\-/_}"
    fileNameWithoutFormat="${fileNameWithoutFormat/\-/_}"
    fileNameWithoutFormat="${fileNameWithoutFormat/\-/_}"

    echo -e "\t$fileNameWithoutFormat: require('./images/$filename')," >> $output_path
done

echo "};" >> $output_path
echo "export default Images;" >> $output_path
