;;; highlight-doxygen-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "highlight-doxygen" "highlight-doxygen.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from highlight-doxygen.el

(autoload 'highlight-doxygen-mode "highlight-doxygen" "\
Minor mode that highlights Doxygen comments.

This is a minor mode.  If called interactively, toggle the
`Highlight-Doxygen mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `highlight-doxygen-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(put 'highlight-doxygen-global-mode 'globalized-minor-mode t)

(defvar highlight-doxygen-global-mode nil "\
Non-nil if Highlight-Doxygen-Global mode is enabled.
See the `highlight-doxygen-global-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `highlight-doxygen-global-mode'.")

(custom-autoload 'highlight-doxygen-global-mode "highlight-doxygen" nil)

(autoload 'highlight-doxygen-global-mode "highlight-doxygen" "\
Toggle Highlight-Doxygen mode in all buffers.
With prefix ARG, enable Highlight-Doxygen-Global mode if ARG is
positive; otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Highlight-Doxygen mode is enabled in all buffers where `(lambda nil
\(when (apply #'derived-mode-p highlight-doxygen-modes)
\(highlight-doxygen-mode 1)))' would do it.

See `highlight-doxygen-mode' for more information on Highlight-Doxygen
mode.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "highlight-doxygen" '("highlight-doxygen-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8-emacs-unix
;; End:
;;; highlight-doxygen-autoloads.el ends here
