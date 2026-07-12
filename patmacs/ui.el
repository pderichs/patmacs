;;; ui.el -*- lexical-binding: t; -*-

(setq-default line-spacing 0.12)
(fringe-mode '(8 . 8))
(window-divider-mode 1)
(setq window-divider-default-places t
      window-divider-default-right-width 1)

(use-package nerd-icons :ensure t)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-bar-width 3)
  (doom-modeline-icon t))

(use-package spacious-padding
  :ensure t
  :config
  (setq spacious-padding-widths
        '(:internal-border-width 15
                                 :header-line-width 4
                                 :mode-line-width 6
                                 :tab-width 4
                                 :right-divider-width 15
                                 :scroll-bar-width 8))
  (spacious-padding-mode 1))

;;; ui.el ends here
