.PHONY: format lint test watch clean install

bin/golint:
	GOBIN=`pwd`/bin go get golang.org/x/lint/golint

format:
	cd src && go fmt ./...

lint: bin/golint
	bin/golint -set_exit_status ./...

test:
	cd src && go test ./...

watch:
	rg --files | entr -rc sh -c "make format && make bin/sandbox && make test && make lint"

run:
	go run src/main.go

clean:
	rm -f *.go.* */*.go.*
	rm -f bin/sandbox

bin/sandbox: src/main.go src/*/*.go src/*/*/*.go
	cd src && go build -o ../bin/sandbox

install: bin/sandbox
	ln -sf `pwd`/bin/sandbox /usr/local/bin/sandbox
