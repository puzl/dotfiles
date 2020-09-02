;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;;

(global-set-key (kbd "<f6>") 'counsel-semantic-or-imenu)
(global-set-key (kbd "<f7>") 'previous-error)
(global-set-key (kbd "<f8>") 'next-error)
(global-set-key (kbd "<f9>") 'swiper-thing-at-point)
(global-set-key (kbd "<f10>") 'swiper-all)
(global-set-key (kbd "<f11>") 'swiper)
(global-set-key (kbd "<f12>") 'ivy-resume)


;(which-function-mode)

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

;(def-package! clearcase
;  :commands (clearcase-mode
;             clearcase-ediff-pred-current-buffer
;             clearcase-unreserved-checkout-current-buffer
;             clearcase-uncheckout-current-buffer
;             clearcase-checkin-current-buffer)
;  :init
;  (setq-default clearcase-keep-uncheckouts nil)
;  (setq-default clearcase-suppress-checkout-comments t)
;  )

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

;;-------------
;;Add color to the current GUD line (obrigado google)

(defvar gud-overlay
(let* ((ov (make-overlay (point-min) (point-min))))
(overlay-put ov 'face 'secondary-selection)
ov)
"Overlay variable for GUD highlighting.")

(defadvice gud-display-line (after my-gud-highlight act)
"Highlight current line."
(let* ((ov gud-overlay)
(bf (gud-find-file true-file)))
(save-excursion
  (set-buffer bf)
  (move-overlay ov (line-beginning-position) (line-end-position)
  (current-buffer)))))

(defun gud-kill-buffer ()
(if (eq major-mode 'gud-mode)
(delete-overlay gud-overlay)))

(add-hook 'kill-buffer-hook 'gud-kill-buffer)
;;-------------------------------------------------------------
(setq doom-font (font-spec :family "Overpass Mono" :size 20))
(setq projectile-generic-command "find . \\( -name build -o -name lost+found -o -name obj-* -o -name *.state -o -name *.keep \\) -prune -o -type f -print0")

(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(semantic-mode 1)
(require 'stickyfunc-enhance)
