.DEFAULT_GOAL := build

_SRHT_TOKEN ?= $(strip ${SRHT_TOKEN})

clean:
	rm -rf public site.tar.gz

build: clean
	./podcasts.sh
	./records.sh
	./carte.sh
	hugo -D -v

package: build
	tar czf site.tar.gz -C public .

deploy: package
	@curl -vLL --oauth2-bearer "$(_SRHT_TOKEN)" -Fcontent=@site.tar.gz "https://pages.sr.ht/publish/preview.citizenbar.fr"
