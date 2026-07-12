;;; gc.el -*- lexical-binding: t; -*-

(use-package gcmh
  :hook (emacs-startup . gcmh-mode)
  :config
  (setq gcmh-idle-delay 'auto
        gcmh-high-cons-threshold (* 64 1024 1024)))

;;; gc.el ends here
