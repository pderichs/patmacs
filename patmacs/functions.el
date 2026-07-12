;;; functions.el -*- lexical-binding: t; -*-

;; Thanks to https://web.cs.elte.hu/local/texinfo/elisp-intro/emacs-lisp-intro_132.html
(defun debug-print-elements-of-list (list)
  "Print each element of LIST on a line of its own."
  (while list
    (print (car list))
    (setq list (cdr list))))

;; Thanks to https://www.emacswiki.org/emacs/SetFonts
(defun font-existsp (font)
  "Return non-nil if FONT exists."
  (and font
       (ignore-errors
         (not (null (x-list-fonts font))))))

;; Thanks to http://blog.binchen.org/posts/easy-indentation-setup-in-emacs-for-web-development.html
(defun patmacs/setup-indent-level (n)
  "Sets the indent level for multiple languages to n."
  (setq c-basic-offset n) ;; java + c/c++
  (setq coffee-tab-width n)
  (setq javascript-indent-level n)
  (setq js-indent-level n)
  (setq js2-basic-offset n)
  (setq web-mode-markup-indent-offset n)
  (setq web-mode-css-indent-offset n)
  (setq web-mode-code-indent-offset n)
  (setq css-indent-offset n))

(defun patmacs/start-terminal-in-current-folder ()
  "Starts a terminal in the current file's folder."
  (interactive)
  (let ((file-name-dir (if buffer-file-name (file-name-directory buffer-file-name) nil))
        (terminal (or (getenv "TERMINAL") "kitty")))
    (if file-name-dir
        (setq default-directory file-name-dir))
    (start-process terminal nil terminal)))

(defun patmacs/search-string-in-folder ()
  "Searches for a string in a specific folder."
  (interactive)
  (let ((folder-to-search-in (read-directory-name "Search for string in Directory:")))
    (unless (string= "" folder-to-search-in)
      (consult-ripgrep folder-to-search-in))))

