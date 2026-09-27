#!/usr/bin/env bash

# SPDX-License-Identifier: AGPL-3.0

#    -----------------------------------------------------
#    Copyright © 2024, 2025, 2026  Pellegrino Prevete
#
#    All rights reserved
#    -----------------------------------------------------
#
#    This program is free software: you can redistribute
#    it and/or modify it under the terms of the
#    GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of
#    the License, or (at your option) any later version.
#
#    This program is distributed in the hope that it
#    will be useful, but WITHOUT ANY WARRANTY;
#    without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#    See the GNU Affero General Public License for
#    more details.
#
#    You should have received a copy of the
#    GNU Affero General Public License
#    along with this program.
#    If not, see <https://www.gnu.org/licenses/>.

SHELL = bash
_PROJECT=android-input-utils
PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
DATA_DIR=$(DESTDIR)$(PREFIX)/share/$(_PROJECT)
MAN_DIR?=$(DESTDIR)$(PREFIX)/share/man

MAN_FILES=\
  $(wildcard *1.rst)

DOCS_FILES=\
  $(wildcard *.md)

_INSTALL_FILE=\
  install \
    -vDm644
_INSTALL_EXE=\
  install \
    -vDm755
_INSTALL_DIR=\
  install \
    -vdm755

all: build-man

install: install-doc install-man

build-man:

	mkdir \
	  -p \
	  "build"
	for _file in $(MAN_FILES); do \
	  rst2man \
	    "$${_file}" \
	    "$${PWD}/build/$${_file%.rst}"; \
	done

clean:

	rm \
	  -vrf \
	  "build"

install-doc:

	# $(INSTALL_FILE) \
	#   $(DOC_FILES) \
	#   -t \
	#   $(DOC_DIR)
	$(INSTALL_FILE) \
	  "README.md" \
	  -t \
	  $(DOC_DIR)/README.man.md

install-man:

	$(_INSTALL_DIR) \
	  "$(MAN_DIR)/man1"
	if [[ ! -e "build" ]]; then \
	  make \
	    build-man; \
	fi
	for _file in $(MAN_FILES); do \
          $(_INSTALL_FILE) \
	    "$${PWD}/build/$${_file%.rst}" \
	    "$(MAN_DIR)/man1/$${_file%.rst}"; \
	done

uninstall-man:

	for _file in $(MAN_FILES); do \
	  rm \
	    -vrf \
	    "$(MAN_DIR)/man1/$${_file%.rst}"; \
	done

.PHONY: build-man clean install install-doc install-man uninstall-man
