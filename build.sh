#!/bin/bash

if ! jq --version
then
  echo "please install jq"
  exit 1
fi
  
VERSION=`cat info.json | jq -r '.version'`
CURDIR=`pwd`
TMPDIR=`mktemp -d /tmp/temp.XXXX`
echo "$TMPDIR"
mkdir -p "$TMPDIR"/marathomaton_"$VERSION"
cp -r . "$TMPDIR"/marathomaton_"$VERSION"
rm -rf "$TMPDIR"/marathomaton_"$VERSION"/.git
rm -rf "$TMPDIR"/marathomaton_"$VERSION"/*.zip
cd "$TMPDIR"
zip -r marathomaton_"$VERSION".zip marathomaton_"$VERSION"
cp marathomaton_"$VERSION".zip "$CURDIR"
if ! test "$FACTORIO_MOD_PATH" = "";
then
  cp marathomaton_"$VERSION".zip "$FACTORIO_MOD_PATH"
fi



