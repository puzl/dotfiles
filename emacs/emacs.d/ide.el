(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

(defconst demo-packages
  '(company
    ggtags
    helm
    helm-gtags
    function-args
    clean-aindent-mode
    company-c-headers
    igrep
    dtrt-indent
    ws-butler
    yasnippet
    smartparens
    projectile))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package demo-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
;(setq helm-gtags-prefix-key "\C-cg")

(add-to-list 'load-path "~/.emacs.d/custom")

;(require 'setup-helm)
;(require 'setup-helm-gtags)
(require 'setup-ggtags)
(require 'setup-cedet)

;; function-args
(require 'function-args)
(fa-config-default)
(define-key c-mode-map  [(shift tab)] 'moo-complete)
(define-key c++-mode-map  [(shift tab)] 'moo-complete)
(define-key c-mode-map (kbd "M-o")  'fa-show)
(define-key c++-mode-map (kbd "M-o")  'fa-show)


;; company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(delete 'company-semantic company-backends)
(define-key c-mode-map  [(control tab)] 'company-complete)
(define-key c++-mode-map  [(control tab)] 'company-complete)

;; company-c-headers
(add-to-list 'company-backends 'company-c-headers)

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)


(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))
(global-set-key (kbd "<f6>") 'next-error)
(global-set-key (kbd "<f7>") 'previous-error)
(global-set-key (kbd "<f8>") 'ggtags-find-file)

;; Package: clean-aindent-mode
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Package: dtrt-indent
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;; Package: ws-butler
(require 'ws-butler)
(add-hook 'prog-mode-hook 'ws-butler-mode)

;; Package: yasnippet
;(require 'yasnippet)
;(yas-global-mode 1)

;; Package: smartparens
(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;; Package: projejctile
;(require 'projectile)
;(projectile-global-mode)
;(setq projectile-enable-caching t)

(setq-local imenu-create-index-function #'ggtags-build-imenu-index)
(add-to-list 'company-backends 'company-c-headers)

(define-key c-mode-map (kbd "M-o")  'fa-show)
(define-key c++-mode-map (kbd "M-o")  'fa-show)

(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

(semantic-add-system-include "/vendor/windriver/vxworks/target/usr/h/" 'c-mode)
(semantic-add-system-include "/vendor/windriver/vxworks/target/h" 'c-mode)
(semantic-add-system-include "/vendor/windriver/vxworks/target/usr/h/c++" 'c++-mode)
(semantic-add-system-include "/vendor/ibm/Rhapsody/Share/LangCpp" 'c++-mode)

(semantic-add-system-include "/app/h" 'c-mode)
(semantic-add-system-include "/app/common/h" 'c-mode)
(semantic-add-system-include "/app/oamp/anm/h" 'c-mode)
(semantic-add-system-include "/app/video/h" 'c-mode)
(semantic-add-system-include "/app/video/erm/h" 'c-mode)
(semantic-add-system-include "/app/video/dcam/h" 'c-mode)
(semantic-add-system-include "/app/video/rsm/h" 'c-mode)
(semantic-add-system-include "/app/video/mpegMgr/h" 'c-mode)
(semantic-add-system-include "/app/video/mpegTask/h" 'c-mode)
(semantic-add-system-include "/app/video/common/h" 'c-mode)
(semantic-add-system-include "/app/video/encryption/caMsgLib/h" 'c-mode)
(semantic-add-system-include "/app/video/encryption/vpme_eqm/h" 'c-mode)
(semantic-add-system-include "/app/video/encryption/vpme_scg/h" 'c-mode)
(semantic-add-system-include "/app/common/ipc/h" 'c-mode)
(semantic-add-system-include "/app/common/util/h" 'c-mode)
(semantic-add-system-include "/app/common/anmShl/h" 'c-mode)
(semantic-add-system-include "/app/common/mtceMonitor/h" 'c-mode)
(semantic-add-system-include "/app/common/config/h" 'c-mode)
(semantic-add-system-include "/app/common/rsh/h" 'c-mode)
(semantic-add-system-include "/app/common/ntp/h" 'c-mode)
(semantic-add-system-include "/app/common/uml/h" 'c-mode)
(semantic-add-system-include "/app/oamp/h" 'c-mode)
(semantic-add-system-include "/app/oamp/uml/h" 'c-mode)
(semantic-add-system-include "/app/oamp/mtce/h" 'c-mode)
(semantic-add-system-include "/app/oamp/running_config/h" 'c-mode)
(semantic-add-system-include "/app/dcam/h" 'c-mode)
(semantic-add-system-include "/app/rsm/h" 'c-mode)
(semantic-add-system-include "/app/ucam/h" 'c-mode)
(semantic-add-system-include "/app/card/h" 'c-mode)
(semantic-add-system-include "/app/cli/rccbd/h" 'c-mode)
(semantic-add-system-include "/kernel/h" 'c-mode)
(semantic-add-system-include "/kernel/kernelCli/h" 'c-mode)
(semantic-add-system-include "/kernel/loader/h" 'c-mode)
(semantic-add-system-include "/kernel/srvc/board/h" 'c-mode)
(semantic-add-system-include "/kernel/srvc/upstream/h" 'c-mode)
(semantic-add-system-include "/kernel/srvc/downstream/h" 'c-mode)
(semantic-add-system-include "/kernel/srvc/fabric/h" 'c-mode)
(semantic-add-system-include "/kernel/srvc/common/h" 'c-mode)
(semantic-add-system-include "/kernel/sdvrpc/h" 'c-mode)
(semantic-add-system-include "/kernel/syscall/h" 'c-mode)
(semantic-add-system-include "/kernel/kernelUtils/h" 'c-mode)

(semantic-add-system-include "/vendor/windriver/components/ip_net2/ipcom/include" 'c-mode)
(semantic-add-system-include "/vendor/windriver/components/ip_net2/ipcom/port/include" 'c-mode)
(semantic-add-system-include "/vendor/windriver/components/ip_net2/ipnet2/include" 'c-mode)

(require 'company-c-headers)
(add-to-list 'company-c-headers-path-system "/vendor/windriver/vxworks/target/h")
(add-to-list 'company-c-headers-path-system "/vendor/windriver/vxworks/target/usr/h/")
(add-to-list 'company-c-headers-path-system "/vendor/windriver/vxworks/target/usr/h/c++/")
(add-to-list 'company-c-headers-path-system "/vendor/ibm/Rhapsody/Share/LangCpp")

(add-to-list 'company-c-headers-path-system "/app/h")
(add-to-list 'company-c-headers-path-system "/app/common/h")
(add-to-list 'company-c-headers-path-system "/app/oamp/anm/h")
(add-to-list 'company-c-headers-path-system "/app/video/h")
(add-to-list 'company-c-headers-path-system "/app/video/erm/h")
(add-to-list 'company-c-headers-path-system "/app/video/dcam/h")
(add-to-list 'company-c-headers-path-system "/app/video/rsm/h")
(add-to-list 'company-c-headers-path-system "/app/video/mpegMgr/h")
(add-to-list 'company-c-headers-path-system "/app/video/mpegTask/h")
(add-to-list 'company-c-headers-path-system "/app/video/common/h")
(add-to-list 'company-c-headers-path-system "/app/video/encryption/caMsgLib/h")
(add-to-list 'company-c-headers-path-system "/app/video/encryption/vpme_eqm/h")
(add-to-list 'company-c-headers-path-system "/app/video/encryption/vpme_scg/h")
(add-to-list 'company-c-headers-path-system "/app/common/ipc/h")
(add-to-list 'company-c-headers-path-system "/app/common/util/h")
(add-to-list 'company-c-headers-path-system "/app/common/anmShl/h")
(add-to-list 'company-c-headers-path-system "/app/common/mtceMonitor/h")
(add-to-list 'company-c-headers-path-system "/app/common/config/h")
(add-to-list 'company-c-headers-path-system "/app/common/rsh/h")
(add-to-list 'company-c-headers-path-system "/app/common/ntp/h")
(add-to-list 'company-c-headers-path-system "/app/common/uml/h")
(add-to-list 'company-c-headers-path-system "/app/oamp/h")
(add-to-list 'company-c-headers-path-system "/app/oamp/uml/h")
(add-to-list 'company-c-headers-path-system "/app/oamp/mtce/h")
(add-to-list 'company-c-headers-path-system "/app/oamp/running_config/h")
(add-to-list 'company-c-headers-path-system "/app/dcam/h")
(add-to-list 'company-c-headers-path-system "/app/rsm/h")
(add-to-list 'company-c-headers-path-system "/app/ucam/h")
(add-to-list 'company-c-headers-path-system "/app/router/h")
(add-to-list 'company-c-headers-path-system "/app/card/h")
(add-to-list 'company-c-headers-path-system "/app/cli/rccbd/h")

(add-to-list 'company-c-headers-path-system "/kernel/h")
(add-to-list 'company-c-headers-path-system "/kernel/kernelCli/h")
(add-to-list 'company-c-headers-path-system "/kernel/kernelUtils/h")
(add-to-list 'company-c-headers-path-system "/kernel/srvc/board/h")
(add-to-list 'company-c-headers-path-system "/kernel/srvc/upstream/h")
(add-to-list 'company-c-headers-path-system "/kernel/srvc/downstream/h")
(add-to-list 'company-c-headers-path-system "/kernel/srvc/fabric/h")
(add-to-list 'company-c-headers-path-system "/kernel/srvc/common/h")
(add-to-list 'company-c-headers-path-system "/kernel/sdvrpc/h")

(add-to-list 'company-c-headers-path-system "/vendor/windriver/components/ip_net2/ipcom/include")
(add-to-list 'company-c-headers-path-system "/vendor/windriver/components/ip_net2/ipcom/port/include")
(add-to-list 'company-c-headers-path-system "/vendor/windriver/components/ip_net2/ipnet2/include")
(add-to-list 'company-c-headers-path-system "/vendor/windriver/components/ip_net2/iptcp/include")
