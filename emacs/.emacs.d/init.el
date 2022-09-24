
;;; -*- lexical-binding: t; -*-
;;========================================================================

(setq initial-scratch-message "
;; M-p s s -- Search in project
;; C-s     -- Search in file
;; M-p p   -- Switch projectile project
;; C-t     -- Toggle Treemacs buffer")

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

;; External custom file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

(use-package quelpa :ensure t)
(use-package quelpa-use-package :ensure t)

(setq use-package-ensure-function 'quelpa)
(setq org-directory (concat (getenv "HOME") "/Documents/org-mode"))

(use-package rainbow-mode :defer t :ensure t)

(use-package projectile :ensure t :config
  (projectile-mode +1)
  :bind
  ("s-p" . projectile-command-map))

(setq projectile-track-known-projects-automatically nil)

(use-package magit :ensure t)
(use-package auto-complete :ensure t)
(use-package yasnippet :ensure t)
(use-package yasnippet-snippets :ensure t)
(use-package yaml-mode :ensure t)
(use-package go-mode :ensure t)
(use-package glsl-mode :ensure t)
(use-package haskell-mode :ensure t)
(use-package ansible :ensure t)

;;Doxygen highlighting
(use-package highlight-doxygen :ensure t)
(highlight-doxygen-global-mode 1)

;;============================================================
;; interactive completion & ui (company)
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  )

(use-package company-c-headers :ensure t)
(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(add-to-list 'company-backend 'company-capf)

(add-to-list 'auto-mode-alist '("\\.vs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.fs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.gs\\'" . glsl-mode))

(use-package eldoc-box :ensure t)
(setq eldoc-box-max-pixel-height 700)
(setq eldoc-box-max-pixel-width 700)

;; Epub support
(use-package nov
  :ensure t)
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;; ebooks font
(defun my-nov-font-setup ()
  (face-remap-add-relative 'variable-pitch :family "Liberation Serif"
                                           :height 1.0))
(add-hook 'nov-mode-hook 'my-nov-font-setup)

(setq nov-text-width 80)
(setq nov-text-width t)
(setq visual-fill-column-center-text t)
(add-hook 'nov-mode-hook 'visual-line-mode)
(add-hook 'nov-mode-hook 'visual-fill-column-mode)

;;============================================================
;;mod-toggle keybindings
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-t") 'treemacs)
(global-set-key (kbd "M-n") 'origami-toggle-node)

(cua-mode t)

(use-package selectrum :ensure t :config (selectrum-mode 1))
(use-package swiper    :ensure t
  :bind (
	 ("C-s" . swiper)
	 ))
;;============================================================
;;treemacs
(use-package all-the-icons
  :ensure t
  :config (require 'all-the-icons))
(use-package treemacs-all-the-icons :ensure t)
(use-package treemacs-projectile :after treemacs projectile :ensure t)
(use-package treemacs-magit :after treemacs magit :ensure t)

(use-package treemacs :ensure t :defer t :init :config
  (progn
    (setq treemacs-show-hidden-files t
	  treemacs-width 30
	  treemacs-space-between-root-nodes t
	  treemacs-follow-after-init t
	  treemacs-sorting 'alphabetic-asc
	  treemacs-eldoc-display t
	  treemacs-no-delete-other-windows t
	  treemacs-project-follow-cleanup nil
	  treemacs-display-in-side-window t
	  treemacs-position 'left
	  treemacs-user-mode-line-format 'none))
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-git-mode 'simple)
  (treemacs-load-theme "all-the-icons")
  (treemacs))

;;============================================================
;;centaur-tabs keybindings
(use-package centaur-tabs :ensure t :demand
  :bind
  ("<M-left>"  . centaur-tabs-backward)
  ("<M-right>" . centaur-tabs-forward)
  :config
  (centaur-tabs-mode t)
  (progn
    (setq centaur-tabs-set-icons t
	  centaur-tabs-gray-out-icons 'buffer
	  centaur-tabs-set-bar 'over
	  centaur-tabs-set-close-button nil)
	(centaur-tabs-group-by-projectile-project)))

(defun centaur-tabs-hide-tab (x)
  "Do no to show buffer X in tabs."
  (let ((name (format "%s" x)))
    (or
     ;; Current window is not dedicated window.
     (window-dedicated-p (selected-window))

     ;; Buffer name not match below blacklist.
     (string-prefix-p "*company" name)
     (string-prefix-p "*Flycheck" name)
	 (string-prefix-p "*quelpa-build" name)
	 (string-prefix-p "*Warnings" name)
	 (string-prefix-p "*Help" name)
	 (string-prefix-p "*Compile-Log" name)
	 (string-prefix-p "*Ilist" name)

     ;; Is not magit buffer.
     (and (string-prefix-p "magit" name)
	  (not (file-name-extension name)))
     )))

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
 
;;============================================================
(global-set-key (kbd "TAB") 'self-insert-command)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(pixel-scroll-precision-mode 1)

(use-package counsel
  :ensure t)

(use-package counsel-projectile
  :ensure t)

(counsel-projectile-mode +1)
(use-package imenu-list :ensure t
  :config (setq imenu-list-size 30))

(setq default-frame-alist '((undecorated . t)))
(setq inhibit-startup-screen t)

(setq-default c-default-style "bsd")
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode 1)

(set-face-attribute 'default nil
                    :family "Fira Code"
                    :height 95
                    :weight 'normal
                    :width 'normal)

(use-package fira-code-mode :ensure t)
(global-fira-code-mode)

(set-frame-parameter (selected-frame) 'alpha-background 0.92)


(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(when (window-system) (progn (tool-bar-mode -1) (scroll-bar-mode -1)))
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (fboundp `toggle-scroll-bar) (toggle-scroll-bar -1) )
(setq-default message-log-max nil)
(kill-buffer "*Messages*")


;;=========================================================================
;; backup settings

(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/backup" t)))

;;=========================================================================
;; modeline customization

(use-package doom-modeline
  :ensure t
  :config (doom-modeline-mode))

(use-package nyan-mode
  :ensure t
  :config
  (nyan-mode))

;;=========================================================================
;; binding file extensions to mods

(use-package markdown-mode :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package sh-mode
  :mode ("APKBUILD" . sh-mode))

(use-package cmake-mode
 :ensure t
 :mode
 ("CMakeLists.txt" . cmake-mode)
)

(use-package js2-mode
  :ensure t
  :config
  :mode
  (("\\.js\\'" . js2-mode)
   ("\\.mjs\\'" . js2-mode)
   ))

(defmacro with-suppressed-message (&rest body)
  "Suppress new messages temporarily in the echo area and the `*Messages*' buffer while BODY is evaluated."
  (declare (indent 0))
  (let ((message-log-max nil))
    `(with-temp-message (or (current-message) "") ,@body)))

(use-package rainbow-delimiters
  :ensure t)

(define-global-minor-mode rainbow-delimiters-global-mode rainbow-delimiters-mode
  (lambda ()
    (when (derived-mode-p 'prog-mode)
      (rainbow-delimiters-mode 1))))

(rainbow-delimiters-global-mode)
(use-package solaire-mode :ensure t)
(solaire-global-mode +1)
(pdf-loader-install)
(use-package lsp-mode :ensure t)
