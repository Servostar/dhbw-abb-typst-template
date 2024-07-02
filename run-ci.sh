#!/bin/bash

function abort() {
  echo "test case `$1` has failed" 1>&2
  exit 1
}

echo "Compiling template..."
typst compile template/main.typ --root . || abort "template"

echo "Running tests..."

echo "Running test local-import..."
typst compile tests/local-import/main.typ --root . || abort "local-import"

echo "Running test invalid-config..."

echo "Expected to fail..."
typst compile tests/invalid-config/test-case-1.typ --root .
if [ $? -eq 0 ]; then
  abort "invalid-config case 1"
fi

typst compile tests/invalid-config/test-case-2.typ --root . || abort "invalid-config case 2"

echo "Expected to fail..."
typst compile tests/invalid-config/test-case-3.typ --root .
if [ $? -eq 0 ]; then
  abort "invalid-config case 3b"
fi


echo "Tests completed successfully"
