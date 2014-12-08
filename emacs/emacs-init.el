;; Packages

(package-initialize)
(defconst my-packages
  '(company
    magit
    ggtags
    helm
    helm-gtags
    function-args
    clean-aindent-mode
    company-c-headers
    igrep
    dtrt-indent
    ws-butler
    yasnippet
    smartparens
    aggressive-indent
    projectile))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package my-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))

(add-to-list 'default-frame-alist
                       '(font . "DejaVu Sans Mono-12"))

;; org mode
(require 'org)
(setq org-log-done t)

;; Windows
(when (eq system-type 'cygwin)     (load "cygwin-emacs.el"))
(when (eq system-type 'windows-nt) (load "nt-emacs.el"))

; ide
(add-to-list 'load-path "~/.emacs.d/ide")
(load-library "ide.el")

(require 'cl);

(require 'igrep)
(setq igrep-find-prune-clause  "-type d \\( -name RCS -o -name CVS -o -name SCCS -o -name obj \\)")
(setq igrep-find-file-clause "-type f \\! -name \\*\\~ \\! -name \\*\\,v \\! -name s.\\* \\! -name .\\#\\*e \\! -name \\*.keep \\! -name \\*.keep.\\[0-9\\]")

(modify-syntax-entry ?_ "w")
(delete-selection-mode 1)

(require 'bs)
(global-set-key (kbd "C-x C-b") 'bs-show)

