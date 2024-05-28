gen:
	flutter pub run build_runner build --delete-conflicting-outputs

hello:
	echo "Hi!"; \
	echo "I'm makefile"; \
	echo "^_^"

icon:
	flutter pub run flutter_launcher_icons:main

init_res:
	dart pub global activate flutter_asset_generator

format:
	dart format . --line-length 100

res:
	fgen --output lib/components/resources.g.dart --no-watch --no-preview; \
	make format

