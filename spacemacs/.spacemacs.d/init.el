;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     python
     org
     markdown
     emacs-lisp
     spell-checking
     gtags
     semantic
     (syntax-checking :variables
                      flycheck-disabled-checkers '(c/c++-clang c/c++-gcc)
                      flycheck-cppcheck-checks "all"
                      )

     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode)

     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-emable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t)

     (shell :variables
             shell-default-height 30
             shell-default-term-shell "/bin/zsh"
             shell-default-position 'bottom)
     hjw
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(darkokai-theme)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(yasnippet yasnippet-snippets auto-yasnippet helm-c-yasnippet)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         darkokai
                         tangotango
                         spacemacs-dark
                         solarized-dark
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight semi-bold
                               :width condensed
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all',
   ;; `trailing', `changed' or `nil'. Default is `changed' (cleanup whitespace
   ;; on changed lines) (default 'changed)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost any
user code here.  The exception is org related code, which should be placed in
`dotspacemacs/user-config'."
  (load-file (expand-file-name "~/.spacemacs.d/elisp/cygwin-emacs.el"))
  (load-file (expand-file-name "~/.spacemacs.d/elisp/cygwin-mount.el"))
  (cygwin-mount-activate)
  (remove-hook 'find-file-hooks 'vc-find-file-hook)
  (setq darkokai-mode-line-padding 1)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (setq-local imenu-create-index-function #'ggtags-build-imenu-index)
  ;(setq dotspacemacs-additional-packages '(org-plus-contrib))
  (define-key global-map "\C-cc" 'org-capture)
  (define-key global-map "\C-ct"
    (lambda () (interactive) (org-capture nil "t")))
  (define-key global-map "\C-cj"
    (lambda () (interactive) (org-capture nil "j")))

  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t)

  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
           "* TODO %?\n  %i\n  %a\n\n")
          ("j" "Journal" entry (file+datetree "~/org/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")))

  (setq org-agenda-files '("~/org"))
  (setq org-export-preserve-breaks t)
  (setq org-export-with-sub-superscripts nil)
  (setq org-enforce-todo-dependencies t)

  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  (global-company-mode)

  (setq-default dotspacemacs-smartparens-strict-mode t)

  (setq spacemacs/toggle-fringe t
        spacemacs/toggle-highlight-indentation t
        spacemacs/toggle-highlight-indentation-current-column t
        spacemacs/toggle-truncate-lines t
        spacemacs/toggle-line-numbers t
        spacemacs/toggle-automatic-symbol-highlight t
        spacemacs/toggle-fill-column-indicator t
        )
  (defun astyle-this-buffer (pmin pmax)
    (interactive "r")
    (shell-command-on-region pmin pmax
                             "astyle" ;; add options here...
                             (current-buffer) t
                             (get-buffer-create "*Astyle Errors*") t))

  (global-set-key (kbd "<f6>") 'next-error)
  (global-set-key (kbd "<f7>") 'previous-error)
  (global-set-key (kbd "<f8>") 'helm-projectile-find-file)
  (global-set-key (kbd "<f9>") 'projectile-find-other-file)
  (global-set-key (kbd "<f11>") 'astyle-this-buffer)
  (global-set-key (kbd "<f12>") 'helm-resume)

  (setq projectile-generic-command "find . \\( -name lost+found -o -name router -o -name docsis -o -name obj-* -o -name *.state -o -name *.keep \\) -prune -o -type f -print0")

  (remove-hook 'find-file-hooks 'vc-find-file-hook)
  (setq nlinum-relative-redisplay-delay 0.2)

  (setq my-include-directories
        '("../"
          "/app/h"
          "/vendor/ibm/Rhapsody/Share/LangCpp"
          "/vendor/ibm/Rhapsody/Share/LangCpp/osconfig/VxWorks"
          "/system/kernel/intf"
          "/system/dataplanes/intf"
          "/app/video/h"
          "/app/video/common/h"
          "/app/video/encryption/h"
          "/app/common/uml/CommonLibrary"
          "/app/common/uml/h"
          "/app/router/h"
          "/vendor/windriver/vxworks/target/h"
          "/vendor/windriver/vxworks/target/usr/h/wrn/wm/common"
          "/vendor/windriver/vxworks/target/usr/h"
          "/vendor/windriver/vxworks/target/usr/h/wrn/coreip"
          "/vendor/windriver/vxworks/target/usr/h/c/abr"
          "/vendor/windriver/vxworks/target/usr/h/c"
          )
        )

  (defun my-semantic-hook ()
    (mapcar 'semantic-add-system-include my-include-directories)
    )

  (add-hook 'semantic-init-hook 'my-semantic-hook)

  (defun my-flycheck-hook ()
    (setq flycheck-cppcheck-include-path my-include-directories)
    )

  (add-hook 'c-common-mode-hook 'my-flycheck-hook)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil t)
 '(ahs-default-range (quote ahs-range-whole-buffer) t)
 '(ahs-idle-interval 0.25 t)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil t)
 '(clearcase-checkout-comment-type (quote none))
 '(clearcase-checkout-policy (quote unreserved))
 '(clearcase-dir-status-ignored-files (quote ("^obj-.*")))
 '(compile-command "e6make sim")
 '(helm-boring-file-regexp-list
   (quote
    ("\\.o$" "~$" "\\.bin$" "\\.bak$" "\\.obj$" "\\.map$" "\\.ico$" "\\.pif$" "\\.lnk$" "\\.a$" "\\.ln$" "\\.blg$" "\\.bbl$" "\\.dll$" "\\.drv$" "\\.vxd$" "\\.386$" "\\.elc$" "\\.lof$" "\\.glo$" "\\.idx$" "\\.lot$" "\\.svn$" "\\.hg$" "\\.git$" "\\.bzr$" "CVS$" "_darcs$" "_MTN$" "\\.fmt$" "\\.tfm$" "\\.class$" "\\.fas$" "\\.lib$" "\\.mem$" "\\.x86f$" "\\.sparcf$" "\\.dfsl$" "\\.pfsl$" "\\.d64fsl$" "\\.p64fsl$" "\\.lx64fsl$" "\\.lx32fsl$" "\\.dx64fsl$" "\\.dx32fsl$" "\\.fx64fsl$" "\\.fx32fsl$" "\\.sx64fsl$" "\\.sx32fsl$" "\\.wx64fsl$" "\\.wx32fsl$" "\\.fasl$" "\\.ufsl$" "\\.fsl$" "\\.dxl$" "\\.lo$" "\\.la$" "\\.gmo$" "\\.mo$" "\\.toc$" "\\.aux$" "\\.cp$" "\\.fn$" "\\.ky$" "\\.pg$" "\\.tp$" "\\.vr$" "\\.cps$" "\\.fns$" "\\.kys$" "\\.pgs$" "\\.tps$" "\\.vrs$" "\\.pyc$" "\\.pyo$" "^obj-" "^\\.abe")))
 '(helm-ff-skip-boring-files t)
 '(helm-follow-mode t t)
 '(helm-follow-mode-persistent t)
 '(helm-projectile-fuzzy-match t)
 '(ispell-dictionary "en_GB")
 '(neo-hidden-regexp-list (quote ("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "^obj-")))
 '(neo-show-hidden-files nil t)
 '(package-selected-packages
   (quote
    (helm helm-core hydra flycheck zenburn-theme xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tangotango-theme stickyfunc-enhance srefactor spacemacs-theme spaceline solarized-theme smooth-scrolling shell-pop restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox page-break-lines org-repo-todo org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file nlinum-relative neotree multi-term move-text monokai-theme mmm-mode markdown-toc macrostep lorem-ipsum link-hint leuven-theme info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gtags helm-flx helm-descbinds helm-company helm-ag google-translate golden-ratio gnuplot gh-md ggtags flyspell-correct flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav disaster define-word company-statistics company-quickhelp company-c-headers column-enforce-mode cmake-mode clean-aindent-mode clang-format buffer-move auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(projectile-indexing-method (quote alien) t)
 '(projectile-tags-command "ggtags -u")
 '(ring-bell-function (quote ignore))
 '(safe-local-variable-values
   (quote
    ((ispell-personal-dictionary . "/home/hjw/org/ecmg-test-plan.dict")
     (ispell-personal-dictionary . "~/org/ecmg-test-plan.dict")
     (ispell-personal-dictionary . "ecmg-test-plan.dict")
     (ispell-dictionary . "english"))))
 '(vc-clearcase-diff-switches (quote ("-g -option \"-blank_ignore\""))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
