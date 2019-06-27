(setq use-spacemacs nil)
(setq use-doom t)

(if (eq system-type 'gnu/linux)
  (cond (use-spacemacs (setq user-emacs-directory "/opt/hjw/emacs/spacemacs/source/"))
        (use-doom (setq user-emacs-directory "/opt/hjw/emacs/doom/source")))
  )

(if (eq system-type 'cygwin)
 (setq user-emacs-directory "/home/hjw/.emacs.d")
  )

(if (eq system-type 'windowsnt)
 (setq user-emacs-directory "c:/Users/hjwAppData/Roaming/.emacs.d")
  )


(load (expand-file-name "init.el" user-emacs-directory))
