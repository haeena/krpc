#!/bin/bash

cat config.bzl | grep '^ksp_version_max = ' | sed -n -e "s/ksp_version_max[[:space:]]*=[[:space:]]*'\(.*\)'/\1/p"
