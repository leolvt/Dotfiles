#!/bin/bash
TEXMFDIR=${TEXMFHOME:-$HOME/.local/share/texmf}

run() {
	case "$1" in
		create)
			makedirs
			;;
		remove)
			removedirs
			;;
		*)
			if [[ $1 ]]; then
				echo "Unknown command: $1"
			fi
			echo "Usage: $0 {create|remove}"
			exit 1
			;;
	esac
}

makedirs() {
	mkdir -p $TEXMFDIR/
	mkdir -p $TEXMFDIR/bibtex
	mkdir -p $TEXMFDIR/bibtex/bib
	mkdir -p $TEXMFDIR/bibtex/bib/base
	mkdir -p $TEXMFDIR/bibtex/bib/misc
	mkdir -p $TEXMFDIR/bibtex/bst
	mkdir -p $TEXMFDIR/bibtex/bst/base
	mkdir -p $TEXMFDIR/bibtex/bst/misc
	mkdir -p $TEXMFDIR/doc
	mkdir -p $TEXMFDIR/fonts
	mkdir -p $TEXMFDIR/fonts/map
	mkdir -p $TEXMFDIR/fonts/lig
	mkdir -p $TEXMFDIR/fonts/enc
	mkdir -p $TEXMFDIR/metafont
	mkdir -p $TEXMFDIR/metafont/base
	mkdir -p $TEXMFDIR/metafont/misc
	mkdir -p $TEXMFDIR/metafont/support
	mkdir -p $TEXMFDIR/metapost
	mkdir -p $TEXMFDIR/metapost/base
	mkdir -p $TEXMFDIR/metapost/misc
	mkdir -p $TEXMFDIR/metapost/support
	mkdir -p $TEXMFDIR/mtf
	mkdir -p $TEXMFDIR/source
	mkdir -p $TEXMFDIR/scripts
	mkdir -p $TEXMFDIR/tex
	mkdir -p $TEXMFDIR/tex/generic
	mkdir -p $TEXMFDIR/tex/generic/hyphen
	mkdir -p $TEXMFDIR/tex/generic/images
	mkdir -p $TEXMFDIR/tex/generic/misc
	mkdir -p $TEXMFDIR/tex/latex
}

removedirs() {
	makedirs
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/tex/latex
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/tex/generic/misc
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/tex/generic/images
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/tex/generic/hyphen
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/tex/generic
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/tex
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/source
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/scripts
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/mtf
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/metapost/support
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/metapost/misc
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/metapost/base
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/metapost
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/metafont/support
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/metafont/misc
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/metafont/base
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/metafont
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/fonts/map
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/fonts/lig
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/fonts/enc
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/fonts
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/doc
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/bibtex/bst/misc
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/bibtex/bst/base
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/bibtex/bst
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/bibtex/bib/misc
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/bibtex/bib/base
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/bibtex/bib
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/bibtex
	rmdir --ignore-fail-on-non-empty $TEXMFDIR/
}


# ==============================

run $@

