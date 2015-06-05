;;; packages.el --- hjw Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
(setq hjw-packages
      '(
        helm-gtags
        ggtags
        igrep
        )
      )

(setq hjw-excluded-packages '())

;; For each package, define a function hjw/init-<package-hjw>
;;
;; (defun hjw/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
(defun hjw/init-igrep ()
  (use-package igrep
    :config
    (progn
       (spacemacs/declare-prefix "oi" "igrep")
       (evil-leader/set-key "oii" 'igrep-find
         "oif" 'igrep-find
         "oiv" 'igrep-visited-files
         ))
    )
  (setq igrep-null-device "/dev/null") 
  )

(defun hjw/init-ggtags ()
  (use-package ggtags
    :config
    ;; (progn
    ;;   (spacemacs/declare-prefix "og" "gtags")
    ;;   (evil-leader/set-key "ogg" 'ggtags-find-tag-dwim
    ;;     "ogd" 'ggtags-find-definition
    ;;     "ogr" 'ggtags-find-reference
    ;;     "ogS" 'ggtags-find-other-symbol
    ;;     "ogF" 'ggtags-find-file
    ;;     ;; need to find good bingings for these
    ;;     ;; "oge" 'ggtags-find-tag-regexp
    ;;     ;; "ogp" 'ggtags-grep
    ;;     ;; "ogl" 'ggtags-query-replace
    ;;     ))
    ))

(defun hjw/init-helm-gtags ()
  (use-package helm-gtags
    :config
    (progn
      (spacemacs/declare-prefix "og" "gtags")
      (evil-leader/set-key "ogg" 'helm-gtags-dwim
        "ogd" 'helm-gtags-find-tag      ; find definition
        "ogr" 'helm-gtags-find-rtag     ; find references
        "ogs" 'helm-gtags-select
        "ogp" 'helm-gtags-pop-stack     ; jump back
        ;; "ogS" 'helm-gtags-find-symbol
        "ogf" 'helm-gtags-tags-in-this-function
        "ogF" 'helm-gtags-find-files
        "ogU" 'helm-gtags-update-tags
        "ogP" 'helm-gtags-parse-file)))
  (require 'evil)
  (define-key evil-normal-state-map (kbd "C-]") 'helm-gtags-find-tag)
  (define-key evil-normal-state-map (kbd "C-=") 'helm-gtags-find-rtag) ;reference
  (define-key evil-normal-state-map (kbd "C-/") 'helm-gtags-find-symbol)
  (define-key evil-normal-state-map (kbd "C-t") 'helm-gtags-pop-stack)
  )
