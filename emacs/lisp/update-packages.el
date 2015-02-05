(defun package-installed-and-up-to-date-p (package)
  ;assumes that package-refresh-contents has already been called
  ;also assume all built-in packages are out of date, which is usually true.
  (if (not (package-installed-p package))
    nil
    (let* ((newest-desc  (cdr (assq package package-archive-contents)))
           (installed-desc (cdr (or (assq package package-alist) (assq package package--builtins))))
           (newest-version  (package-desc-vers newest-desc))
           (installed-version (package-desc-vers installed-desc)))
             (or (equal installed-version newest-version) (version-list-< newest-version installed-version)))))

(message "%s" "Emacs Prelude is now refreshing its package database...")
(package-refresh-contents)
(message "%s" " done.")

(defvar gordon-packages '(color-theme org auctex frame-cmds frame-fns
                          bash-completion csharp-mode openwith git-commit-mode
                          magit auto-complete smex rainbow-delimiters dsvn
                          ggtags goto-chg undo-tree)
  "Packages that will be installed/updated to the latest version on startup")

(dolist (package gordon-packages)
  (when (not (package-installed-and-up-to-date-p package))
    (package-install package)))

(dolist (upgradeable-packgage (package-menu--find-upgrades))
  (package-install upgradeable-packgage))
