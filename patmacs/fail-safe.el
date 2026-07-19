;;; fail-safe.el -*- lexical-binding: t; -*-

;; Fail-safe mode is activated from init.el whenever loading patmacs.el
;; fails, so this file must be loadable standalone, before any other
;; patmacs module (see the `load-file' call in init.el).

(defun patmacs/fail-safe-open-config ()
  "Open the Emacs config directory."
  (interactive)
  (find-file "~/.config/emacs"))

(defvar patmacs/fail-safe-bindings
  '(("C-o" find-file "find-file")
    ("C-s" save-buffer "save-buffer")
    ("C-f" isearch-forward "isearch-forward")
    ("C-F" isearch-backward "isearch-backward")
    ("M-x" execute-extended-command "execute-extended-command")
    ("C-p" patmacs/fail-safe-open-config "open ~/.config/emacs"))
  "List of (KEY COMMAND DESCRIPTION) bindings available in fail-safe mode.")

(defvar patmacs/fail-safe-map
  (let ((map (make-sparse-keymap)))
    (dolist (binding patmacs/fail-safe-bindings)
      (define-key map (kbd (nth 0 binding)) (nth 1 binding)))
    map)
  "Keymap active while `patmacs/fail-safe-mode' is enabled.")

(define-minor-mode patmacs/fail-safe-mode
  "Minor mode providing guaranteed key bindings when patmacs failed to load."
  :global t
  :keymap patmacs/fail-safe-map)

(defun patmacs/fail-safe--disable-evil ()
  "Disable evil and its satellite global modes.
This ensures they cannot shadow the fail-safe keybindings via their
own state keymaps."
  (dolist (mode '(evil-mode
                  evil-snipe-override-mode
                  evil-commentary-mode
                  global-evil-surround-mode))
    (when (fboundp mode)
      (funcall mode -1))))

(defun patmacs/fail-safe--install-keymap ()
  "Activate `patmacs/fail-safe-mode' with priority over evil's keymaps.
`emulation-mode-map-alists' is consulted before the global map and
before evil's own map alist, so pushing our alist to the front makes
these bindings win even if some evil state keymap is still active."
  (patmacs/fail-safe-mode 1)
  (add-to-list 'emulation-mode-map-alists
               `((patmacs/fail-safe-mode . ,patmacs/fail-safe-map))))

(defun patmacs/fail-safe--set-mode-line-faces ()
  "Make fail-safe mode visually obvious via a red mode-line."
  (set-face-attribute 'mode-line nil :background "red" :foreground "white" :box nil)
  (set-face-attribute 'mode-line-inactive nil :background "#800000" :foreground "white" :box nil))

(defun patmacs/fail-safe--show-error-buffer (err)
  "Show ERR prominently in a bottom side window, along with the
available fail-safe key bindings."
  (let ((buf (get-buffer-create "*Fail-Safe Mode*")))
    (with-current-buffer buf
      (erase-buffer)
      (insert (propertize "FAIL-SAFE MODE\n" 'face '(:height 1.5 :weight bold :foreground "red")))
      (insert "\npatmacs.el failed to load:\n\n")
      (insert (propertize (error-message-string err) 'face 'error))
      (insert (propertize "\n\nEvil has been disabled.\n" 'face 'bold))
      (insert (propertize "\nAvailable key bindings:\n" 'face 'bold))
      (dolist (binding patmacs/fail-safe-bindings)
        (insert (format "  %-6s %s\n" (nth 0 binding) (nth 2 binding))))
      (goto-char (point-min))
      (special-mode))
    (display-buffer
     buf
     '((display-buffer-in-side-window)
       (side . bottom)
       (window-height . 0.25)))))

(defun patmacs/fail-safe-activate (err)
  "Enter fail-safe mode after ERR occurred while loading patmacs.el."
  (message "patmacs.el failed to load: %s. Entering fail-safe mode." (error-message-string err))
  (patmacs/fail-safe--disable-evil)
  (patmacs/fail-safe--install-keymap)
  (patmacs/fail-safe--set-mode-line-faces)
  (patmacs/fail-safe--show-error-buffer err))

;;; fail-safe.el ends here
