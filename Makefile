PKGNAME  = solus-builder
SUBPKGS  = builder cli scheduler
PROJREPO = github.com/DataDrake

include Makefile.golang
include Makefile.waterlog

GOLINT    = $(GOBIN)/golint -set_exit_status

DESTDIR ?=
PREFIX  ?= /usr
BINDIR   = $(PREFIX)/bin

all: build

build: setup setup-deps
	@$(call stage,BUILD)
	@cd $(GOPROJROOT)/$(PKGNAME); $(GOINSTALL) -v ./... || exit 1;
	@$(call pass,BUILD)

setup:
	@$(call stage,SETUP)
	@$(call task,Setting up project root...)
	@mkdir -p $(GOPROJROOT)
	@$(call task,Setting up symlinks...)
	@if [ ! -d $(GOPROJROOT)/$(PKGNAME) ]; then ln -s $(shell pwd) $(GOPROJROOT)/$(PKGNAME); fi
	@$(call pass,SETUP)

test: build
	@$(call stage,TEST)
	@for d in $(SUBPKGS); do $(GOTEST) ./$$d/... || exit 1; done;
	@$(call pass,TEST)

validate: setup-deps
	@$(call stage,FORMAT)
	@for d in $(SUBPKGS); do $(GOFMT) ./$$d/...|| exit 1; done;
	@$(call pass,FORMAT)
	@$(call stage,VET)
	@$(call task,Running 'go vet'...)
	@cd $(GOPROJROOT)/$(PKGNAME); for d in $(SUBPKGS); do $(GOVET) ./... || exit 1; done;
	@$(call pass,VET)
	@$(call stage,LINT)
	@$(call task,Running 'golint'...)
	@cd $(GOPROJROOT)/$(PKGNAME); for d in $(SUBPKGS); do $(GOLINT) ./$$d/... || exit 1; done;
	@$(call pass,LINT)

setup-deps:
	@$(call stage,DEPS)
	@if [ -z "`which dep 2> /dev/null`" ]; then \
	    echo "Missing 'dep', please install before continuing"; \
	    exit 1; \
	fi
	@if [ ! -e $(GOBIN)/golint ]; then \
	    $(call task,Installing golint...); \
	    $(GOGET) github.com/golang/lint/golint; \
	fi
	@if [ -d build/src/golang.org ]; then rm -rf build/src/golang.org; fi
	@if [ -d build/src/github.com/golang ]; then rm -rf build/src/github.com/golang; fi
	@if [ ! -d vendor ]; then \
	    $(call task,Getting build dependencies...); \
	    cd $(GOPROJROOT)/$(PKGNAME); GOPATH=$(GOPATH) dep ensure; \
	fi

install:
	@$(call stage,INSTALL)
	install -D -m 00755 $(GOBIN)/builder $(DESTDIR)$(BINDIR)/solus-builder
	install -D -m 00755 $(GOBIN)/cli $(DESTDIR)$(BINDIR)/solus-builder-cli
	install -D -m 00755 $(GOBIN)/scheduler $(DESTDIR)$(BINDIR)/solus-scheduler
	@$(call pass,INSTALL)

uninstall:
	@$(call stage,UNINSTALL)
	rm -f $(DESTDIR)$(BINDIR)/solus-builder
	rm -f $(DESTDIR)$(BINDIR)/solus-builder-cli
	rm -f $(DESTDIR)$(BINDIR)/solus-scheduler
	@$(call pass,UNINSTALL)

clean:
	@$(call stage,CLEAN)
	@$(call task,Removing symlinks...)
	@unlink $(GOPROJROOT)/$(PKGNAME)
	@$(call task,Removing build directory...)
	@rm -rf build
	@$(call pass,CLEAN)
