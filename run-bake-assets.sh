#!/bin/bash

cd baker

echo "==> generate assets"
nix-shell --run "./run-bake-banner.sh ../example.pdf"
