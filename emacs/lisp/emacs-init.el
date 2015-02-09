;; Packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)


(defconst my-packages
  '(company
    magit
    ggtags
    clean-aindent-mode
    company-c-headers
    igrep
    dtrt-indent
    ws-butler
    smartparens
    projectile
    function-args
    helm
    ))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package my-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))

(add-to-list 'default-frame-alist
                       '(font . "DejaVu Sans Mono-12"))

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

; ide
(add-to-list 'load-path "~/.emacs.d/ide")
(require 'ide)

(require 'cl);

(require 'igrep)
(setq igrep-find-prune-clause  "-type d \\( -name RCS -o -name CVS -o -name SCCS -o -name obj \\)")
(setq igrep-find-file-clause "-type f \\! -name \\*\\~ \\! -name \\*\\,v \\! -name s.\\* \\! -name .\\#\\*e \\! -name \\*.keep \\! -name \\*.keep.\\[0-9\\]")

(modify-syntax-entry ?_ "w")
(delete-selection-mode 1)

(require 'bs)
(global-set-key (kbd "C-x C-b") 'bs-show)

