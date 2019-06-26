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
