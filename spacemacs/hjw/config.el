(add-to-list 'load-path "~/.rcm/spacemacs/hjw/")
(require 'cygwin-mount)
(cygwin-mount-activate)

(require 'clearcase)
(require 'cygwin-emacs)
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
(global-set-key (kbd "<f8>") 'ggtags-find-file)

(setq ad-redefinition-action 'accept)
