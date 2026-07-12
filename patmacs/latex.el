;;; latex.el -*- lexical-binding: t; -*-

(with-eval-after-load 'org
  (setq org-format-latex-options
        (plist-put org-format-latex-options :scale 3)))

;;; latex.el ends here
