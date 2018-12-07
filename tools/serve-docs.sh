#!/bin/bash

# Usage tools/serve-docs.sh [PORT]

set -e

port=${1:-8080}
src=bazel-genfiles/doc/srcs
stage=bazel-genfiles/doc/srcs-stage
env=bazel-bin/doc/serve/env
out=bazel-bin/doc/serve/out

# Set up bazel
if [ ! -d "bazel-bin" ]; then
    bazel build //:krpc
fi
bazel fetch //...
mkdir -p `dirname $env`

# Set up python environment
if [ ! -d "$env" ]; then
  virtualenv $env
  source $env/bin/activate
  pip install --upgrade \
      "six==1.11.0" \
      "pbr==4.3.0" \
      "setuptools==40.4.3" \
      "setuptools-git==1.2"
  pip install "Sphinx==1.8.1"
  CFLAGS="-O0" pip install "lxml==4.2.5"
  pip install \
      "sphinx_rtd_theme==0.4.2" \
      "sphinxcontrib_spelling==4.2.0" \
      "sphinx-csharp==0.1.6" \
      "sphinx-tabs==1.1.7" \
      "javasphinx==0.9.15" \
      https://github.com/djungelorm/sphinx-lua/releases/download/0.1.4/sphinx-lua-0.1.4.tar.gz
  pip install sphinx-autobuild pyinotify
else
  source $env/bin/activate
fi

# Auto-serve and auto-build the docs
python tools/do-serve-docs.py $port $src $stage $out
