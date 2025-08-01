#!/bin/sh

if [ -z "$DISABLE_PINACT" ]; then
  go run github.com/suzuki-shunsuke/pinact/v3/cmd/pinact@latest run
  echo "finish pinact"
else
  echo "skip pinact"
fi

if [ -z "$DISABLE_ACTIONLINT" ]; then
  go run github.com/rhysd/actionlint/cmd/actionlint@latest
  echo "finish actionlint"
else
  echo "skip actionlint"
fi

if [ -z "$DISABLE_GHALINT" ]; then
  go run github.com/suzuki-shunsuke/ghalint/cmd/ghalint@latest run
  echo "finish ghalint"
else
  echo "skip ghalint"
fi
