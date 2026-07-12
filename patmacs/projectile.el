;;; projectile.el -*- lexical-binding: t; -*-

(use-package projectile
  :init
  (projectile-mode 1)
  :custom
  (projectile-project-search-path (list user-base-projects-path))
  (projectile-completion-system 'default)
  (projectile-enable-caching t)
  (projectile-indexing-method 'alien)
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;;; projectile.el ends here
