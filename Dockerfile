FROM golang:1.24.5-alpine3.22

WORKDIR /scripts
COPY ./scripts/exec.sh .

WORKDIR /workspace

CMD [ "/bin/sh", "-c", "/scripts/exec.sh" ]
