;; Keep customizations in a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file
           (file-exists-p custom-file))
  (load custom-file nil :nomessage))

;; use-package is now part of Emacs
(eval-when-compile
  (require 'use-package))


;; APPEARANCE

;; Legible fonts
(set-face-attribute 'default nil :font "Consolas" :height 110)

;; Nice themes
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold nil
	doom-themes-enable-italic nil))
  (load-theme 'doom-gruvbox t)

;; Taken from https://github.com/ianyepan/.wsl-emacs.d
(use-package display-line-numbers
  :hook (prog-mode . display-line-numbers-mode)
  :config (setq-default display-line-numbers-width 3))


;; COMPLETION FRAMEWORK

;; Welcome to the minadverse
(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

(use-package orderless
  :ensure t
  ;; Copied from https://github.com/oantolin/orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package embark
  :ensure t
  ;; Use C-h after a prefix to show available key bindings
  :init (setq prefix-help-command #'embark-prefix-help-command))

(use-package corfu
  :ensure t
  :init (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-cycle t))


;; PROGRAMMING

;; ChatGPT wrote this for me
(use-package eglot
  :hook ((python-mode c-mode c++-mode) . eglot-ensure)
  :custom (eglot-autoshutdown t))

;; Author calls this package "a hack"
;; https://github.com/renzmann/treesit-auto
(use-package treesit-auto
  :ensure t
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))

(use-package aggressive-indent
  :ensure t)

;; OTHER

;; RSS reader
(use-package elfeed
  :ensure t
  :bind (("C-x w" . elfeed)))

(use-package org-modern
  :ensure t)