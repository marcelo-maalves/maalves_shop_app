.PHONY: all pub-get-all

default: run-staging

run-staging: 
	cd app && flutter run --flavor staging

flutter-activate-melos:
	flutter pub global activate melos

dart-activate-coverde:
	dart pub global activate coverde

clean-all:
	@melos run flutter_clean --no-select

pub-get-all:
	@melos exec --flutter --fail-fast -- "flutter pub get"
	@melos exec --no-flutter --fail-fast -- "dart pub get"

format-all:
	@melos exec -- "dart format ."

analyze-all:
	@# we don't need to analyze all packages individually
	@# it can be ran once for all on root.
	@flutter analyze --no-pub .

generate:
	@melos generate --no-select

test-all:
	@melos run test_flutter --no-select

test-all-with-coverage:
	rm -rf coverage
	@melos run test_flutter --no-select
	@melos exec -c 1 --file-exists=coverage/lcov.info -- coverde filter --input ./coverage/lcov.info --output MELOS_ROOT_PATH/coverage/filtered.lcov.info --filters \.g\.dart
	coverde value -i coverage/filtered.lcov.info > coverage/result.txt

ci-build:
	@melos exec -c 1 --flutter --fail-fast -- "flutter pub get && if grep "build_runner" "pubspec.yaml"; then flutter pub run build_runner build --delete-conflicting-outputs ; fi"
	@melos exec -c 1 --no-flutter --fail-fast -- "dart pub get"

ci-format:
	@melos exec -c 1 -- "dart format ."

ci-test:
	@melos run ci_test_flutter --no-select

create-package:
	@scripts/create-flutter-package.sh $(name) packages

create-feature:
	@scripts/create-flutter-package.sh $(name) packages/features

setup:
	@make clean-all
	@make flutter-activate-melos
	@melos bs
	@make generate

setup-win:
	pwsh ./scripts/for-all-pubspecs.ps1 "flutter pub get"
	pwsh ./scripts/for-all-pubspecs.ps1 "flutter pub run build_runner build --delete-conflicting-outputs"

git-clean:
	git clean -fdx
