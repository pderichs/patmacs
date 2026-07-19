;;; eglot-treesitter.el -*- lexical-binding: t; -*-

(use-package treesit-auto
  :custom (treesit-auto-install 'prompt)
  :config
  (setq treesit-language-source-alist
        (treesit-auto--build-treesit-source-alist))
  (treesit-auto-add-to-auto-mode-alist))

(use-package kotlin-ts-mode
  :mode "\\.kts?\\'")

(use-package eglot
  :ensure nil
  :hook ((c-ts-mode       . eglot-ensure)
         (c++-ts-mode     . eglot-ensure)
         (java-ts-mode    . eglot-ensure)
         (kotlin-ts-mode  . eglot-ensure)
         (python-ts-mode  . eglot-ensure))
  :config
  (setq eglot-autoshutdown t
        eglot-events-buffer-size 0
        eglot-sync-connect nil)
  (add-to-list 'eglot-server-programs
               '(kotlin-ts-mode . ("kotlin-language-server")))
  )

(use-package evil-textobj-tree-sitter
  :after evil
  :config
  ;; function -> f
  (define-key evil-outer-text-objects-map "f"
              (evil-textobj-tree-sitter-get-textobj "function.outer"))
  (define-key evil-inner-text-objects-map "f"
              (evil-textobj-tree-sitter-get-textobj "function.inner"))
  ;; class -> c
  (define-key evil-outer-text-objects-map "c"
              (evil-textobj-tree-sitter-get-textobj "class.outer"))
  (define-key evil-inner-text-objects-map "c"
              (evil-textobj-tree-sitter-get-textobj "class.inner"))
  ;; conditional -> g
  (define-key evil-outer-text-objects-map "g"
              (evil-textobj-tree-sitter-get-textobj "conditional.outer"))
  (define-key evil-inner-text-objects-map "g"
              (evil-textobj-tree-sitter-get-textobj "conditional.inner"))
  ;; loop -> l
  (define-key evil-outer-text-objects-map "l"
              (evil-textobj-tree-sitter-get-textobj "loop.outer"))
  (define-key evil-inner-text-objects-map "l"
              (evil-textobj-tree-sitter-get-textobj "loop.inner"))
  ;; comment -> m
  (define-key evil-outer-text-objects-map "m"
              (evil-textobj-tree-sitter-get-textobj "comment.outer"))
  (define-key evil-inner-text-objects-map "m"
              (evil-textobj-tree-sitter-get-textobj "comment.inner"))
  ;; call -> u
  (define-key evil-outer-text-objects-map "u"
              (evil-textobj-tree-sitter-get-textobj "call.outer"))
  (define-key evil-inner-text-objects-map "u"
              (evil-textobj-tree-sitter-get-textobj "call.inner"))
  ;; parameter -> a
  (define-key evil-outer-text-objects-map "a"
              (evil-textobj-tree-sitter-get-textobj "parameter.outer"))
  (define-key evil-inner-text-objects-map "a"
              (evil-textobj-tree-sitter-get-textobj "parameter.inner"))
  ;; --- Motions: Jump between functions / classes
  (evil-define-key 'normal 'global
    (kbd "] f") (lambda () (interactive)
                  (evil-textobj-tree-sitter-goto-textobj "function.outer"))
    (kbd "[ f") (lambda () (interactive)
                  (evil-textobj-tree-sitter-goto-textobj "function.outer" t))
    (kbd "] F") (lambda () (interactive)
                  (evil-textobj-tree-sitter-goto-textobj "function.outer" nil t))
    (kbd "[ F") (lambda () (interactive)
                  (evil-textobj-tree-sitter-goto-textobj "function.outer" t t))
    (kbd "] c") (lambda () (interactive)
                  (evil-textobj-tree-sitter-goto-textobj "class.outer"))
    (kbd "[ c") (lambda () (interactive)
                  (evil-textobj-tree-sitter-goto-textobj "class.outer" t)))
  ;; --- Register kotlin / zig
  (dolist (m '((kotlin-mode    . "kotlin")
               (kotlin-ts-mode . "kotlin")
               (zig-mode       . "zig")))
    (add-to-list 'evil-textobj-tree-sitter-major-mode-language-alist m)))


;;; eglot-treesitter.el
