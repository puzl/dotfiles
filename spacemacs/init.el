
(load-file (expand-file-name "~/.rcm/spacemacs/hjw/cygwin-emacs.el"))
(load-file (expand-file-name "~/.rcm/spacemacs/hjw/cygwin-mount.el"))
(cygwin-mount-activate)

(setq user-init-file "~/.emacs.d/init.el")
(setq user-emacs-directory "~/.emacs.d/")
(setq spacemacs-cache-directory "/home/hjw/.emacs.d/.cache")
(load-file (expand-file-name "~/.emacs.d/init.el"))

