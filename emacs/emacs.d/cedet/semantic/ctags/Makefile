# Automatically Generated Makefile by EDE.
# For use with: make
#
# DO NOT MODIFY THIS FILE OR YOUR CHANGES MAY BE LOST.
# EDE is the Emacs Development Environment.
# http://cedet.sourceforge.net/ede.shtml
#

top=../
ede_FILES=Project.ede Makefile

ctags_LISP=semantic-ectag-util.el semantic-ectag-lang.el semantic-ectag-parse.el semanticdb-ectag.el semantic-ectag-lang2.el
EMACS=emacs
EMACSFLAGS=-batch --no-site-file
LOADPATH= ../bovine/ ../../eieio/ ../ ../../common/
ELISPPRELOAD= cedet-compat
VERSION=2.1
DISTDIR=$(top)semantic-$(VERSION)/ctags



all: ctags

.PHONY: ctags
ctags: $(ctags_LISP)
	@echo "(add-to-list 'load-path nil)" > $@-compile-script
	for loadpath in . ${LOADPATH}; do \
	   echo "(add-to-list 'load-path \"$$loadpath\")" >> $@-compile-script; \
	done;
	for preload in ${ELISPPRELOAD}; do \
	   echo "(load \"$$preload\")" >> $@-compile-script; \
	done;
	@echo "(setq debug-on-error t)" >> $@-compile-script
	"$(EMACS)" $(EMACSFLAGS) -l $@-compile-script -f batch-byte-compile $^

tags: 


clean:
	rm -f *.elc

.PHONY: dist

dist:
	mkdir $(DISTDIR)
	cp $(ctags_LISP) $(ede_FILES) $(DISTDIR)

Makefile: Project.ede
	@echo Makefile is out of date!  It needs to be regenerated by EDE.
	@echo If you have not modified Project.ede, you can use 'touch' to update the Makefile time stamp.
	@false



# End of Makefile