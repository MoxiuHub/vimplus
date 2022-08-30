#!/bin/bash
set -e	# or use "set -o errexit" to quit on error.
set -x  # or use "set -o xtrace" to print the statement before you execute it.

go install github.com/klauspost/asmfmt/cmd/asmfmt@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/kisielk/errcheck@latest
go install github.com/davidrjenni/reftools/cmd/fillstruct@master
go install github.com/rogpeppe/godef@latest
go install golang.org/x/tools/cmd/goimports@master
go install github.com/mgechev/revive@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install honnef.co/go/tools/cmd/staticcheck@latest
go install github.com/fatih/gomodifytags@latest
go install golang.org/x/tools/cmd/gorename@master
go install github.com/jstemmer/gotags@master
go install golang.org/x/tools/cmd/guru@master
go install github.com/josharian/impl@master
go install honnef.co/go/tools/cmd/keyify@master
go install github.com/fatih/motion@latest
go install github.com/koron/iferr@master
go install golang.org/x/tools/gopls@latest

