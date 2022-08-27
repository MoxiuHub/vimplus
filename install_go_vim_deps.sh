#!/bin/bash

set -e	# or use "set -o errexit" to quit on error.
set -x  # or use "set -o xtrace" to print the statement before you execute it.

go install github.com/nsf/gocode@latest
go install github.com/bradfitz/goimports@latest
go install golang.org/x/tools/cmd/guru@latest
go install golang.org/x/tools/cmd/gorename@latest
go install github.com/rogpeppe/godef@latest
go install github.com/kisielk/errcheck@latest
go install github.com/jstemmer/gotags@latest
go install github.com/klauspost/asmfmt/cmd/asmfmt@latest
go install github.com/fatih/motion@latest
go install github.com/zmb3/gogetdoc@latest
go install github.com/josharian/impl@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/fatih/gomodifytags@latest
go install honnef.co/go/tools/cmd/keyify@latest
go install golang.org/x/lint/golint@latest
go install github.com/davidrjenni/reftools/cmd/fillstruct@master
go install github.com/go-delve/delve/cmd/dlv@master
go install github.com/koron/iferr@master

