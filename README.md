# About

This repository hosts a collection of templates for use with the
[ptemplate](https://github.com/nbfalcon/ptemplate) plugin. Currently, there are
only templates for projects, but directory templates, for example to generate
C++ classes (header, source file) might be added at some point (ptemplate itself
already supports this, trough `ptemplate-expand-template`).

# Installation

This package is on `MELPA`, and can therefore be installed trough usual means
(`package-install`, `use-package`, …). Additional set-up is needed though:

# Set-up

After installing this package, the templates here have to be explicitly enabled.
For this, an auto-loaded minor-mode has been provided:

``` emacs-lisp
(eval-after-load 'ptemplate '(ptemplate-templates-mode 1))
```

If `use-package` is available:

``` emacs-lisp
(use-package ptemplate-templates
  :after (ptemplate)
  :config (ptemplate-templates-mode 1))
```

It can also be turned off (`(ptemplate-templates-mode -1)`), causing the
templates to become unavailable again.
