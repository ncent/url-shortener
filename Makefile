HANDLER=handler
PACKAGE=package
ifdef DOTENV
	DOTENV_TARGET=dotenv
else
	DOTENV_TARGET=./.env
endif

.PHONY: build clean deploy


build: clean #test # generate_graphql test
	export $(grep -v '^#' ./.env | xargs)
	env
	dep ensure
	env GOOS=linux go build -ldflags="-s -w" -a -tags netgo -installsuffix netgo -o bin/url-shortener/shorten handlers/url-shortener/shorten/main.go
	env GOOS=linux go build -ldflags="-s -w" -a -tags netgo -installsuffix netgo -o bin/url-shortener/redirect handlers/url-shortener/redirect/main.go
	chmod +x bin/url-shortener/shorten
	chmod +x bin/url-shortener/redirect
	zip -j bin/url-shortener/shorten.zip bin/url-shortener/shorten
	zip -j bin/url-shortener/redirect.zip bin/url-shortener/redirect

clean:
	-rm -rf ./bin

test: build
	go test github.com/ncent/arber-core/services/kinesis/client

deploy: build
	sls deploy --force --verbose

publish: deploy
	sls invoke --function publisher --path event.json
	ping -c 11 127.0.0.1 > nul
	sls logs -f publisher
	sls invoke --function consumer 
	ping -c 11 127.0.0.1 > nul
	sls logs -f consumer
	sls logs -f archiver
	rm nul
