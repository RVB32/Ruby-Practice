#!/usr/bin/env bash

if [ -s $1 ]; then
  exit 0
else
  exit 1
fi
