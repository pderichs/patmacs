 ;;; init.el -*- lexical-binding: t; -*-

;; Load tool functions
(load-file (locate-user-emacs-file "patmacs/bootstrap.el"))

;; Setup custom file
(setq custom-file (locate-user-emacs-file "var/custom.el"))

(require 'package)
(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t ; Install packages on demand
      use-package-expand-minimally t
      use-package-compute-statistics nil) ; t for `use-package-report'

(patmacs/load-required "patmacs.el")

;;; init.el ends here
