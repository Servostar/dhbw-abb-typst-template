#!/bin/bash

echo "==> generate images"
mkdir images || true

# extract images from document created by action
mutool convert -o images/1.svg "$1" 1
mutool convert -o images/2.svg "$1" 2
mutool convert -o images/2.svg "$1" 2
mutool convert -o images/3.svg "$1" 5
mutool convert -o images/7.svg "$1" 7
mutool convert -o images/4.svg "$1" 15
mutool convert -o images/5.svg "$1" 16

echo "==> generate banner"
typst compile banner.typ --ppi 360 ../assets/banner.png
echo "==> generate preview"
typst compile preview.typ --ppi 360 ../assets/page-preview.png
