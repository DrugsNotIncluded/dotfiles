(require 'flymake)
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
    (setq treemacs-position 'left
	  treemacs-show-hidden-files t
	  treemacs-width 30
	  treemacs-space-between-root-nodes t
	  treemacs-follow-after-init t
	  treemacs-sorting 'alphabetic-asc
	  treemacs-eldoc-display t
	  treemacs-no-delete-other-windows t
	  treemacs-project-follow-cleanup nil
	  treemacs-display-in-side-window t
	  treemacs-position 'right))
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
	  centaur-tabs-set-close-button nil)))

 
;;============================================================
(global-set-key (kbd "TAB") 'self-insert-command)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; pixel-scrolling
(use-package good-scroll
  :ensure t
  :init
  (good-scroll-mode))
(global-set-key [next] #'good-scroll-up-full-screen)
(global-set-key [prior] #'good-scroll-down-full-screen)

(use-package solaire-mode
  :ensure t
  :after (treemacs)
  :custom (solaire-global-mode +1))

(use-package counsel
  :ensure t)

(use-package counsel-projectile
  :ensure t)

(counsel-projectile-mode +1)
