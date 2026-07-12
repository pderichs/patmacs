;;; mac.el -*- lexical-binding: t; -*-

;; left option key stays meta, make right one support special chars
(setq ns-option-modifier 'meta
      ns-right-option-modifier 'none)

;; Improve performance on mac
(setq fast-but-imprecise-scrolling t)
(setq redisplay-skip-fontification-on-input t)
(setq scroll-conservatively 101)  ; no recentering jump
(setq scroll-margin 4)

;;; mac.el ends here
