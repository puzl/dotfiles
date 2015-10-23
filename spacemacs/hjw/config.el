(add-to-list 'load-path "~/.rcm/spacemacs/hjw/")
(require 'cygwin-mount)
(cygwin-mount-activate)

(require 'clearcase)
(require 'cygwin-emacs)
(require 'e6000-emacs)
(define-key clearcase-prefix-map "b" 'clearcase-gui-vtree-browser-current-buffer)

(setq-default tab-width 4 indent-tabs-mode nil)
(setq-default c-basic-offset 4 c-default-style "linux")

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))
(global-set-key (kbd "<f6>") 'next-error)
(global-set-key (kbd "<f7>") 'previous-error)
(global-set-key (kbd "<f8>") 'helm-gtags-find-files)
(global-set-key (kbd "<f9>") 'projectile-find-other-file)

(setq ad-redefinition-action 'accept)

; treat underscore as part of a word when double clicking
(modify-syntax-entry ?_ "w")

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "/home/hjw/emacs-backup"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups
