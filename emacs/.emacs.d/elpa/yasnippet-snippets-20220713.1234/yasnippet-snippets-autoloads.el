;;; yasnippet-snippets-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "yasnippet-snippets" "yasnippet-snippets.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from yasnippet-snippets.el

(autoload 'yasnippet-snippets-initialize "yasnippet-snippets" "\
Load the `yasnippet-snippets' snippets directory." nil nil)

(eval-after-load 'yasnippet '(yasnippet-snippets-initialize))

(register-definition-prefixes "yasnippet-snippets" '("yasnippet-snippets-"))

;;;***

;;;### (autoloads nil nil ("yasnippet-snippets-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8-emacs-unix
;; End:
;;; yasnippet-snippets-autoloads.el ends here
