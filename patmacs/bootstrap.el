;;; bootstrap.el -*- lexical-binding: t; -*-

(defconst patmacs/modules-directory
  (file-name-as-directory (expand-file-name "patmacs" user-emacs-directory))
  "Directory containing patmacs configuration modules.")

(defun patmacs/load-if-exists (file)
  "Loads a file (relative to `patmacs/modules-directory') if it exists.
file may be given with or without .el ending."
  (load (expand-file-name file patmacs/modules-directory) 'noerror 'nomessage))

(defun patmacs/load-required (file)
  "Load config FILE (relative to `patmacs/modules-directory')."
  (let ((path (expand-file-name file patmacs/modules-directory)))
    (unless (file-exists-p path)
      (error "Required file could not be found: %s" path))
    (load path nil 'nomessage)))

;;; bootstrap.el ends here
