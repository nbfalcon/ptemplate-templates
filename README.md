# About

This repository hosts a collection of templates for use with the
[ptemplate](https://github.com/nbfalcon/ptemplate) plugin. Currently, there are
only templates for projects, but directory templates, for example to generate
C++ classes (header, source file) might be added at some point (ptemplate itself
already supports this).

# Installation

To make use of the templates in this repository, simply clone it and point
ptemplate to it:

```emacs-lisp
(with-eval-after-load 'ptemplate
  (add-to-list 'ptemplate-template-dirs "$PATH_TO_CHECKOUT/project-templates"))
```

(replace \$PATH_TO_CHECKOUT with the actual location)
