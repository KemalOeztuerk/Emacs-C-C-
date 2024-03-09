


(setq package-install-upgrade-built-in t)
;; Initialize Melpa
(require 'package)
;; Any add to list for package-archives (to add marmalade or melpa) goes here
(add-to-list 'package-archives 
    '("MELPA" .
      "http://melpa.org/packages/"))
(package-initialize)


;;Dark Theme
;;(package-install 'ample-theme)
(load-theme 'ample t)

;;Basic adjustment
(setq inhibit-splash-screen t)
(add-hook 'window-setup-hook 'toggle-frame--maximized)
(scroll-bar-mode -1)
(electric-pair-mode 1)
(global-display-line-numbers-mode t)
(set-face-attribute 'default nil :font "DejaVu Sans Mono")


(use-package helm
  :ensure t
  :config (helm-mode 1))

(package-install 'projectile)
(use-package projectile
  :ensure t
  :config
 (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
 (projectile-mode +1))

(use-package helm-projectile
  :ensure t
  :config(helm-projectile-on))

;;(package-install 'dashboard)
(use-package dashboard
 :ensure t
 :config
 (dashboard-setup-startup-hook))

;; C/C++

(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

  ;; Install the Irony server if not already installed
  (defun my-irony-setup ()
    (unless (irony--server-binary-valid-p)
      (call-interactively #'irony-install-server)))

  (add-hook 'irony-mode-hook 'my-irony-setup))

(use-package company-irony
  :ensure t
  :config
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-irony)))


(use-package irony-eldoc
  :ensure t
  :config
  (add-hook 'irony-mode-hook 'irony-eldoc))







(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(irony-eldoc projectile use-package magit lsp-mode helm-projectile helm-dash flycheck dashboard company-irony auto-complete ample-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
