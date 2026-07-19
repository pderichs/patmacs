;;; patmacs.el -*- lexical-binding: t; -*-

(patmacs/load-required "user-env.el")
(patmacs/load-required "functions.el")
(patmacs/load-required "defaults.el")
(patmacs/load-required "gc.el")
(patmacs/load-required "evil.el")
(patmacs/load-required "general.el")
(patmacs/load-required "completion.el")
(patmacs/load-required "eglot-treesitter.el")
(patmacs/load-required "org.el")
(patmacs/load-required "projectile.el")
(patmacs/load-required "magit.el")
(patmacs/load-required "packages.el")
(patmacs/load-required "elfeed.el")
(patmacs/load-required "themes.el")
(patmacs/load-required "keys.el")
(patmacs/load-required "latex.el")
(patmacs/load-required "gptel.el")
(patmacs/load-required "gpg.el")
(patmacs/load-required "ui.el")

;; Optional extensions
(patmacs/load-if-exists "user-prodigy.el")

(when (eq system-type 'darwin)
  (message "Loading mac specific options...")
  (patmacs/load-if-exists "mac.el"))

(patmacs/load-if-exists "user-after-init.el")

;;; patmacs.el ends here
