(if (eq system-type 'cygwin)
    (setq user-emacs-directory "/home/hjw/.emacs.d")
  )

(if (eq system-type 'windowsnt)
    (setq user-emacs-directory "c:/Users/hjwAppData/Roaming/.emacs.d")
  )

(load (expand-file-name "init.el" user-emacs-directory))
