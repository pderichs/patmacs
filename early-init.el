;;; early-init.el -*- lexical-binding: t; -*-

;; Defer Garbage Collection for startup
;; gcmh will update the value afterwards
(setq gc-cons-threshold (* 512 1024 1024)
      gc-cons-percentage 0.6)

;; Turn off UI early to avoid flickering
(setq default-frame-alist
      '((menu-bar-lines . 0)
        (tool-bar-lines . 0)
        (vertical-scroll-bars . nil)
        (horizontal-scroll-bars . nil)
        (width  . 145)
        (height . 100)))
(push '(menu-bar-mode . -1) initial-frame-alist)
(setq menu-bar-mode nil
      tool-bar-mode nil
      scroll-bar-mode nil)

;; Enable native compilation
(setq native-comp-async-report-warnings-errors 'silent
      native-comp-jit-compilation t)

;; Some startup optimizations
(setq frame-inhibit-implied-resize t
      inhibit-startup-screen t
      inhibit-startup-echo-area-message user-login-name
      initial-scratch-message nil
      package-enable-at-startup t)

;; UTF-8 everywhere
(set-language-environment "UTF-8")
(setq default-input-method nil)

;;; early-init.el ends here
