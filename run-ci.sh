#!/bin/bash

function log() {
  local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  echo "$1 at $timestamp: $2"
}

function abort() {
  log "ERROR" "test case $1 has failed"
  exit 1
}

function print-box() {
  printf "\\n"
  echo ".----------------------------------------------------------------."
  printf "| %-62s |\\n" "$1"
  echo "'----------------------------------------------------------------'"
}

function enter-section() {
  print-box "$1"

  log "INFO" "running task in section $1: $2"
  log "INFO" "section output following..."
  printf "\\n"

  eval "$2"
  exit_status=$?

  if [ "$3" == "should fail" ]; then
    log "INFO" "expected to fail..."
    if [ $exit_status -eq 0 ]; then
      abort "command: $2 failed in section: $1 with: $exit_status"
    fi
  else
    log "INFO" "expected to pass..."
    if [ ! $exit_status -eq 0 ]; then
      abort "command: $2 failed in section: $1 with: $exit_status"
    fi
  fi

  printf "\\n"
  log "INFO" "section $1 completed successfully"
}

enter-section "Typstyle checking" "./run-fmt.sh --check src/lib.typ" 0
enter-section "Compiling template..." "typst compile template/main.typ --root . example.pdf"
enter-section "TEST: local template import" "typst compile tests/local-import/main.typ --root ."
enter-section "TEST: invalid config case 1" "typst compile tests/invalid-config/test-case-1.typ --root ." "should fail"
enter-section "TEST: invalid config case 2" "typst compile tests/invalid-config/test-case-2.typ --root ."
enter-section "TEST: invalid config case 3" "typst compile tests/invalid-config/test-case-3.typ --root ." "should fail"

log "INFO" "CI completed successfully"
