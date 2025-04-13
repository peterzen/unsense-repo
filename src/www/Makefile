.PHONY: build

build:
	@pandoc --standalone --css=simple.css index.md -o build/index.html
	@cp -v assets/* build/

publish:
	cp build/* /srv/www
