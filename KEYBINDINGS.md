# Keybindings

This is a reference of all keybindings explicitly configured in `patmacs`.
It does not list the default bindings that come from `evil-mode`,
`evil-collection`, or any other package unless patmacs itself binds them.

`SPC` is the leader key (also reachable as `M-SPC` from any Evil state,
including Insert). All leader bindings are defined in `general.el`.

## Leader key (`SPC` / `M-SPC`)

| Group | Key | Function | Description |
|---|---|---|---|
| — | `SPC SPC` | `execute-extended-command` | Run any command by name (like `M-x`) |
| — | `SPC /` | `consult-ripgrep` | Search the current project with ripgrep |
| — | `SPC RET` | `consult-bookmark` | Jump to a bookmark |
| — | `SPC .` | `find-file` | Open a file |
| — | `SPC :` | `eval-expression` | Evaluate a Lisp expression |
| File | `SPC ff` | `find-file` | Open a file |
| File | `SPC fr` | `consult-recent-file` | Open a recently used file |
| File | `SPC fs` | `save-buffer` | Save the current buffer |
| File | `SPC fR` | `rename-visited-file` | Rename the file visited by the current buffer |
| Buffer | `SPC bb` | `consult-buffer` | Switch to another buffer |
| Buffer | `SPC bk` | `kill-current-buffer` | Kill the current buffer |
| Buffer | `SPC br` | `revert-buffer` | Reload the buffer's contents from disk |
| Buffer | `SPC bn` | `evil-buffer-new` | Create a new empty buffer |
| Buffer | `SPC bB` | `consult-project-buffer` | Switch to a buffer that belongs to the current project |
| Buffer | `SPC bd` | `kill-current-buffer` | Kill the current buffer |
| Search | `SPC ss` | `consult-line` | Search for a line in the current buffer |
| Search | `SPC sp` | `consult-ripgrep` | Search the current project with ripgrep |
| Search | `SPC si` | `consult-imenu` | Jump to a symbol via imenu |
| Window | `SPC ww` | `other-window` | Move focus to the other window |
| Window | `SPC wv` | `evil-window-vsplit` | Split the window vertically |
| Window | `SPC ws` | `evil-window-split` | Split the window horizontally |
| Window | `SPC wd` | `delete-window` | Delete the current window |
| Window | `SPC wD` | `delete-other-windows` | Delete all windows except this one |
| Window | `SPC wo` | `delete-other-windows` | Delete all windows except this one |
| Window | `SPC wh` | `evil-window-left` | Move focus to the window on the left |
| Window | `SPC wj` | `evil-window-down` | Move focus to the window below |
| Window | `SPC wk` | `evil-window-up` | Move focus to the window above |
| Window | `SPC wl` | `evil-window-right` | Move focus to the window on the right |
| Window | `SPC w/` | `split-window-horizontally` | Split the window, placing the new one on the right |
| Window | `SPC w-` | `split-window-vertically` | Split the window, placing the new one below |
| Window | `SPC wr` | `patmacs/toggle-word-wrap` | Toggle soft wrapping of long lines in the buffer |
| Window | `SPC w <left>` | `evil-window-left` | Move focus to the window on the left |
| Window | `SPC w <right>` | `evil-window-right` | Move focus to the window on the right |
| Window | `SPC w <up>` | `evil-window-up` | Move focus to the window above |
| Window | `SPC w <down>` | `evil-window-down` | Move focus to the window below |
| Project | `SPC pp` | `projectile-switch-project` | Switch to another project |
| Project | `SPC pf` | `projectile-find-file` | Find a file within the current project |
| Project | `SPC pb` | `projectile-switch-to-buffer` | Switch to a buffer within the current project |
| Project | `SPC pd` | `projectile-find-dir` | Find a directory within the current project |
| Project | `SPC ps` | `consult-ripgrep` | Search the project with ripgrep |
| Project | `SPC pc` | `projectile-compile-project` | Compile the current project |
| Project | `SPC pr` | `projectile-run-project` | Run the current project |
| Project | `SPC pt` | `projectile-test-project` | Run the current project's tests |
| Project | `SPC pk` | `projectile-kill-buffers` | Kill all buffers belonging to the current project |
| Project | `SPC pi` | `projectile-invalidate-cache` | Invalidate the projectile cache |
| Services | `SPC oo` | `prodigy` | Open the Prodigy service manager |
| Git | `SPC gg` | `magit-status` | Open the Magit status buffer |
| Git | `SPC gb` | `magit-blame` | Show Git blame for the current buffer |
| Git | `SPC gu` | `patmacs/git-update-commit` | Create a fast "update" commit for the current repository |
| Code / LSP | `SPC ca` | `eglot-code-actions` | Show available code actions at point |
| Code / LSP | `SPC cr` | `eglot-rename` | Rename the symbol at point via LSP |
| Code / LSP | `SPC cf` | `eglot-format` | Format the buffer via LSP |
| Code / LSP | `SPC cd` | `xref-find-definitions` | Jump to the definition of the symbol at point |
| Code / LSP | `SPC cD` | `xref-find-references` | Find references to the symbol at point |
| Org / Notes | `SPC nrf` | `org-roam-node-find` | Find (or create) an org-roam node |
| Org / Notes | `SPC nri` | `org-roam-node-insert` | Insert a link to an org-roam node |
| Org / Notes | `SPC nrc` | `org-roam-capture` | Capture a new org-roam note |
| Org / Notes | `SPC nrl` | `org-roam-buffer-toggle` | Toggle the org-roam backlinks buffer |
| Org / Notes | `SPC na` | `org-agenda` | Open the Org agenda |
| Org / Notes | `SPC nrt` | `org-roam-add-tag` | Add a tag to a roam note |
| Additional | `SPC hh` | `mark-whole-buffer` | Select the entire buffer |
| Additional | `SPC ht` | `consult-theme` | Switch the color theme |
| Describe | `SPC df` | `describe-function` | Show documentation for a function |
| Describe | `SPC dv` | `describe-variable` | Show documentation for a variable |
| Describe | `SPC dk` | `describe-key` | Show the command bound to a key |
| Open | `SPC ot` | `patmacs/start-terminal-in-current-folder` | Open a terminal in the current file's folder |
| Open | `SPC of` | `ff-find-other-file` | Switch between a source file and its counterpart (e.g. header/implementation) |
| Open | `SPC oe` | `patmacs/open-current-buffer-folder-in-file-manager` | Open the current buffer's folder in the system file manager |
| Open | `SPC #` | `dired` | Open Dired in the current directory |
| Search in folder | `SPC [` | `patmacs/search-string-in-folder` | Search for a string within a chosen folder |
| Search in folder | `SPC ö` | `patmacs/search-string-in-folder` | Search for a string within a chosen folder |
| Search in folder | `SPC ]` | `patmacs/search-file-in-folder` | Search for a file within a chosen folder |
| Search in folder | `SPC ä` | `patmacs/search-file-in-folder` | Search for a file within a chosen folder |
| Line selection | `SPC ,` | (inline lambda) | Select the rest of the current line |
| Line selection | `SPC lv` | (inline lambda) | Select the whole current line |
| Line selection | `SPC ly` | (inline lambda) | Yank (copy) the whole current line |
| Neotree | `SPC nt` | `neotree-toggle` | Toggle the Neotree file browser sidebar |
| Quit | `SPC qq` | `save-buffers-kill-terminal` | Save buffers and quit Emacs |
| Quit | `SPC qr` | `restart-emacs` | Restart Emacs |
| Multiedit | `SPC mn` | `evil-multiedit-match-and-next` | Mark the symbol at point and jump to the next match |
| Multiedit | `SPC ma` | `evil-multiedit-match-all` | Mark all matches of the symbol at point |
| File | `SPC fp` | `patmacs/find-file-in-config` | Open a file from the Emacs config directory |
| Jump / Symbols | `SPC ji` | `consult-imenu` | Jump to a symbol via imenu |
| Jump / Symbols | `SPC -` | `consult-register` | Browse registers and the clipboard |
| Jump / Symbols | `SPC pl` | `consult-yank-from-kill-ring` | Paste an entry chosen from the kill ring |
| Jump / Symbols | `SPC lc` | `goto-last-change` | Jump to the location of the last change |
| Jump / Symbols | `SPC gow` | `xref-find-definitions-other-window` | Jump to a definition, opened in another window |
| Insertion | `SPC id` | `patmacs/insert-date` | Insert the current date |
| Insertion | `SPC il` | `patmacs/insert-line` | Insert a horizontal separator line |
| Insertion | `SPC ia` | (inline lambda) | Insert a new "Aufgabe Q" task heading |
| Bookmarks | `SPC lb` | `list-bookmarks` | Open the bookmark list for editing |
| Bookmarks | `SPC to` | `org-todo-list` | Show the Org TODO list |
| Zettelkasten | `SPC nz` | `org-roam-node-find` | Create or find a Zettelkasten node |
| Zettelkasten | `SPC fz` | `org-roam-node-find` | Find an existing Zettelkasten node |
| Zettelkasten | `SPC ze` | (inline lambda) | Search the Zettelkasten folder with ripgrep |
| eradio | `SPC rp` | `eradio-play` | Play the configured internet radio station |
| eradio | `SPC rs` | `eradio-stop` | Stop internet radio playback |
| eradio | `SPC rt` | `eradio-toggle` | Toggle internet radio playback |

