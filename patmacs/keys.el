;;; keys.el -*- lexical-binding: t; -*-

;; Do not override kill ring with p
(setq evil-kill-on-visual-paste nil)

;; --- Non-Leader-Keys ---
;; Navigation / Xref / Back-Button
(define-key evil-normal-state-map "gb" #'back-button-global-backward)
(define-key evil-normal-state-map "gf" #'back-button-global-forward)
(define-key evil-normal-state-map "gi" #'xref-find-definitions)
(define-key evil-normal-state-map "gd" #'patmacs/lookup-definition-and-center-cursor)
(define-key evil-normal-state-map "U"  #'patmacs/lookup-references)
(define-key evil-visual-state-map "U"  #'patmacs/lookup-references)

;; Paragraphs / Errors
(define-key evil-normal-state-map (kbd "C-j") #'evil-forward-paragraph)
(define-key evil-normal-state-map (kbd "C-k") #'evil-backward-paragraph)
(define-key evil-normal-state-map (kbd "M-n") #'next-error)
(define-key evil-normal-state-map (kbd "M-p") #'previous-error)

;; Completion
(define-key evil-normal-state-map (kbd "C-<SPC>") #'completion-at-point)
(define-key evil-insert-state-map (kbd "C-<SPC>") #'completion-at-point)

;; Selection
(define-key evil-normal-state-map "M"  #'er/expand-region)
(define-key evil-normal-state-map "\\" #'evil-visual-line)
(define-key evil-normal-state-map "-"  #'evil-visual-line)
(define-key evil-normal-state-map "L"  (lambda () (interactive) (message "nop")))

;; Avy-Jump
(define-key evil-normal-state-map (kbd "g s s") #'avy-goto-char-2)

;; Copy/Paste
(define-key evil-normal-state-map (kbd "C-y") #'yank)
(define-key evil-normal-state-map (kbd "C-w") #'kill-region)
(define-key evil-normal-state-map (kbd "M-w") #'kill-ring-save)

;; Font size
(define-key evil-normal-state-map (kbd "C-+") (lambda () (interactive) (text-scale-increase 1)))
(define-key evil-normal-state-map (kbd "C--") (lambda () (interactive) (text-scale-decrease 1)))
(define-key evil-normal-state-map (kbd "C-0") (lambda () (interactive) (text-scale-increase 0)))

;; Function keys
(define-key evil-normal-state-map (kbd "<f9>")  #'consult-recent-file)
(define-key evil-normal-state-map (kbd "<f10>") #'org-roam-dailies-goto-today)
(define-key evil-normal-state-map (kbd "<f11>") #'consult-bookmark)

;;; keys.el ends here
