;;; packages.el -*- lexical-binding: t; -*-

(use-package which-key
  :ensure nil
  :init (which-key-mode)
  :config (setq which-key-idle-delay 0.4))

;; Dired: suggest other opened dired folder location if available
(use-package dired
  :ensure nil
  :custom
  (dired-dwim-target t)
  (dired-recursive-copies 'always)
  (dired-recursive-deletes 'always)
  (dired-listing-switches "-alh --group-directories-first")
  :config
  (unless (string-match-p "gnu/linux" (symbol-name system-type))
    (if (executable-find "gls")
        (setq insert-directory-program "gls")
      (setq dired-listing-switches "-alh"))))

(use-package prodigy
  :defer t
  :config)

(use-package f)

(use-package avy
  :init
  (setq avy-all-windows 'all-frames)
  :commands (avy-goto-char-2 avy-goto-char avy-goto-line))

(use-package expand-region
  :commands er/expand-region)

(use-package back-button
  :config (back-button-mode 1))

(use-package goto-last-change
  :commands goto-last-change)

(use-package neotree
  :commands neotree-toggle
  :config
  (setq neo-theme 'arrow
        neo-smart-open t))

(use-package eradio
  :commands (eradio-play eradio-stop eradio-toggle)
  :config
  (setq eradio-player '("mpv" "--no-video" "--no-terminal"))
  (setq eradio-channels
        '(;; ("SomaFM Doomed" . "https://somafm.com/doomed.pls")
          )))

(use-package olivetti
  :commands olivetti-mode
  :custom (olivetti-body-width 100))

(use-package elpher
  :commands elpher)

(use-package nim-mode
  :mode "\\.nim\\'")

(use-package xkcd
  :commands (xkcd xkcd-get-latest))

(use-package fzf
  :commands (fzf fzf-git-files fzf-projectile fzf-find-file))

(use-package zoxide
  :commands (zoxide-find-file zoxide-travel zoxide-cd))

(use-package zeal-at-point
  :commands zeal-at-point)

(use-package gptel
  :defer t)

(use-package rg
  :defer t)

(use-package ag
  :defer t)

(use-package restclient
  :defer t)

(use-package pdf-tools
  :defer t)

(use-package csv-mode
  :defer t)

(use-package dockerfile-mode
  :defer t)

(use-package plantuml-mode
  :defer t)

(use-package pandoc
  :defer t)

(use-package markdown-mode
  :defer t)

(use-package go-mode
  :defer t)

(patmacs/load-if-exists "user-packages.el")

;;; packages.el ends here
