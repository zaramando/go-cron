TOKEN = `cat .token`
REPO := go-cron
USER := zaramando
VERSION := "v0.0.5"

build:
	mkdir -p out/darwin out/linux
	GOOS=darwin go build -o out/darwin/go-cron -ldflags "-X main.build `git rev-parse --short HEAD`" bin/go-cron.go
	GOOS=linux go build -o out/linux/go-cron -ldflags "-X main.build `git rev-parse --short HEAD`" bin/go-cron.go

release: build
	rm -f out/darwin/go-cron-osx.gz
	gzip -c out/darwin/go-cron > out/darwin/go-cron-osx.gz
	rm -f out/linux/go-cron-linux.gz
	gzip -c out/linux/go-cron > out/linux/go-cron-linux.gz

arm-build:
	mkdir -p out/arm/v7
	GOOS=linux GOARCH=arm GOARM=7 go build -o out/arm/v7 go-cron bin/go-cron.go

arm-release: build
	rm -f out/arm/v7/go-cron-arm-v7.gz
	gzip -c out/arm/v7/go-cron > out/arm/v7/go-cron-arm-v7.gz


