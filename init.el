;; Keep customizations in a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file
           (file-exists-p custom-file))
  (load custom-file nil :nomessage))

;; use-package is now part of Emacs
(eval-when-compile
  (require 'use-package))


;; APPEARANCE

;; Taken from https://codeberg.org/daviwil/dotfiles/src/branch/master/Emacs.org
(pcase system-type
  ('gnu/linux
   (set-face-attribute 'default nil :font "JetBrains Mono" :height 110))
  ('windows-nt
   (set-face-attribute 'default nil :font "Consolas" :height 110)))

;; Nice themes
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold nil
	doom-themes-enable-italic nil)
  (load-theme 'doom-gruvbox t))

;; Line numbers
;; Should I wrap this inside use-package?
(dolist (mode '(text-mode-hook
		prog-mode-hook
		conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode -1))))

(setq display-line-numbers-width 3)

;; Better defaults
;; Mostly from System Crafters community
(column-number-mode)
(delete-selection-mode)
(global-auto-revert-mode)
(recentf-mode)

(setq history-length 25)
(savehist-mode)
(save-place-mode)
(setq use-dialog-box nil)


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

;; Thanks to https://www.adventuresinwhy.com/post/eglot/
(use-package eglot
  :hook ((python-ts-mode c-ts-mode c++-ts-mode) . eglot-ensure)
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
