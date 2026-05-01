FROM golang:1.26.2-alpine3.23

WORKDIR /scripts
COPY ./scripts/exec.sh .

WORKDIR /workspace

CMD [ "/bin/sh", "-c", "/scripts/exec.sh" ]
