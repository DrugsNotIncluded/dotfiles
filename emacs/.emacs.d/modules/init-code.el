(use-package rainbow-mode
  :defer t
  :ensure t)

(use-package origami
  :ensure t
  :config
  (global-origami-mode))

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
;;Ansible

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

(use-package company-c-headers
  :ensure t
  )

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(add-to-list 'company-backend 'company-capf)
;;======================================================================
;; eglot

(use-package eglot
  :ensure t)

;; disable flymake for eglot
(setq eglot-stay-out-of '(flymake))
(add-hook 'eglot-managed-mode-hook (lambda () (add-hook 'flymake-diagnostic-functions 'eglot-flymake-backend nil t)))
(use-package flycheck :ensure t)
(with-eval-after-load flycheck-mode global-flycheck-mode)

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-hook 'yaml-mode-hook 'ansible)

(add-hook 'go-mode-hook           'eglot-ensure) ;; requires gopls
(add-hook 'c++-mode-hook     'eglot-ensure) ;; requires clang
(add-hook 'js2-mode-hook     'eglot-ensure) ;; requires typescript-language-server from npm
(add-hook 'python-mode-hook       'eglot-ensure) ;; requires python-lsp-server & jedi (PyPy)

(use-package pug-mode
  :ensure t)

(defun pug-compile-saved-file()
  (when (and (stringp buffer-file-name)
             (string-match "\\.pug\\'" buffer-file-name))
    (pug-compile)))
(add-hook 'after-save-hook 'pug-compile-saved-file)
