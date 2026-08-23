;;; evil.el -*- lexical-binding: t; -*-
(use-package evil
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil ; required for evil-collection
        evil-want-C-u-scroll t
        evil-want-C-i-jump nil
        evil-respect-visual-line-mode nil
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

;; Multiple cursors: M-S-<down>/M-S-<up> add a cursor one line below/above,
;; same column (like Sublime/VS Code's Ctrl+Alt+Down/Up)
(use-package evil-mc
  :after evil
  :config
  (global-evil-mc-mode 1)
  (define-key evil-normal-state-map (kbd "M-S-<down>") #'evil-mc-make-cursor-move-next-line)
  (define-key evil-normal-state-map (kbd "M-S-<up>")   #'evil-mc-make-cursor-move-prev-line)
  (define-key evil-visual-state-map (kbd "M-S-<down>") #'evil-mc-make-cursor-move-next-line)
  (define-key evil-visual-state-map (kbd "M-S-<up>")   #'evil-mc-make-cursor-move-prev-line)

  (define-key evil-normal-state-map  [escape] #'patmacs/evil-mc-undo-cursors-and-escape)
  (define-key evil-visual-state-map  [escape] #'patmacs/evil-mc-undo-cursors-and-escape)
  (define-key evil-insert-state-map  [escape] #'patmacs/evil-mc-undo-cursors-and-escape)
  (define-key evil-replace-state-map [escape] #'patmacs/evil-mc-undo-cursors-and-escape))

;;; evil.el ends here
