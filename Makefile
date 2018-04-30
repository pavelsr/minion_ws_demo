.PHONY: build-dev cpanfile

install-dev-deps:
	# Run each time when you changed cpanfile
	sudo cpan App::cpanminus
	sudo cpanm App::scan_prereqs_cpanfile

build-dev: cpanfile
	docker-compose -f docker-compose-dev.yml build

run-dev-docker: build-dev
	docker-compose -f docker-compose-dev.yml up -d

restart-dev:
	# Install cpan modules
	docker-compose -f docker-compose-dev.yml down --remove-orphans
	docker-compose -f docker-compose-dev.yml up -d

logs:
	docker-compose -f docker-compose-dev.yml logs -f --tail=10

cpanfile:
	rm -f cpanfile
	scan-prereqs-cpanfile > cpanfile

installdeps:
	sudo cpanm --installdeps .
