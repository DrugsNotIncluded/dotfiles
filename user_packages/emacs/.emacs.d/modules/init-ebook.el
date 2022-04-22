;;; -*- lexical-binding: t; -*-
;;========================================================================

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
(add-hook 'nov-mode-hook (lambda () (display-line-numbers-mode -1)))

;; PDF (external reader - Zathura with mupdf plugin)
(use-package openwith
  :ensure t
  :custom
  (openwith-mode t))

(setq openwith-associations '(("\\.pdf\\'" "zathura" (file))))

