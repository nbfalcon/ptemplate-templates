;;; ptemplate-templates.el --- Official templates -*- lexical-binding: t -*-

;; Copyright (C) 2020  Nikita Bloshchanevich

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;; Author: Nikita Bloshchanevich <nikblos@outlook.com>
;; URL: https://github.com/nbfalcon/ptemplate-templates
;; Package-Requires: ((emacs "25.1") (ptemplate "2.0.0"))
;; Version: 0.1.0

;;; Commentary:
;; This modules provides a loader for the collection of `ptemplate' templates in
;; this repository. To use it, simply install the package; it will automatically
;; (using autoloads) integrate with `ptemplate', making its templates show up in
;; `ptemplate-new-project' and `ptemplate-expand-template' (TODO).
;;
;; If you cannot use the autoloads of this package, add the following to your
;; .init.el: (eval-after-load 'ptemplate (ptemplate-templates-mode 1))

;;; Code:

(require 'cl-lib)                       ; `cl-delete', `cl-loop'

(defconst ptemplate-templates--rsc-dir
  (file-name-directory
   (cond (load-in-progress load-file-name)
         ((and (boundp 'byte-compile-current-file) byte-compile-current-file))
         (t (buffer-file-name))))
  "Absolute path to the \"rsc/\" directory of this repository.")

(defun ptemplate-templates--rsc (path)
  "Expand PATH relative to `ptemplate-templates--rsc-dir'.
The result is an absolute path to the resource"
  (expand-file-name (concat (file-name-as-directory "rsc") path)
                    ptemplate-templates--rsc-dir))

(defun ptemplate-templates--remove-from-list
    (list-var element &optional compare-fn)
  "The inverse of `add-to-list'.
Remove all occurrences of ELEMENT in LIST-VAR. COMPARE-FN is used
to test for equality between elements.

Unless otherwise stated, the behaviour of this function is
identical to that of `add-to-list'."
  (set list-var (cl-delete element (symbol-value list-var) :test compare-fn)))

(defconst ptemplate-templates-templates
  '((ptemplate-project-template-dirs "project-templates"))
  "Alist (VAR . RSC-DIR...) listing this package's templates.
VAR is a template directory list variable, like
`ptemplate-project-template-dirs', while RSC-DIR... is a list of
\"rsc/\" relative paths to template directories.

These templates are registered and unregistered in
`ptemplate-templates-mode'.")

;;;###autoload
(define-minor-mode ptemplate-templates-mode
  "If on, the templates in this repository will be enabled.
Toggles whether the templates in this repository should be made
available to `ptemplate-new-project' and
`ptemplate-expand-template'."
  :global t
  :group 'ptemplate-templates
  :init-value nil
  :lighter nil
  (defvar ptemplate-project-template-dirs)
  (cond
   (ptemplate-templates-mode
    (require 'ptemplate)
    (cl-loop for (var . rsc-dirs) in ptemplate-templates-templates do
             (mapc (apply-partially #'add-to-list var)
                   (mapcar #'ptemplate-templates--rsc rsc-dirs))))
   (t
    (cl-loop for (var . rsc-dirs) in ptemplate-templates-templates do
             (mapc (apply-partially
                    #'ptemplate-templates--remove-from-list var)
                   (mapcar #'ptemplate-templates--rsc rsc-dirs))))))

;;; auto-configure
;; `yasnippet-snippets' also configures itself in an autoloaded
;; `eval-after-load' block, so doing that probably is acceptable.
;; REVIEW: is this a good idea?
;;;###autoload
(eval-after-load 'ptemplate (ptemplate-templates-mode 1))

(provide 'ptemplate-templates)
;;; ptemplate-templates.el ends here
