(provide 'e6000-emacs)

;; make backup to a designated dir, mirroring the full path
(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let* (
        (backupRootDir "/home/emacs-backup/")
        (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path, ⁖ “C:”
        (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
        )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath
  )
)

;(setq make-backup-file-name-function 'my-backup-file-name)

; clearcase
(require 'clearcase)
(define-key clearcase-prefix-map "b" 'clearcase-gui-vtree-browser-current-buffer)
(require 'cl) ; If you don't have it already

(defun* get-closest-pathname (&optional (file "Makefile"))
  "Determine the pathname of the first instance of FILE starting from the current directory towards root.
This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
of FILE in the current directory, suitable for creation"
  (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
    (expand-file-name file
              (loop
            for d = default-directory then (expand-file-name ".." d)
            if (file-exists-p (expand-file-name file d))
            return d
            if (equal d root)
            return nil))))

(require 'compile)
 (add-hook 'c-mode-hook (lambda () (set (make-local-variable 'compile-command) (format "cd $(edirname %s); x86make " (get-closest-pathname)))))

(require 'cygwin-mount)
(cygwin-mount-activate)
