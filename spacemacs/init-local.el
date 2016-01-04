(load-file (expand-file-name "~/.rcm/spacemacs/hjw/cygwin-emacs.el"))
(load-file (expand-file-name "~/.rcm/spacemacs/hjw/cygwin-mount.el"))
(cygwin-mount-activate)

(setq-default user-init-file "/home/hjw/.emacs.d/init.el")
(setq-default user-emacs-directory "/home/hjw/.emacs.d/")
(load user-init-file)
