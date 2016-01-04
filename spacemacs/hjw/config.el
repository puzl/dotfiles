(add-to-list 'load-path "~/.rcm/spacemacs/hjw/")

(require 'clearcase)
(require 'e6000-emacs)
(define-key clearcase-prefix-map "b" 'clearcase-gui-vtree-browser-current-buffer)

(setq-default tab-width 4 indent-tabs-mode nil)
(setq-default c-basic-offset 4 c-default-style "linux")

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

(setq ad-redefinition-action 'accept)

; treat underscore as part of a word when double clicking
(modify-syntax-entry ?_ "w")
