# gha-lint-docker

## description

### gha-lint image

This is a standard image. It always runs the latest linter.

### gha-lint-light image

It is a lightweight image that stores a specific version of the linter. So the linter may be outdated.

## run

```sh
docker run -v .:/workspace ghcr.io/cryptogarageinc/gha-lint:latest
docker run -v .:/workspace ghcr.io/cryptogarageinc/gha-lint-light:latest
```

## on local

### build on local

```sh
docker build --platform linux/amd64 -t gha-lint:local -f ./Dockerfile .
docker build --platform linux/amd64 -t gha-lint-light:local -f ./light.dockerfile .
```

### run on local

```sh
docker run -v .:/workspace gha-lint:local
docker run -v .:/workspace gha-lint-light:local
```
