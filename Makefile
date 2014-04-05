all: index.js

clean:
	rm index.js

index.js: src/annotateitpermissions.coffee
	./node_modules/.bin/browserify \
		src/annotateitpermissions.coffee \
		-p annotator \
		-t coffeeify \
		--extension=.coffee \
		--standalone Annotator.Plugin.AnnotateItPermissions \
		> index.js

.PHONY: clean
