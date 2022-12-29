VERSION="v1"

removemodules:
	rm -rf node_modules	
build:
	rm -rf node_modules	
	docker build --rm --force-rm -t vnc_ubu_app:${VERSION} .
clean:
	rm -rf node_modules
	docker rmi vnc_ubu_app:${VERSION}