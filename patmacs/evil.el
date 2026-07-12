;;; evil.el -*- lexical-binding: t; -*-
(use-package evil
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil ; required for evil-collection
        evil-want-C-u-scroll t
        evil-want-C-i-jump nil
        evil-respect-visual-line-mode t
        evil-undo-system 'undo-redo ; integrated undo-redo (Emacs 28+)
        evil-search-module 'evil-search
        evil-split-window-below t
        evil-want-fine-undo t
        evil-vsplit-window-right t)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") #'evil-normal-state)
  ;; "-" selects the line
  (define-key evil-normal-state-map (kbd "-") #'evil-visual-line))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; comment / uncomment with gc / gcc
(use-package evil-commentary
  :after evil
  :config (evil-commentary-mode))

;; Surround with cs, ds, ys
(use-package evil-surround
  :after evil
  :config (global-evil-surround-mode 1))

;; Multiedit (mn/ma or M-d/M-D)
(use-package evil-multiedit
  :after evil
  :commands (evil-multiedit-match-and-next evil-multiedit-match-all)
  :config (evil-multiedit-default-keybinds))

;; Repeatable f/F/t/T
(use-package evil-snipe
  :after evil
  :config
  (evil-snipe-override-mode 1))

;;; evil.el ends here
