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
         srefactor
         ;ggtags
         )
       )

;; (setq hjw-excluded-packages '())

;; For each package, define a function hjw/init-<package-hjw>
;;
;; (defun hjw/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
;; (defun hjw/init-igrep ()
;;   (use-package igrep
;;     :config
;;     (progn
;;        (spacemacs/declare-prefix "oi" "igrep")
;;        (evil-leader/set-key "oii" 'igrep-find
;;          "oif" 'igrep-find
;;          "oiv" 'igrep-visited-files
;;          ))
;;     )
;;   (setq igrep-null-device "/dev/null") 
;;   )

;;(defun hjw/init-ggtags ()
  ;;(use-package ggtags
    ;;:config
    ;;(progn
       ;;(spacemacs/declare-prefix "mg" "ggtags")
       ;;(evil-leader/set-key
         ;;"mgd" 'ggtags-find-tag-dwim
         ;;"mgr" 'ggtags-find-reference
         ;;"mg/" 'ggtags-find-tag-regexp
         ;;"mgh" 'ggtags-view-tag-history
         ;;"mgs" 'ggtags-grep
         ;;"mgu" 'ggtags-update-tags
         ;;)
       ;;)
    ;;)
  ;;)
;;
