#!/bin/bash
# Script to upload the content of a directory to Zenodo.
# Motivation: Zenodo's interface and drag & drop works great for files with a certain minimum file size and would fail for the `metadata.json` files.
# Usage: adapt your Zenodo token and upload ID for your project (Create Zenodo account, then create token here https://zenodo.org/account/settings/applications/tokens/new/)
# Create your new upload to zenodo (https://zenodo.org/deposit/new) to obtain ID
# `cd data-directory`, run `for file in $(ls *);do source ../../../../src/upload_file_to_zenodo.sh $file;done`

# Katja Heuer, Roberto Toro September 2019


# Your personal access token (keep safe)
token="123abc"

# your-new-upload Zenodo project id (https://zenodo.org/deposit/1234567)
id="1234567"     # 


# file path
path="$1"

# file name
name=$(basename "$path")
# upload
curl \
  -i \
  -F name="$name" \
  -F file=@"$path" \
  https://zenodo.org/api/deposit/depositions/"$id"/files?access_token=$token
