;;; magit.el -*- lexical-binding: t; -*-

(use-package magit
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-diff-refine-hunk 'all))

;; Show git changes in the fringe
(use-package diff-hl
  :hook ((prog-mode . diff-hl-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh)))


;;; magit.el ends here
