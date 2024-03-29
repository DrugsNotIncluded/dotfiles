;;; quelpa-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "quelpa" "quelpa.el" (0 0 0 0))
;;; Generated autoloads from quelpa.el

(autoload 'quelpa-build-package "quelpa" "\
Create PACKAGE-NAME with VERSION.

The information in FILE-SPECS is used to gather files from
SOURCE-DIR.

The resulting package will be stored as a .el or .tar file in
TARGET-DIR, depending on whether there are multiple files.

Argument FILE-SPECS is a list of specs for source files, which
should be relative to SOURCE-DIR.  The specs can be wildcards,
and optionally specify different target paths.  They extended
syntax is currently only documented in the MELPA README.  You can
simply pass `quelpa-build-default-files-spec' in most cases.

Returns the archive entry for the package.

\(fn PACKAGE-NAME VERSION FILE-SPECS SOURCE-DIR TARGET-DIR)" nil nil)

(autoload 'quelpa-checkout-melpa "quelpa" "\
Fetch or update the melpa source code from Github.
If there is no error return non-nil.
If there is an error but melpa is already checked out return non-nil.
If there is an error and no existing checkout return nil.

When FORCE is non-nil we will always update MELPA regrdless of
`quelpa-update-melpa-p`.

\(fn &optional FORCE)" t nil)

(autoload 'quelpa-expand-recipe "quelpa" "\
Expand a given RECIPE into full recipe.
If called interactively, let the user choose a recipe name and
insert the result into the current buffer.

\(fn RECIPE)" t nil)

(autoload 'quelpa-self-upgrade "quelpa" "\
Upgrade quelpa itself.
ARGS are additional options for the quelpa recipe.

\(fn &optional ARGS)" t nil)

(autoload 'quelpa-upgrade-all "quelpa" "\
Upgrade all packages found in `quelpa-cache'.
This provides an easy way to upgrade all the packages for which
the `quelpa' command has been run in the current Emacs session.
With prefix FORCE, packages will all be upgraded discarding local changes.

\(fn &optional FORCE)" t nil)

(autoload 'quelpa-upgrade "quelpa" "\
Upgrade a package found in `quelpa-cache' with recipe RCP.
Optionally, ACTION can be passed for non-interactive call with value of:
- `force' (or \\[universal-argument] \\[quelpa-upgrade]) for forced upgrade.
- `local' (or \\[universal-argument] \\[universal-argument] \\[quelpa-upgrade])
  for upgrade using current working tree.

\(fn RCP &optional ACTION)" t nil)

(autoload 'quelpa "quelpa" "\
Build and install a package with quelpa.
ARG can be a package name (symbol) or a melpa recipe (list).
PLIST is a plist that may modify the build and/or fetch process.
If called interactively, `quelpa' will prompt for a MELPA package
to install.

When `quelpa' is called interactively with a prefix argument (e.g
\\[universal-argument] \\[quelpa]) it will try to upgrade the
given package and remove any old versions of it even if the
`quelpa-upgrade-p' and `quelpa-autoremove-p' are set to nil.

\(fn ARG &rest PLIST)" t nil)

(autoload 'quelpa-upgrade-all-maybe "quelpa" "\
Run `quelpa-upgrade-all' if at least `quelpa-upgrade-interval' days have passed since the last run.
With prefix FORCE, packages will all be upgraded discarding local changes.

\(fn &optional FORCE)" t nil)

(register-definition-prefixes "quelpa" '("quelpa-"))

;;;***

;;;### (autoloads nil nil ("bootstrap.el" "quelpa-pkg.el") (0 0 0
;;;;;;  0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8-emacs-unix
;; End:
;;; quelpa-autoloads.el ends here
