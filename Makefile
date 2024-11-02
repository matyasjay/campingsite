serve:
	sh build/script
	rojo serve
build:
	sh build/script
docs-dev:
	npx moonwave --out-dir=publish dev
docs-publish:
	npx moonwave --out-dir=publish build --publish
