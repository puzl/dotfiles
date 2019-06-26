(setq use-spacemacs nil)
(setq use-doom t)
(cond (use-spacemacs (setq user-emacs-directory "/opt/hjw/emacs/spacemacs/source/"))
      (use-doom (setq user-emacs-directory "/opt/hjw/emacs/doom/source")))

(load (expand-file-name "init.el" user-emacs-directory))
