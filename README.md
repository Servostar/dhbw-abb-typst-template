
# DHBW-ABB Typst template 📃

![last-commit-bade](https://img.shields.io/gitea/last-commit/dhbw/dhbw-abb-typst-template?gitea_url=https%3A%2F%2Fgit.montehaselino.de)
![release-badge](https://img.shields.io/gitea/v/release/dhbw/dhbw-abb-typst-template?gitea_url=https%3A%2F%2Fgit.montehaselino.de&display_name=release)
![typst-badge](https://img.shields.io/badge/Typst-2B9CB0)
![language-count-badge](https://img.shields.io/gitea/languages/count/dhbw/dhbw-abb-typst-template?gitea_url=https%3A%2F%2Fgit.montehaselino.de)
![license-badge](https://img.shields.io/badge/license-MIT-ff0000)

**Unofficial** but feature rich Typst template for writing a thesis or report at DHBW with according ABB AG branding in mind.

![thumbnail](https://git.montehaselino.de/DHBW/dhbw-abb-typst-template/raw/commit/cd325b7076da91e58849512539460a481e48ef4e/assets/thumbnail.png)

## Features

> ⚠️ **Notice** <br>
> Typst ist under active development and thus may lack features an experienced LaTeX is used to. 

This template includes designs for a titlepage, confidantiality statement, declaration of authorship and more with a consistent design inspired by various unofficial works made by students at DHBW. Layout and the choise fonts are based on the unofficial [supercharged-dhbw](https://github.com/DannySeidel/typst-dhbw-template) Typst template. It comes with automatic generation of outlines for figures, tables, code snippets and appendices.
The template can generate sections for a glossary, combinging acronyms and technical terms into a singular section.

## Format
All pages have a margin of 2.5cm between header/footer/content and the page border.
Header and footer do not overlap into this margin in order to conform to university requirements.

Bibliography is formated with the IEEE style. <br>
Appendecies make use of an abbreviation of APA style.

Complies with ABB branding guidelines such as:
- proper usage of the logo
- respecting the logo safe area
- brand colors (in syntax highlightning)

## Fonts

Both fonts used in the document are licensed under the [Open Font License](https://openfontlicense.org/) and can be used for non-commercial as well as commercial purposes. They can be downloaded from google fonts:
- [Montserrat](https://fonts.google.com/specimen/Montserrat)
- [Open Sans](https://fonts.google.com/specimen/Open+Sans)

Consider giving the creators of the font credit for their amazing work!

## For users jumping over from LaTeX

The developers around Typst have made pretty handy comparison guide between LaTeX and Typst syntax and features. You can find it [here](https://typst.app/docs/guides/guide-for-latex-users/).

## Legal

This template and its content is in no way officially affiliaterd with either DHBW or ABB AG.
Its only purpose is to simplify the process of getting started with the typsetting language Typst for writing a university report or thesis. 
As author and owner of the reposity I claim no copyright of the logos used in the document, the software used to compile the source or the documents based on this template. 

## FAQ

### Why Typst instead of LaTeX?

LaTeX is quite old. Which does not make it bad just because. But with its age and historically grown way of dealing with pretty much any kind of task - has made LaTeX cumbersome to work with. The syntax is outdated for sure but the most annoying issues (for me personally) are the following:
- long compilation times
- poor documentation of build systems such as `latexmk`
- lots of stuff requires extra programs to be run in between
- page layout is easy to mess up
- HUGE installation size

Typst in comparison is serval orders of magnitudes faster and has native support for UTF-8. It automatically runs several times to generate the proper layout and links. Additionally being open source and written in Rust it is contained within a single handy binary.

**TLDR;** I find Typst easier and faster to work with.

### Where are the logos from?

The logos for both ABB AG and DHBW are freely available at Wikimedia Commons:
- [ABB logo as svg](https://commons.wikimedia.org/wiki/File:ABB_logo.svg)
- [DHBW logo as svg](https://upload.wikimedia.org/wikipedia/de/1/1d/DHBW-Logo.svg)