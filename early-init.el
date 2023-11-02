;; Setting up package repos
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Use ELPA packages whenever possible
(setq package-archive-priorities
      '(("gnu"    . 90)
	("nongnu" . 50)
	("melpa"  . 10)))

;; UI optimizations
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq inhibit-startup-screen t)
