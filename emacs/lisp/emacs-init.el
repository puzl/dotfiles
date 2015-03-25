(add-to-list 'load-path "~/.emacs.d/lisp")
(load-file "~/.emacs.d/lisp/init.el")
(load-file "~/.emacs.d/lisp/hjw.el")

(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))

;; org mode
(require 'org)
(setq org-log-done t)

;; check OS type
(cond
 ((string-equal system-type "windows-nt") ; Native windows
  (progn
    (require 'nt-emacs)
  )
  )
 ((string-equal system-type "cygwin") ; Cygwin windows
  (progn
    (require 'cygwin-emacs)
  )
  )
)

(require 'cl);

(require 'igrep)
(setq igrep-find-prune-clause  "-type d \\( -name RCS -o -name CVS -o -name SCCS -o -name obj \\)")
(setq igrep-find-file-clause "-type f \\! -name \\*\\~ \\! -name \\*\\,v \\! -name s.\\* \\! -name .\\#\\*e \\! -name \\*.keep \\! -name \\*.keep.\\[0-9\\]")

(delete-selection-mode 1)

(require 'bs)
(global-set-key (kbd "C-x C-b") 'bs-show)

