 ;;; init.el -*- lexical-binding: t; -*-

;; Load tool functions
(load-file (locate-user-emacs-file "patmacs/bootstrap.el"))

;; Setup custom file
(setq custom-file (locate-user-emacs-file "var/custom.el"))

(require 'package)
(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t ; Install packages on demand
      use-package-expand-minimally t
      use-package-compute-statistics nil) ; t for `use-package-report'

;; Load patmacs - if something goes wrong, enter fail-safe mode
(condition-case err
    (patmacs/load-required "patmacs.el")
  (error
   (message "patmacs.el failed to load: %s. Entering fail-safe mode." (error-message-string err))

   ;; Set some key bindings
   (global-set-key (kbd "C-o") #'find-file)
   (global-set-key (kbd "C-s") #'save-buffer)
   (global-set-key (kbd "C-f") #'isearch-forward)
   (global-set-key (kbd "C-F") #'isearch-backward)
   (global-set-key (kbd "M-x") #'execute-extended-command)
   (global-set-key (kbd "C-p") (lambda () (interactive) (find-file "~/.config/emacs")))

   ;; Make fail-safe mode visually obvious via a red mode-line
   (set-face-attribute 'mode-line nil :background "red" :foreground "white" :box nil)
   (set-face-attribute 'mode-line-inactive nil :background "#800000" :foreground "white" :box nil)

   ;; Show the error prominently in a bottom window
   (let ((buf (get-buffer-create "*Fail-Safe Mode*")))
     (with-current-buffer buf
       (erase-buffer)
       (insert (propertize "FAIL-SAFE MODE\n" 'face '(:height 1.5 :weight bold :foreground "red")))
       (insert "\npatmacs.el failed to load:\n\n")
       (insert (propertize (error-message-string err) 'face 'error))
       (insert (propertize "\n\nAvailable key bindings:\n" 'face 'bold))
       (insert "  C-o    find-file\n")
       (insert "  C-s    save-buffer\n")
       (insert "  C-f    isearch-forward\n")
       (insert "  C-F    isearch-backward\n")
       (insert "  M-x    execute-extended-command\n")
       (insert "  C-p    open ~/.config/emacs\n")
       (goto-char (point-min))
       (special-mode))
     (display-buffer
      buf
      '((display-buffer-in-side-window)
        (side . bottom)
        (window-height . 0.25))))
   ))

;;; init.el ends here
