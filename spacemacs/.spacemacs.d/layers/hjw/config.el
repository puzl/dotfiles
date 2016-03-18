(add-to-list 'load-path "~/.spacemacs.d/elisp")
;(require 'clearcase)
;(add-to-list 'load-path "~/.spacemacs.d/clearcase")
(if (featurep 'clearcase)
    (define-key clearcase-prefix-map "b" 'clearcase-gui-vtree-browser-current-buffer)
  )

(add-to-list 'load-path "~/.spacemacs.d/vc-clearcase")
(require 'vc-clearcase)
(if (featurep 'vc-clearcase)
    (progn
      (define-key vc-prefix-map "b" 'vc-clearcase-gui-vtree-browser)
      )
  )

(require 'e6000-emacs)
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
