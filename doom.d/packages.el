;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)
;;

;; Disable packages provided by DOOM

(package! irony :disable t)
(package! emacs-snippets :disable t)


;; Add custom packages for me
(package! ggtags :recipe (:fetcher github :repo "leoliu/ggtags"))
(package! clearcase :recipe (:fetcher github :repo "hackonteur/clearcase-mode"))
