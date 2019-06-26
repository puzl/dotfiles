;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;;

(global-set-key (kbd "<f7>") 'previous-error)
(global-set-key (kbd "<f8>") 'next-error)
(global-set-key (kbd "<f9>") 'swiper-thing-at-point)
(global-set-key (kbd "<f10>") 'swiper-all)
(global-set-key (kbd "<f11>") 'swiper)
(global-set-key (kbd "<f12>") 'ivy-resume)


(which-function-mode)

(setq mode-line-format (delete (assoc 'which-func-mode
                                      mode-line-format) mode-line-format)
      which-func-header-line-format '(which-func-mode ("" which-func-format)))
(defadvice which-func-ff-hook (after header-line activate)
  (when which-func-mode
    (setq mode-line-format (delete (assoc 'which-func-mode
                                          mode-line-format) mode-line-format)
          header-line-format which-func-header-line-format)))


(add-to-list 'company-backends 'company-gtags)
(after! cc-mode
  (set-company-backend! 'c-mode
    '(:separate company-gtags)))

(def-package! clearcase
  :commands (clearcase-mode
             clearcase-ediff-pred-current-buffer
             clearcase-unreserved-checkout-current-buffer
             clearcase-uncheckout-current-buffer
             clearcase-checkin-current-buffer)
  :init
  (setq-default clearcase-keep-uncheckouts nil)
  (setq-default clearcase-suppress-checkout-comments t)
  )

(map! :leader
      :prefix ("v" . "clearcase")
      "=" #'clearcase-ediff-pred-current-buffer
      "o" #'clearcase-unreserved-checkout-current-buffer
      "u" #'clearcase-uncheckout-current-buffer
      "i" #'clearcase-checkin-current-buffer
      )

(after! projectile
  (setq projectile-track-known-projects-automatically nil)
  (global-set-key [remap evil-jump-to-tag] #'ggtags-find-tag-dwim)
  (global-set-key [remap find-tag]         #'ggtags-find-tag-dwim)
  )

(setq flycheck-disabled-checkers '(c/c++-clang c/c++-gcc))
(setq flycheck-cppcheck-checks "all")
