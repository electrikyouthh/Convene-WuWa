SHELL := /bin/sh
.PHONY: format lint

format:
	@swiftformat --swiftversion 5.9 ./

lint:
	@git ls-files --exclude-standard | grep -E '\.swift$$' | swiftlint --fix --autocorrect

