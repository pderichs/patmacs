;;; org.el -*- lexical-binding: t; -*-

(use-package org
  :ensure nil
  :init
  (setq org-directory user-org-base-path
        org-default-notes-file (expand-file-name "inbox.org" org-directory))
  :config
  (setq org-startup-indented t
        org-hide-emphasis-markers t
        org-pretty-entities t
        org-ellipsis " ▾"
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 0
        org-agenda-files (list org-directory user-roam-daily-path))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (shell      . t)
     (python     . t))))

;; Enhanced movements for org under evil
(use-package evil-org
  :after (evil org)
  :hook (org-mode . evil-org-mode)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package org-roam
  :init
  (setq org-roam-v2-ack t) ; suppress V2 warnings
  :custom
  (org-roam-directory (file-truename user-roam-base-path))
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain "%?"
      :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                         "#+title: ${title}\n")
      :unnarrowed t)))
  :config
  (setq org-roam-db-location
        (locate-user-emacs-file "org-roam.db"))
  ;; Create folder if it does not exist
  (unless (file-directory-p org-roam-directory)
    (make-directory org-roam-directory t))
  (require 'org-roam-dailies) ; for org-roam-dailies-goto-today (<f10>)
  ;; Don't run the (potentially multi-second, for a large zettelkasten) db
  ;; sync synchronously during startup -- it would block the first frame
  ;; from appearing. Defer it to the next idle moment instead, with GC
  ;; explicitly disabled for the duration so collections don't slow it down.
  (add-hook 'emacs-startup-hook
            (lambda ()
              (run-with-idle-timer
               0.3 nil
               (lambda ()
                 (let ((gc-cons-threshold most-positive-fixnum))
                   (org-roam-db-autosync-mode)
                   (message "Patmacs: Ready! (%s, %d GCs)"
                            (emacs-init-time "%.2fs")
                            gcs-done)))))))

(defvar user-personal-zettelkasten-folder
  (if (boundp 'org-roam-directory) org-roam-directory user-roam-base-path))

(defun patmacs/org-ret-dwim ()
  "Open Org links at point, otherwise cycle the TODO state."
  (interactive)
  (if (eq (org-element-type (org-element-context)) 'link)
      (org-open-at-point)
    (org-todo)))

;; org-mode: S-<up> jumps to parent element
(with-eval-after-load 'org
  (setq org-return-follows-link t)
  (define-key org-mode-map (kbd "S-<up>") #'outline-up-heading)
  (evil-define-key 'normal org-mode-map (kbd "RET") #'patmacs/org-ret-dwim))

;;; org.el ends here
