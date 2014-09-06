all: annotator-annotateitpermissions.min.js

clean:
	rm *.js *.js.map

annotator-annotateitpermissions.js: src/annotateitpermissions.coffee
	./node_modules/.bin/browserify src/annotateitpermissions.coffee \
		-d -p annotator -t coffeeify --extension=.coffee \
		--standalone Annotator.Plugin.AnnotateItPermissions \
		> $@

annotator-annotateitpermissions.min.js: annotator-annotateitpermissions.js
	./node_modules/.bin/uglifyjs $< --source-map $@.map -o $@

.PHONY: clean
