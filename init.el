(setq inhibit-splash-screen t)

(set-face-attribute 'default nil :font "DejaVu Sans Mono")

(add-hook 'window-setup-hook 'toggle-frame--maximized)
(scroll-bar-mode -1)
(electric-pair-mode 1)

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




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dashboard helm-projectile helm use-package projectile magit lsp-mode irony helm-dash flycheck company ample-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
