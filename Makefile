serve:
	sh build/script
	rojo serve
build:
	sh build/script
docs:
	npx moonwave --out-dir=publish build --publish
