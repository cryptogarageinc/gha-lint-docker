#!/bin/sh

if [ -z "$DISABLE_PINACT" ]; then
  pinact run
  echo "finish pinact"
else
  echo "skip pinact"
fi

if [ -z "$DISABLE_ACTIONLINT" ]; then
  actionlint
  echo "finish actionlint"
else
  echo "skip actionlint"
fi

if [ -z "$DISABLE_GHALINT" ]; then
  ghalint run
  echo "finish ghalint"
else
  echo "skip ghalint"
fi
