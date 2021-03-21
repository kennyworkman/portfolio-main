MACHINE?=shekl

OK_COLOR=\033[32;01m
NO_COLOR=\033[0m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

build:
		hugo
	
build-and-push: build
		git add .
		git commit -m "changes for $$(date)"
		git push

build-on-server:
		git pull
		cp -r public/* /var/www/kennethworkman.com/html/
