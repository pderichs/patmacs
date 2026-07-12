;;; themes.el -*- lexical-binding: t; -*-

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-org-config))

(use-package ef-themes         :defer t)
(use-package standard-themes   :defer t)
(use-package kaolin-themes     :defer t)
(use-package spacemacs-theme   :defer t)
(use-package base16-theme      :defer t)

(use-package gruvbox-theme                  :defer t)
(use-package nord-theme                     :defer t)
(use-package dracula-theme                  :defer t)
(use-package catppuccin-theme               :defer t)
(use-package zenburn-theme                  :defer t)
(use-package color-theme-sanityinc-tomorrow :defer t)
(use-package monokai-theme                  :defer t)
(use-package material-theme                 :defer t)
(use-package timu-spacegrey-theme           :defer t)
(use-package weyland-yutani-theme           :defer t)

(use-package solarized-theme   :defer t)
(use-package tao-theme         :defer t)
(use-package humanoid-themes   :defer t)


;; Highlight current line
(global-hl-line-mode 1)

(with-eval-after-load 'hl-line
  (set-face-attribute 'hl-line nil
                      :background "#eaf2fb"
                      :foreground 'unspecified
                      :inherit    'unspecified)
  )

(load-theme user-theme t)

;;; themes.el ends here