(defun patmacs/search-symbol-at-point-in-project ()
  "Searches for the symbol at point in the current project."
  (interactive)
  (consult-ripgrep (projectile-project-root) (thing-at-point 'symbol t)))

(defun patmacs/search-file-in-folder ()
  "Searches for a string in a specific folder."
  (interactive)
  (let ((folder-to-search-in (read-directory-name "Search for a file in Directory:")))
    (unless (string= "" folder-to-search-in)
      (consult-find folder-to-search-in))))

(defun patmacs/my-root-dir ()
  "Retrieves the source control root dir of the current file.
Returns nil if the buffer is not visiting a file."
  (when buffer-file-name
    (let ((path (file-name-directory buffer-file-name)))
      (vc-call-backend (vc-responsible-backend path) 'root path))))

(defun patmacs/insert-date ()
  "Inserts the current date"
  (interactive)
  (insert (format-time-string "%Y.%m.%d"))
  (newline))

(defun patmacs/insert-line ()
  "Inserts a line"
  (interactive)
  (insert (make-string 90 ?-))
  (newline))

(defun patmacs/lookup-definition-and-center-cursor ()
  "Jump to the definition of the symbol at point."
  (interactive)
  (xref-find-definitions (thing-at-point 'symbol 'no-properties)))

(defun patmacs/lookup-references ()
  "Find references to the symbol at point."
  (interactive)
  (xref-find-references (thing-at-point 'symbol 'no-properties)))

(defun patmacs/insert-mode-indicator ()
  "Inserts a mode spec at the current line and selects the MODE
placeholder so it can be replaced immediately."
  (interactive)
  (insert "-*- mode: MODE -*-")
  (when (search-backward "MODE" (line-beginning-position) t)
    (evil-visual-char)
    (forward-char (1- (length "MODE")))))

(defun patmacs/git-update-commit ()
  "Creates a fast update commit for the current repository."
  (interactive)
  (let ((root-dir (patmacs/my-root-dir)))
    (if (eq root-dir nil)
        (message "*** Root dir is nil! Aborting.")
      (progn
        (save-some-buffers t)
        (setq default-directory root-dir)
        (shell-command "git add .; git commit -am \"Update\"")))))

(defun patmacs/open-current-buffer-folder-in-file-manager (&optional arg)
  "Opens the folder of the current buffer in the system file manager.
With Prefix-Argument ARG (\\[universal-argument]) it tries to mark the file in
the explorer."
  (interactive "P")
  (let* ((file (buffer-file-name))
         (target (cond
                  ;; With prefix: File, otherwise folder
                  ((and arg file) (expand-file-name file))
                  (file (file-name-directory (expand-file-name file)))
                  (t (expand-file-name default-directory))))
         (dir (if (file-directory-p target)
                  target
                (file-name-directory target))))
    (cond
     ;; macOS (Finder)
     ((eq system-type 'darwin)
      (if (and arg file)
          (call-process "open" nil 0 nil "-R" target) ; reveal file
        (call-process "open" nil 0 nil dir)))
     ;; Windows (Explorer)
     ((eq system-type 'windows-nt)
      (if (and arg file)
          (w32-shell-execute "open" "explorer.exe"
                             (concat "/select,"
                                     (subst-char-in-string ?/ ?\\ target)))
        (w32-shell-execute "open" "explorer.exe"
                           (subst-char-in-string ?/ ?\\ dir))))
     ((memq system-type '(gnu/linux gnu kfreebsd berkeley-unix))
      ;; For most systems xdg-open suffices
      (call-process "xdg-open" nil 0 nil dir))
     (t
      (user-error "Nicht unterstütztes system-type: %s" system-type)))))

(defun patmacs/org-sanitize-filename (s)
  "Konvertiere Überschrift S in einen Dateinamen ohne problematische Zeichen
und schneide ihn auf maximal 90 Zeichen zu."
  (let* (;; Umlaute ersetzen
         (s (replace-regexp-in-string "ä" "ae" s t))
         (s (replace-regexp-in-string "ö" "oe" s t))
         (s (replace-regexp-in-string "ü" "ue" s t))
         (s (replace-regexp-in-string "Ä" "Ae" s t))
         (s (replace-regexp-in-string "Ö" "Oe" s t))
         (s (replace-regexp-in-string "Ü" "Ue" s t))
         (s (replace-regexp-in-string "ß" "ss" s t))
         ;; Leerzeichen → Bindestriche
         (s (replace-regexp-in-string "[ \t]+" "-" s t))
         ;; Nicht-filename-kompatible Zeichen entfernen
         (s (replace-regexp-in-string "[^A-Za-z0-9._-]" "" s t))
         ;; Alles klein
         (s (downcase s)))
    ;; Längenlimit
    (if (> (length s) 90)
        (substring s 0 90)
      s)))

(defun patmacs/find-file-in-config ()
  "Open a file from the Emacs config directory."
  (interactive)
  (let* ((default-directory user-emacs-directory)
         (files (directory-files-recursively
                 default-directory ".*" nil
                 (lambda (dir) (not (string-match-p "\\.git" dir)))))
         (choice (completing-read "Find file in config: "
                                  (mapcar (lambda (f) (file-relative-name f default-directory))
                                          files))))
    (find-file (expand-file-name choice default-directory))))

(defun patmacs/toggle-word-wrap ()
  "Toggle soft wrapping of long lines in the current buffer."
  (interactive)
  (if visual-line-mode
      (progn
        (visual-line-mode -1)
        (setq-local truncate-lines t
                    word-wrap nil)
        (message "Word wrap disabled"))
    (setq-local truncate-lines nil
                word-wrap t)
    (visual-line-mode 1)
    (message "Word wrap enabled")))

(defun patmacs/update-packages ()
  "Refresh package archives and upgrade all installed packages."
  (interactive)
  (require 'package)
  (when (yes-or-no-p "Upgrade all installed packages? ")
    (package-upgrade-all nil)
    (when (yes-or-no-p "Remove obsolete packages now? ")
      (package-autoremove))
    (message "Package update finished")))

;;; functions.el ends here
