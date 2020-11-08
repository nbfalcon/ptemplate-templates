# About

This repository hosts a collection of templates for use with the
[ptemplate](https://github.com/nbfalcon/ptemplate) plugin. Currently, there are
only templates for projects, but directory templates, for example to generate
C++ classes (header, source file) might be added at some point (ptemplate itself
already supports this, trough `ptemplate-expand-template`).

# Installation

Currently this package is not yet on `MELPA`, but a PR for that is already in
review. It can still be installed from github, for example with
[`quelpa-use-package`](https://github.com/quelpa/quelpa-use-package):

``` emacs-lisp
(use-package ptemplate-templates
  :quelpa (ptemplate-templates :fetcher github
                               :repo "nbfalcon/ptemplate-templates"))
```

# Set-up

After installing this package, the templates here have to be explicitly enabled.
For this, an auto-loaded minor-mode has been provided:

``` emacs-lisp
(eval-after-load 'ptemplate (ptemplate-templates-mode 1))
```

If `use-package` is available:

``` emacs-lisp
(use-package ptemplate-templates
  ;; `ptemplate-templates-mode' is auto-loaded
  :no-require t
  :after (ptemplate)
  :config (ptemplate-templates-mode 1))
```

It can of course also be turned off (`(ptemplate-templates-mode -1)`), causing
the templates to become unavailable again.

# Additional dependencies

The various templates in this repository may have additional dependencies.
Consult their READMEs for details.
