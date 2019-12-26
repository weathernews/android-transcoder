#!/bin/sh
pushd $(dirname $0)
version=$(date +'%Y.%m.%d')
git checkout repo maven/
git reset HEAD
./gradlew publish
mkdir /tmp/$version
mv maven/ /tmp/$version/
git checkout repo
git clean -df
rm -rf maven/
mv /tmp/$version/maven ./
rm -rf /tmp/$version
git add --all
git commit -m $version
popd
