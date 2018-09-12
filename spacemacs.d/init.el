;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(javascript
     smex
     helm
     html
     version-control
     git
     github
     (python :variables
             python-indent-level 4
             )
     org
     markdown
     emacs-lisp
     spell-checking
     (gtags :variables
            helm-gtags-style 'absolute
            heml-gtags-auto-update t
            )
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
            shell-default-term-shell "/bin/bash"
            shell-default-position 'bottom)
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(darkokai-theme doom-themes gotham-theme)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(yasnippet yasnippet-snippets auto-yasnippet helm-c-yasnippet)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa t

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   dotspacemacs-startup-recent-list-size 5

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         wombat
                         tangotango
                         doom-one
                         spacemacs-dark
                         solarized-dark
                         darkokai
                         tangotango
                         monokai
                         zenburn)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight semi-bold
                               :width condensed
                               :powerline-scale 1.1)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil

   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil

   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil

   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil

   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom

   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always

   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 10

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;(when (eq 'gnu/linux system-type)
    ;(setq spacemacs-cache-directory "/opt/hjw/spacemacs/cache")
    ;(setq package-user-dir "/opt/hjw/spacemacs/elpa")
    ;)

  (when (eq 'windows-nt system-type)
    (load-file (expand-file-name "~/.spacemacs.d/elisp/cygwin-emacs.el"))
    (load-file (expand-file-name "~/.spacemacs.d/elisp/cygwin-mount.el"))
    (cygwin-mount-activate)
    )
  (when (eq 'windows-nt system-type)
    (remove-hook 'find-file-hooks 'vc-find-file-hook))
  (setq darkokai-mode-line-padding 1)
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
                                        ;(spacemacs/toggle-transparency)
  ;  This is a workaround for bug on dev branch

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
  (global-set-key (kbd "<f10>") 'helm-projectile-find-file-in-known-projects)
  (global-set-key (kbd "<f11>") 'astyle-this-buffer)
  (global-set-key (kbd "<f12>") 'helm-resume)

  (setq projectile-generic-command "find . \\( -name build -o -name lost+found -o -name router -o -name obj-* -o -name *.state -o -name *.keep \\) -prune -o -type f -print0")

  (when (eq 'windows-nt system-type)
    (remove-hook 'find-file-hooks 'vc-find-file-hook))
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

  (add-to-list 'load-path "~/.spacemacs.d/elisp")
  (add-to-list 'load-path "~/.spacemacs.d/elisp")

  ;; (add-to-list 'load-path "~/.spacemacs.d/clearcase")
  ;; (require 'clearcase)
  ;; (if (featurep 'clearcase)
  ;;     (define-key clearcase-prefix-map "b" 'clearcase-gui-vtree-browser-current-buffer)
  ;;   )

  ;; (add-to-list 'load-path "~/.spacemacs.d/vc-clearcase")
  ;; (require 'vc-clearcase
  ;; (if (featurep 'vc-clearcase)
  ;;     (progn
  ;;       (define-key vc-prefix-map "b" 'vc-clearcase-gui-vtree-browser)
  ;;       )
  ;;   )

  (require 'e6000-emacs)
  (setq-default tab-width 4 indent-tabs-mode nil)
  (setq-default c-basic-offset 4 c-default-style "linux")

  ;; Compilation
  (global-set-key (kbd "<f5>") (lambda ()
                                 (interactive)
                                 (setq-local compilation-read-command nil)
                                 (call-interactively 'compile)))

  (setq ad-redefinition-action 'accept)

                                        ; treat underscore as part of a word when double clicking
  (modify-syntax-entry ?_ "w")
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
 '(compilation-message-face (quote default))
 '(compile-command "e6make sim")
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#424748" t)
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "obj-*")))
 '(helm-ag-ignore-patterns (quote ("obj-*")))
 '(helm-ag-use-grep-ignore-list t)
 '(helm-boring-file-regexp-list
   (quote
    ("\\.o$" "~$" "\\.bin$" "\\.bak$" "\\.obj$" "\\.map$" "\\.ico$" "\\.pif$" "\\.lnk$" "\\.a$" "\\.ln$" "\\.blg$" "\\.bbl$" "\\.dll$" "\\.drv$" "\\.vxd$" "\\.386$" "\\.elc$" "\\.lof$" "\\.glo$" "\\.idx$" "\\.lot$" "\\.svn$" "\\.hg$" "\\.git$" "\\.bzr$" "CVS$" "_darcs$" "_MTN$" "\\.fmt$" "\\.tfm$" "\\.class$" "\\.fas$" "\\.lib$" "\\.mem$" "\\.x86f$" "\\.sparcf$" "\\.dfsl$" "\\.pfsl$" "\\.d64fsl$" "\\.p64fsl$" "\\.lx64fsl$" "\\.lx32fsl$" "\\.dx64fsl$" "\\.dx32fsl$" "\\.fx64fsl$" "\\.fx32fsl$" "\\.sx64fsl$" "\\.sx32fsl$" "\\.wx64fsl$" "\\.wx32fsl$" "\\.fasl$" "\\.ufsl$" "\\.fsl$" "\\.dxl$" "\\.lo$" "\\.la$" "\\.gmo$" "\\.mo$" "\\.toc$" "\\.aux$" "\\.cp$" "\\.fn$" "\\.ky$" "\\.pg$" "\\.tp$" "\\.vr$" "\\.cps$" "\\.fns$" "\\.kys$" "\\.pgs$" "\\.tps$" "\\.vrs$" "\\.pyc$" "\\.pyo$" "^obj-" "^\\.abe")))
 '(helm-ff-skip-boring-files t)
 '(helm-follow-mode t t)
 '(helm-follow-mode-persistent t)
 '(helm-projectile-fuzzy-match t)
 '(helm-source-names-using-follow
   (quote
    (#("USING_DSQOS_P in /vobs/C4_hdwr/dprocs/" 0 13
       (c-in-sws t face font-lock-function-name-face fontified t))
     #("send_mmm_pkt_downstream_stripping_isl in /vobs/C4_hdwr/dprocs/" 0 37
       (face font-lock-function-name-face fontified t))
     #("send_pkt_ds_with_docsis_hdr in /vobs/C4_hdwr/dprocs/" 0 17
       (fontified t face font-lock-function-name-face)
       17 27
       (fontified t face font-lock-function-name-face))
     #("sendRawPacketBufferToPort in /hdwr/dprocs/" 0 25
       (face font-lock-function-name-face fontified t))
     #("freeSdvSession in x:/app/" 0 14
       (face font-lock-function-name-face fontified t))
     "Search at /hdwr/dprocs/"
     #("DHCPDISCOVER in /vobs/C4_app/" 0 12
       (fontified t))
     #("PHY_OP_SETMAX_SCDMA_MOD in /kernel/" 0 23
       (fontified t))
     #("buildRpdDsChanConfig in /app/" 0 20
       (face font-lock-function-name-face fontified t))
     #("buildRpdOperationMsg in /vobs/C4_app/" 0 20
       (fontified t))
     "Find tag from here"
     #("sendControlPacket in /vobs/C4_kernel/" 0 17
       (fontified t face font-lock-function-name-face))
     #("BCM3160TOP_MSG_DATA in /vobs/C4_kernel/" 0 19
       (face font-lock-variable-name-face c-in-sws t fontified t))
     #("usPhyDevInitTimeout in /vobs/C4_kernel/" 0 19
       (fontified t face font-lock-function-name-face))
     #("_txDepiPsp in /vobs/C4_hdwr/dprocs/" 0 10
       (face font-lock-function-name-face fontified t)))))
 '(highlight-changes-colors (quote ("#ff8eff" "#ab7eff")))
 '(highlight-tail-colors
   (quote
    (("#424748" . 0)
     ("#63de5d" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#424748" . 100))))
 '(ispell-dictionary "en_GB")
 '(magit-diff-use-overlays nil)
 '(neo-hidden-regexp-list (quote ("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "^obj-")))
 '(neo-show-hidden-files nil t)
 '(package-selected-packages
   (quote
    (doom-themes all-the-icons memoize org-mime ghub let-alist tagedit scss-mode sass-mode less-css-mode helm-css-scss fuzzy emmet-mode company-web web-completion-data slim-mode pug-mode org-category-capture dash-functional darkokai-theme haml-mode winum web-mode yapfify py-isort org-projectile org live-py-mode hide-comnt github-search marshal ht flyspell-correct-helm evil-unimpaired goto-chg undo-tree dumb-jump diminish powerline smeargle pyvenv pytest pyenv-mode py-yapf pip-requirements spinner orgit alert log4e gntp markdown-mode magit-gitflow magit-gh-pulls linum-relative hy-mode parent-mode helm-pydoc projectile helm-gitignore helm-flyspell gitignore-mode github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh logito pcache pkg-info epl flx evil-magit magit magit-popup git-commit with-editor smartparens iedit anzu highlight diff-hl cython-mode pos-tip company-anaconda company bracketed-paste packed anaconda-mode pythonic f dash s avy async auto-complete popup package-build bind-key bind-map evil helm helm-core hydra flycheck zenburn-theme xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tangotango-theme stickyfunc-enhance srefactor spacemacs-theme spaceline solarized-theme smooth-scrolling shell-pop restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox page-break-lines org-repo-todo org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file nlinum-relative neotree multi-term move-text monokai-theme mmm-mode markdown-toc macrostep lorem-ipsum link-hint leuven-theme info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gtags helm-flx helm-descbinds helm-company helm-ag google-translate golden-ratio gnuplot gh-md ggtags flyspell-correct flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav disaster define-word company-statistics company-quickhelp company-c-headers column-enforce-mode cmake-mode clean-aindent-mode clang-format buffer-move auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#E6DB74")
 '(pos-tip-foreground-color "#242728")
 '(projectile-enable-caching t)
 '(projectile-indexing-method (quote alien))
 '(projectile-tags-command "ggtags -u")
 '(ring-bell-function (quote ignore))
 '(safe-local-variable-values
   (quote
    ((clearcase-version-stamp-active . t)
     (folded-file . t)
     (ispell-personal-dictionary . "/home/hjw/org/ecmg-test-plan.dict")
     (ispell-personal-dictionary . "~/org/ecmg-test-plan.dict")
     (ispell-personal-dictionary . "ecmg-test-plan.dict")
     (ispell-dictionary . "english"))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#ff0066")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#63de5d")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#53f2dc")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#06d8ff"))))
 '(vc-annotate-very-old-color nil)
 '(vc-clearcase-diff-switches (quote ("-option \"-blank_ignore\"")))
 '(weechat-color-list
   (unspecified "#242728" "#424748" "#F70057" "#ff0066" "#86C30D" "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff" "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc" "#ffffff")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
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
 '(compilation-message-face (quote default))
 '(compile-command "e6make sim")
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#424748" t)
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "obj-*")))
 '(helm-ag-ignore-patterns (quote ("obj-*")))
 '(helm-ag-use-grep-ignore-list t t)
 '(helm-boring-file-regexp-list
   (quote
    ("\\.o$" "~$" "\\.bin$" "\\.bak$" "\\.obj$" "\\.map$" "\\.ico$" "\\.pif$" "\\.lnk$" "\\.a$" "\\.ln$" "\\.blg$" "\\.bbl$" "\\.dll$" "\\.drv$" "\\.vxd$" "\\.386$" "\\.elc$" "\\.lof$" "\\.glo$" "\\.idx$" "\\.lot$" "\\.svn$" "\\.hg$" "\\.git$" "\\.bzr$" "CVS$" "_darcs$" "_MTN$" "\\.fmt$" "\\.tfm$" "\\.class$" "\\.fas$" "\\.lib$" "\\.mem$" "\\.x86f$" "\\.sparcf$" "\\.dfsl$" "\\.pfsl$" "\\.d64fsl$" "\\.p64fsl$" "\\.lx64fsl$" "\\.lx32fsl$" "\\.dx64fsl$" "\\.dx32fsl$" "\\.fx64fsl$" "\\.fx32fsl$" "\\.sx64fsl$" "\\.sx32fsl$" "\\.wx64fsl$" "\\.wx32fsl$" "\\.fasl$" "\\.ufsl$" "\\.fsl$" "\\.dxl$" "\\.lo$" "\\.la$" "\\.gmo$" "\\.mo$" "\\.toc$" "\\.aux$" "\\.cp$" "\\.fn$" "\\.ky$" "\\.pg$" "\\.tp$" "\\.vr$" "\\.cps$" "\\.fns$" "\\.kys$" "\\.pgs$" "\\.tps$" "\\.vrs$" "\\.pyc$" "\\.pyo$" "^obj-" "^\\.abe")))
 '(helm-ff-skip-boring-files t)
 '(helm-follow-mode t t)
 '(helm-follow-mode-persistent t)
 '(helm-projectile-fuzzy-match t)
 '(helm-source-names-using-follow
   (quote
    (#("USING_DSQOS_P in /vobs/C4_hdwr/dprocs/" 0 13
       (fontified t face font-lock-function-name-face c-in-sws t))
     #("send_mmm_pkt_downstream_stripping_isl in /vobs/C4_hdwr/dprocs/" 0 37
       (fontified t face font-lock-function-name-face))
     #("send_pkt_ds_with_docsis_hdr in /vobs/C4_hdwr/dprocs/" 0 17
       (face font-lock-function-name-face fontified t)
       17 27
       (face font-lock-function-name-face fontified t))
     #("sendRawPacketBufferToPort in /hdwr/dprocs/" 0 25
       (fontified t face font-lock-function-name-face))
     #("freeSdvSession in x:/app/" 0 14
       (fontified t face font-lock-function-name-face))
     "Search at /hdwr/dprocs/"
     #("DHCPDISCOVER in /vobs/C4_app/" 0 12
       (fontified t))
     #("PHY_OP_SETMAX_SCDMA_MOD in /kernel/" 0 23
       (fontified t))
     #("buildRpdDsChanConfig in /app/" 0 20
       (fontified t face font-lock-function-name-face))
     #("buildRpdOperationMsg in /vobs/C4_app/" 0 20
       (fontified t))
     "Find tag from here"
     #("sendControlPacket in /vobs/C4_kernel/" 0 17
       (face font-lock-function-name-face fontified t))
     #("BCM3160TOP_MSG_DATA in /vobs/C4_kernel/" 0 19
       (fontified t c-in-sws t face font-lock-variable-name-face))
     #("usPhyDevInitTimeout in /vobs/C4_kernel/" 0 19
       (face font-lock-function-name-face fontified t))
     #("_txDepiPsp in /vobs/C4_hdwr/dprocs/" 0 10
       (fontified t face font-lock-function-name-face)))))
 '(highlight-changes-colors (quote ("#ff8eff" "#ab7eff")))
 '(highlight-tail-colors
   (quote
    (("#424748" . 0)
     ("#63de5d" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#424748" . 100))))
 '(ispell-dictionary "en_GB")
 '(magit-diff-use-overlays nil)
 '(neo-hidden-regexp-list (quote ("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "^obj-")))
 '(neo-show-hidden-files nil t)
 '(package-selected-packages
   (quote
    (json-navigator hierarchy json-mode json-snatcher json-reformat company-tern doom-themes all-the-icons memoize org-mime ghub let-alist tagedit scss-mode sass-mode less-css-mode helm-css-scss fuzzy emmet-mode company-web web-completion-data slim-mode pug-mode org-category-capture dash-functional darkokai-theme haml-mode winum web-mode yapfify py-isort org-projectile org live-py-mode hide-comnt github-search marshal ht flyspell-correct-helm evil-unimpaired goto-chg undo-tree dumb-jump diminish powerline smeargle pyvenv pytest pyenv-mode py-yapf pip-requirements spinner orgit alert log4e gntp markdown-mode magit-gitflow magit-gh-pulls linum-relative hy-mode parent-mode helm-pydoc projectile helm-gitignore helm-flyspell gitignore-mode github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh logito pcache pkg-info epl flx evil-magit magit magit-popup git-commit with-editor smartparens iedit anzu highlight diff-hl cython-mode pos-tip company-anaconda company bracketed-paste packed anaconda-mode pythonic f dash s avy async auto-complete popup package-build bind-key bind-map evil helm helm-core hydra flycheck zenburn-theme xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tangotango-theme stickyfunc-enhance srefactor spacemacs-theme spaceline solarized-theme smooth-scrolling shell-pop restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox page-break-lines org-repo-todo org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file nlinum-relative neotree multi-term move-text monokai-theme mmm-mode markdown-toc macrostep lorem-ipsum link-hint leuven-theme info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gtags helm-flx helm-descbinds helm-company helm-ag google-translate golden-ratio gnuplot gh-md ggtags flyspell-correct flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav disaster define-word company-statistics company-quickhelp company-c-headers column-enforce-mode cmake-mode clean-aindent-mode clang-format buffer-move auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#E6DB74")
 '(pos-tip-foreground-color "#242728")
 '(projectile-enable-caching t)
 '(projectile-indexing-method (quote alien))
 '(projectile-tags-command "ggtags -u")
 '(ring-bell-function (quote ignore))
 '(safe-local-variable-values
   (quote
    ((clearcase-version-stamp-active . t)
     (folded-file . t)
     (ispell-personal-dictionary . "/home/hjw/org/ecmg-test-plan.dict")
     (ispell-personal-dictionary . "~/org/ecmg-test-plan.dict")
     (ispell-personal-dictionary . "ecmg-test-plan.dict")
     (ispell-dictionary . "english"))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#ff0066")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#63de5d")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#53f2dc")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#06d8ff"))))
 '(vc-annotate-very-old-color nil)
 '(vc-clearcase-diff-switches (quote ("-option \"-blank_ignore\"")))
 '(weechat-color-list
   (unspecified "#242728" "#424748" "#F70057" "#ff0066" "#86C30D" "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff" "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc" "#ffffff")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
