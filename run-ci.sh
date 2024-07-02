#!/bin/bash

set -e

function abort() {
  echo "test case `$1` has failed" 1>&2
  exit 1
}

echo "Compiling template..."
typst compile template/main.typ --root . || abort "template"

echo "Running tests..."

echo "Running test local-import..."
typst compile tests/local-import/main.typ --root . || abort "local-import"

echo "Tests completed successfully"
