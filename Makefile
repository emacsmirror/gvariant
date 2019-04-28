CASK = cask

.PHONY: test test-setup

test-setup:
	$(CASK) --verbose install

test:
	$(CASK) emacs -batch -L . -l ert -l gvariant-tests.el -f ert-run-tests-batch-and-exit
