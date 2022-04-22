;;; -*- lexical-binding: t; -*-
;;========================================================================

(setq initial-scratch-message "
M-p s s -- Search in project
C-s     -- Search in file
M-p p   -- Switch projectile project
C-t     -- Toggle Treemacs buffer")

(require 'package)
(setq package-archives '(("gnu"   .  "https://elpa.gnu.org/packages/")
                         ("melpa" .  "https://melpa.org/packages/")))

;; Update package list and install use-package if on fresh system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; default emacs configuration directory
(defconst emacs-config-dir "~/.emacs.d/modules/" "")

;; ;; External custom file
(setq custom-file (concat emacs-config-dir "init-custom.el"))

(use-package quelpa
  :ensure t)

(use-package quelpa-use-package
  :ensure t)

(setq use-package-ensure-function 'quelpa)

(use-package gcmh
  :ensure t)
(gcmh-mode 1)

;; utility function to auto-load my package configurations
(defun load-module (filelist)
  (dolist (file filelist)
    (load (expand-file-name 
           (concat emacs-config-dir file)))
    ))

;;modules-list
(setq modules '(
		"init-custom"
		"init-settings"
		"init-user_functions"
		"init-searchnav"
		"init-code"
		"init-ebook"
		))
(load-module modules)
