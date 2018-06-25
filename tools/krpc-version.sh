#!/bin/bash

cat config.bzl | grep '^version = ' | sed -n -e "s/version[[:space:]]*=[[:space:]]*'\(.*\)'/\1/p"
