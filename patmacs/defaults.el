;;; defaults.el -*- lexical-binding: t; -*-

(setq-default indent-tabs-mode nil
              tab-width 2
              fill-column 100)

;; Font
(apply #'set-face-attribute 'default nil
       :height (if (and (boundp 'user-font-size) user-font-size)
                   user-font-size
                 150)
       (when (and (boundp 'user-font-family) user-font-family)
         (list :family user-font-family)))

(setq make-backup-files nil
      auto-save-default nil
      create-lockfiles nil
      confirm-kill-processes nil
      use-short-answers t ; y/n
      ring-bell-function 'ignore
      sentence-end-double-space nil)

(when (and custom-file (stringp custom-file) (file-exists-p custom-file))
  (load custom-file nil 'nomessage))

;; Reload files automatically when they change on disk
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;; History / Recent Files
(savehist-mode 1)
(recentf-mode 1)
(setq history-length 500
      recentf-max-saved-items 200)

(setq kill-ring-max 100)

;; Enable line numbers globally
(global-display-line-numbers-mode 1)
;;(setq display-line-numbers-type 'relative)

(add-hook 'prog-mode-hook #'electric-pair-mode)
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Windows / Buffers
(setq-default truncate-lines t)
(pixel-scroll-precision-mode 1)

(defvar patmacs/frame-title-max-length 100
  "Maximum length for file names shown in the frame title.")

(defun patmacs/frame-title ()
  "Return a shortened file name for the current frame title."
  (let* ((name (if buffer-file-name
                   (abbreviate-file-name buffer-file-name)
                 (buffer-name)))
         (max-length patmacs/frame-title-max-length))
    (if (<= (length name) max-length)
        name
      (let* ((file-name (file-name-nondirectory name))
             (directory (file-name-directory name))
             (prefix ".../")
             (directory-length (- max-length (length file-name) (length prefix))))
        (if (<= directory-length 0)
            file-name
          (concat prefix
                  (substring directory (max 0 (- (length directory) directory-length)))
                  file-name))))))

(setq frame-title-format '(:eval (patmacs/frame-title))
      icon-title-format frame-title-format)

;; Default indent level to 2
(patmacs/setup-indent-level 2)

;; Emacs should respect editorconfig
(editorconfig-mode 1)

;; Remove trailing whitespaces and add new lines at the eof
(setq require-final-newline t)
(add-hook 'before-save-hook #'delete-trailing-whitespace)

;; Show column in mode line
(column-number-mode 1)

;; Replace active selection when typing
(delete-selection-mode 1)

;; Ask before quitting Emacs
(setq confirm-kill-emacs #'y-or-n-p)

;; Follow symlinks without prompting
(setq vc-follow-symlinks t)

;; Allow narrowing commands
(put 'narrow-to-region 'disabled nil)

;; Better throughput for language servers / async processes
(setq read-process-output-max (* 1024 1024))

;; no recentering jump
(setq scroll-conservatively 101)
(setq scroll-margin 4)

;;; defaults.el ends here
