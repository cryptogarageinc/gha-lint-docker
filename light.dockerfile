FROM alpine:3.22.1

RUN apk add --no-cache curl

WORKDIR /usr/local
RUN PINACT_VERSION=3.3.2 && \
    ACTIONLINT_VERSION=1.7.7 && \
    GHALINT_VERSION=1.5.3 && \
    ARCH=$(uname -m) && \
    echo "ARCH=$ARCH" && \
    if test "$ARCH" = "aarch64" || test "$ARCH" = "arm64"; then \
        ARCH_NAME=arm64 ;\
    else \
        ARCH_NAME=amd64 ;\
    fi && \
    PINACT_FILE=pinact_linux_${ARCH_NAME} && \
    ACTIONLINT_FILE=actionlint_${ACTIONLINT_VERSION}_linux_${ARCH_NAME} && \
    GHALINT_FILE=ghalint_${GHALINT_VERSION}_linux_${ARCH_NAME} && \
    curl -OL "https://github.com/suzuki-shunsuke/pinact/releases/download/v${PINACT_VERSION}/${PINACT_FILE}.tar.gz" && \
    tar -zxf "${PINACT_FILE}.tar.gz" pinact && \
    mv ./pinact /usr/local/bin/ && \
    rm "${PINACT_FILE}.tar.gz" && \
    chmod +x /usr/local/bin/pinact && \
    curl -OL "https://github.com/rhysd/actionlint/releases/download/v${ACTIONLINT_VERSION}/${ACTIONLINT_FILE}.tar.gz" && \
    tar -zxf "${ACTIONLINT_FILE}.tar.gz" actionlint && \
    mv ./actionlint /usr/local/bin/ && \
    rm "${ACTIONLINT_FILE}.tar.gz" && \
    chmod +x /usr/local/bin/actionlint && \
    curl -OL "https://github.com/suzuki-shunsuke/ghalint/releases/download/v${GHALINT_VERSION}/${GHALINT_FILE}.tar.gz" && \
    tar -zxf "${GHALINT_FILE}.tar.gz" ghalint && \
    mv ./ghalint /usr/local/bin/ && \
    rm "${GHALINT_FILE}.tar.gz" && \
    chmod +x /usr/local/bin/ghalint

WORKDIR /scripts
COPY ./scripts/exec_bin.sh .

WORKDIR /workspace

CMD [ "/bin/sh", "-c", "/scripts/exec_bin.sh" ]
