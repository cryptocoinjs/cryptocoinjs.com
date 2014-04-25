build:
	mkdocs build

clean:
	rm -f index.html
	rm -rf css
	rm -rf fonts
	rm -rf img
	rm -rf js
	rm -rf modules

serve:
	mkdocs serve --dev-addr=0.0.0.0:8001

.PHONY: build clean serve