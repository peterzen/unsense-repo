.PHONY: build

WWWROOT=/srv/www/public_html/unsense-repo

build:
	@rm -rf build && mkdir -p build
	@pandoc --standalone --css=simple.css index.md -o build/index.html
	@cp -v assets/* build/

publish:
	mkdir -p ${WWWROOT}
	cp build/* ${WWWROOT}
