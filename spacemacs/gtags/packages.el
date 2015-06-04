;;; packages.el --- gtags Layer packages File for Spacemacs
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

(setq gtags-packages
  '(
    ;; package gtagss go here
    helm-gtags
    ggtags
    )
  )

(setq gtags-excluded-packages '()
  )

;; For each package, define a function gtags/init-<package-gtags>
;;
;; (defun gtags/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun gtags/init-ggtags ()
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

(defun gtags/init-helm-gtags ()
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
