;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)
;;
(package! ggtags :recipe (:fetcher github :repo "leoliu/ggtags"))
;;;(package! clearcase :recipe (:fetcher github :repo "hackonteur/clearcase-mode"))
;;(package! vc-clearcase :recipe (:fetcher github :repo "alex-hhh/vc-clearcase"))
(package! irony :disable t)

(package! emacs-snippets :ignore t)
