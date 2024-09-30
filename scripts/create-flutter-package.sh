#!/bin/bash
set -e

if [ ! -z "$2" ]; then
    cd $2
fi

flutter create --template=package $1
cd $1 && rm -rf LICENSE CHANGELOG.md README.md analysis_options.yaml pubspec.yaml lib/$1.dart test/ linux macos windows android ios

touch lib/$1.dart
echo "library $1;" > lib/$1.dart

touch pubspec.yaml
echo "name: $1
description: Malu $1 package.
version: 0.0.1
publish_to: none

environment:
  sdk: '>=3.0.0 <4.0.0'
  flutter: \">=1.17.0\"

dependencies:
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_lints: ^2.0.1
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true" > pubspec.yaml

dart format .
flutter pub get

if [ $? -eq 0 ]; then
    echo "Package $1 created :)"
else
    echo "Error to create $1 package"
fi