## Global keybindings (non-leader)

| Key | State / Context | Function | Description |
|---|---|---|---|
| `gb` | Normal | `back-button-global-backward` | Jump back to the previous location in the navigation history |
| `gf` | Normal | `back-button-global-forward` | Jump forward in the navigation history |
| `gi` | Normal | `xref-find-definitions` | Jump to the definition of the symbol at point |
| `gd` | Normal | `patmacs/lookup-definition-and-center-cursor` | Jump to the definition of the symbol at point and center the cursor |
| `U` | Normal, Visual | `patmacs/lookup-references` | Find references to the symbol at point |
| `C-j` | Normal | `evil-forward-paragraph` | Move forward one paragraph |
| `C-k` | Normal | `evil-backward-paragraph` | Move backward one paragraph |
| `M-n` | Normal | `next-error` | Jump to the next error/match |
| `M-p` | Normal | `previous-error` | Jump to the previous error/match |
| `C-<SPC>` | Normal, Insert | `completion-at-point` | Trigger completion at point |
| `M` | Normal | `er/expand-region` | Expand the selection semantically (expand-region) |
| `\` | Normal | `evil-visual-line` | Enter visual line selection |
| `-` | Normal | `evil-visual-line` | Enter visual line selection |
| `L` | Normal | (no-op) | Disabled (overrides the default `L` binding) |
| `g s s` | Normal | `avy-goto-char-2` | Jump to a location by typing two characters |
| `C-y` | Normal | `yank` | Paste from the kill ring |
| `C-w` | Normal | `kill-region` | Kill (cut) the selected region |
| `M-w` | Normal | `kill-ring-save` | Copy the selected region |
| `C-+` | Normal | `text-scale-increase` | Increase the buffer's font size |
| `C--` | Normal | `text-scale-decrease` | Decrease the buffer's font size |
| `C-0` | Normal | `text-scale-increase` (reset) | Reset the buffer's font size |
| `<f9>` | Normal | `consult-recent-file` | Open a recently used file |
| `<f10>` | Normal | `org-roam-dailies-goto-today` | Open (or create) today's daily note |
| `<f11>` | Normal | `consult-bookmark` | Jump to a bookmark |
| `C-g` | Insert | `evil-normal-state` | Return to Normal state |
| `S-<up>` | `org-mode-map` | `outline-up-heading` | Jump to the parent Org heading |
| `RET` | Normal, `org-mode-map` | `patmacs/org-ret-dwim` | Open the Org link at point, otherwise cycle the TODO state |
| `C-c p` | Global | `projectile-command-map` | Prefix for all Projectile commands |
| `C-x g` | Global | `magit-status` | Open the Magit status buffer |
| `C-s` | Global | `consult-line` | Search for a line in the current buffer |
| `C-x b` | Global | `consult-buffer` | Switch to another buffer |
| `M-y` | Global | `consult-yank-pop` | Cycle through the kill ring after a paste |
| `M-g g` | Global | `consult-goto-line` | Jump to a specific line number |
| `M-s r` | Global | `consult-ripgrep` | Search the current project with ripgrep |
| `C-.` | Global | `embark-act` | Perform a contextual action on the thing at point |
| `C-h B` | Global | `embark-bindings` | Show all keybindings active at point |
| `RET` | `vertico-map` (minibuffer) | `vertico-directory-enter` | Enter the directory shown in the minibuffer |
| `DEL` | `vertico-map` (minibuffer) | `vertico-directory-delete-char` | Delete a character, or go up a directory level |
| `M-DEL` | `vertico-map` (minibuffer) | `vertico-directory-delete-word` | Delete a word, or go up a directory level |
| `RET` / `<return>` | `corfu-map` (completion popup) | `corfu-insert` | Insert the selected completion candidate |

## Tree-sitter text objects (Evil)

Configured in `eglot-treesitter.el` via `evil-textobj-tree-sitter`. Use with
Evil's usual `i`/`a` operators, e.g. `dif` (delete inner function) or `vac`
(select a whole class).

| Key | Text object | Description |
|---|---|---|
| `if` | `function.inner` | Inner text object: function body |
| `af` | `function.outer` | Outer text object: whole function |
| `ic` | `class.inner` | Inner text object: class body |
| `ac` | `class.outer` | Outer text object: whole class |
| `ig` | `conditional.inner` | Inner text object: conditional body |
| `ag` | `conditional.outer` | Outer text object: whole conditional |
| `il` | `loop.inner` | Inner text object: loop body |
| `al` | `loop.outer` | Outer text object: whole loop |
| `im` | `comment.inner` | Inner text object: comment body |
| `am` | `comment.outer` | Outer text object: whole comment |
| `iu` | `call.inner` | Inner text object: function-call arguments |
| `au` | `call.outer` | Outer text object: whole function call |
| `ia` | `parameter.inner` | Inner text object: a single parameter |
| `aa` | `parameter.outer` | Outer text object: parameter, including separator |

### Function/class motions (Normal, global)

| Key | Function | Description |
|---|---|---|
| `] f` | `evil-textobj-tree-sitter-goto-textobj` | Jump to the start of the next function |
| `[ f` | `evil-textobj-tree-sitter-goto-textobj` | Jump to the start of the previous function |
| `] F` | `evil-textobj-tree-sitter-goto-textobj` | Jump to the end of the next function |
| `[ F` | `evil-textobj-tree-sitter-goto-textobj` | Jump to the end of the previous function |
| `] c` | `evil-textobj-tree-sitter-goto-textobj` | Jump to the start of the next class |
| `[ c` | `evil-textobj-tree-sitter-goto-textobj` | Jump to the start of the previous class |

## Package-default bindings enabled by config

These are not custom-bound in patmacs, but the corresponding mode is
explicitly enabled in `evil.el`, so the package's own default keys apply:

| Key(s) | Package | Description |
|---|---|---|
| `gc`, `gcc` | `evil-commentary` | Comment/uncomment a motion, or the current line |
| `ys`, `cs`, `ds` | `evil-surround` | Add, change, or delete a surrounding pair (quotes, brackets, tags, ...) |
| `M-d`, `M-D` | `evil-multiedit` | Alternative bindings for match-and-next / match-all (see also `SPC mn` / `SPC ma`) |

## Out of scope

Default bindings from `evil-mode` and `evil-collection` (e.g. standard Vim
motions, or the mode-specific bindings `evil-collection` sets up for Magit,
Dired, etc.) are not listed here, since they are not explicitly configured
by patmacs.
