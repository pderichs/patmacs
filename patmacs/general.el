;;; general.el -*- lexical-binding: t; -*-

;; general.el: SPC is leader
(use-package general
  :after evil
  :config
  (general-evil-setup)
  (general-create-definer my/leader
    :states '(normal visual motion emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "M-SPC")

  (my/leader
    "SPC"       '(execute-extended-command :which-key "M-x")
    "/"         '(consult-ripgrep          :which-key "search project (rg)")
    "*"         '(patmacs/search-symbol-at-point-in-project :which-key "search symbol in project")
    "RET"       '(consult-bookmark         :which-key "bookmarks")
    "."         '(find-file                :which-key "find file")
    ":"         '(eval-expression          :which-key "eval")

    ;; Some Group labels for which-key
    "l"         '(:ignore t                :which-key "line/lookup")
    "j"         '(:ignore t                :which-key "jump")
    "i"         '(:ignore t                :which-key "insert")
    "k"         '(:ignore t                :which-key "kill")
    "m"         '(:ignore t                :which-key "multiedit")
    "t"         '(:ignore t                :which-key "todo")
    "z"         '(:ignore t                :which-key "zettelkasten")
    "r"         '(:ignore t                :which-key "eradio")

    ;; Files
    "f"         '(:ignore t                :which-key "file")
    "ff"        '(find-file                :which-key "find file")
    "fr"        '(consult-recent-file      :which-key "recent")
    "fs"        '(save-buffer              :which-key "save")
    "fR"        '(rename-visited-file      :which-key "rename")

    ;; Buffers
    "b"         '(:ignore t                :which-key "buffer")
    "bb"        '(consult-buffer           :which-key "switch")
    "bk"        '(kill-current-buffer      :which-key "kill")
    "br"        '(revert-buffer            :which-key "revert")
    "bn"        '(evil-buffer-new          :which-key "new buffer")
    "bB"        '(consult-project-buffer   :which-key "project buffers") ; war workspace
    "bd"        '(kill-current-buffer      :which-key "kill buffer")

    ;; Search
    "s"         '(:ignore t                :which-key "search")
    "ss"        '(consult-line             :which-key "line")
    "sp"        '(consult-ripgrep          :which-key "project (rg)")
    "si"        '(consult-imenu            :which-key "imenu")

    ;; Windows
    "w"         '(:ignore t                :which-key "window")
    "ww"        '(other-window             :which-key "other window")
    "wv"        '(evil-window-vsplit       :which-key "vsplit")
    "ws"        '(evil-window-split        :which-key "split")
    "wd"        '(delete-window            :which-key "delete")
    "wD"        '(delete-other-windows     :which-key "delete others")
    "wo"        '(delete-other-windows     :which-key "only")
    "wh"        '(evil-window-left         :which-key "left")
    "wj"        '(evil-window-down         :which-key "down")
    "wk"        '(evil-window-up           :which-key "up")
    "wl"        '(evil-window-right        :which-key "right")
    "w/"        '(split-window-horizontally :which-key "split right")
    "w-"        '(split-window-vertically   :which-key "split below")
    "wr"        '(patmacs/toggle-word-wrap  :which-key "word wrap toggle")
    "w <left>"  '(evil-window-left         :which-key "window left")
    "w <right>" '(evil-window-right        :which-key "window right")
    "w <up>"    '(evil-window-up           :which-key "window up")
    "w <down>"  '(evil-window-down         :which-key "window down")

    ;; Project (projectile)
    "p"         '(:ignore t                :which-key "project")
    "pp"        '(projectile-switch-project :which-key "switch")
    "pf"        '(projectile-find-file     :which-key "find file")
    "pb"        '(projectile-switch-to-buffer :which-key "buffer")
    "pd"        '(projectile-find-dir      :which-key "find dir")
    "ps"        '(consult-ripgrep          :which-key "search (rg)")
    "pc"        '(projectile-compile-project :which-key "compile")
    "pr"        '(projectile-run-project   :which-key "run")
    "pt"        '(projectile-test-project  :which-key "test")
    "pk"        '(projectile-kill-buffers  :which-key "kill buffers")
    "pi"        '(projectile-invalidate-cache :which-key "invalidate cache")

    ;; Services (prodigy)
    "o"         '(:ignore t                :which-key "services")
    "oo"        '(prodigy                  :which-key "prodigy")

    ;; Git
    "g"         '(:ignore t                :which-key "git")
    "gg"        '(magit-status             :which-key "status")
    "gb"        '(magit-blame              :which-key "blame")
    "gu"        '(patmacs/git-update-commit :which-key "update commit")

    ;; Code / LSP
    "c"         '(:ignore t                :which-key "code")
    "ca"        '(eglot-code-actions       :which-key "action")
    "cr"        '(eglot-rename             :which-key "rename")
    "cf"        '(eglot-format             :which-key "format")
    "cd"        '(xref-find-definitions    :which-key "definition")
    "cD"        '(xref-find-references     :which-key "references")

    ;; Org / Notes
    "n"         '(:ignore t                :which-key "notes")
    "nr"        '(:ignore t                :which-key "roam")
    "nrf"       '(org-roam-node-find       :which-key "find node")
    "nri"       '(org-roam-node-insert     :which-key "insert node")
    "nrc"       '(org-roam-capture         :which-key "capture")
    "nrl"       '(org-roam-buffer-toggle   :which-key "backlinks")
    "na"        '(org-agenda               :which-key "agenda")
    "nrt"       '(org-roam-tag-add         :which-key "roam")

    ;; Additional commands
    "h"         '(:ignore t                :which-key "additional")
    "hh"        '(mark-whole-buffer        :which-key "select whole buffer")
    "ht"        '(consult-theme            :which-key "switch theme")

    "d"         '(:ignore t                :which-key "describe")
    "df"        '(describe-function        :which-key "function")
    "dv"        '(describe-variable        :which-key "variable")
    "dk"        '(describe-key             :which-key "key")

    ;; Open / Terminal / File manager
    "ot"        '(patmacs/start-terminal-in-current-folder
                  :which-key "open terminal")
    "of"        '(ff-find-other-file       :which-key "find other file")
    "oe"        '(patmacs/open-current-buffer-folder-in-file-manager
                  :which-key "open folder (fm)")
    "#"         '((lambda ()
                    (interactive)
                    (dired "."))
                  :which-key "dired here")

    ;; Search in folders
    "["         '(patmacs/search-string-in-folder :which-key "search string in folder")
    "ö"         '(patmacs/search-string-in-folder :which-key "search string in folder")
    "]"         '(patmacs/search-file-in-folder   :which-key "search file in folder")
    "ä"         '(patmacs/search-file-in-folder   :which-key "search file in folder")

    ;; Line selection / yanks
    ","         '((lambda ()
                    (interactive)
                    (execute-kbd-macro (kbd "v$h")))
                  :which-key "select rest of line")
    "lv"        '((lambda ()
                    (interactive)
                    (execute-kbd-macro (kbd "^v$h")))
                  :which-key "select whole line")
    "ly"        '((lambda ()
                    (interactive)
                    (execute-kbd-macro (kbd "^v$hy")))
                  :which-key "yank whole line")

    ;; Neotree
    "nt"        '(neotree-toggle           :which-key "toggle neotree")

    ;; Quit
    "q"         '(:ignore t                :which-key "quit")
    "qq"        '(save-buffers-kill-terminal :which-key "quit emacs")
    "qr"        '(restart-emacs            :which-key "restart emacs")

    ;; Multiple edits
    "mn"        '(evil-multiedit-match-and-next :which-key "mark this & next")
    "ma"        '(evil-multiedit-match-all :which-key "mark all")

    "fp"        '(patmacs/find-file-in-config :which-key "find in config")

    ;; Jump / Symbols / Registers
    "ji"        '(consult-imenu            :which-key "imenu (symbols)")
    "-"         '(consult-register         :which-key "registers/clipboard")
    "pl"        '(consult-yank-from-kill-ring :which-key "paste from kill ring")
    "lc"        '(goto-last-change         :which-key "goto last change")
    "gow"       '(xref-find-definitions-other-window :which-key "def in other window")

    ;; Insertion
    "id"        '(patmacs/insert-date      :which-key "insert date")
    "il"        '(patmacs/insert-line      :which-key "insert line")
    "ia"        '((lambda ()
                    (interactive)
                    (org-insert-heading)
                    (insert "Aufgabe Q")
                    (evil-insert 1))
                  :which-key "insert task heading")

    ;; Bookmarks
    "lb"        '(list-bookmarks           :which-key "edit bookmarks")
    "to"        '(org-todo-list            :which-key "todo list")

    ;; Zettelkasten / org-roam
    "nz"        '(org-roam-node-find       :which-key "new zettel")
    "fz"        '(org-roam-node-find       :which-key "find zettel")
    "ze"        '((lambda ()
                    (interactive)
                    (consult-ripgrep user-personal-zettelkasten-folder))
                  :which-key "search zettelkasten")

    ;; Execute
    "x"         '(shell-command             :which-key "execute")

    ;; eradio
    "rp"        '(eradio-play              :which-key "play")
    "rs"        '(eradio-stop              :which-key "stop")
    "rt"        '(eradio-toggle            :which-key "toggle")))

;;; general.el ends here
