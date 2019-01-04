;;; packages.el --- rcoacci layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Rodrigo Coacci <rodrigo@kuat>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `rcoacci-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `rcoacci/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `rcoacci/pre-init-PACKAGE' and/or
;;   `rcoacci/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst rcoacci-packages
  '(eclipse-theme
    modern-cpp-font-lock
    company
    magit
    evil
    projectile)
  "The list of Lisp packages required by the rcoacci layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun rcoacci/init-modern-cpp-font-lock()
  (use-package modern-c++-font-lock
    :defer t
    :hook (c++-mode . modern-c++-font-lock-mode)
    ))

(defun rcoacci/init-eclipse-theme ()
  (use-package eclipse-theme)
  )

(defun rcoacci/pre-init-company ()
  (add-hook 'company-mode-hook (lambda () (evil-define-key 'insert global-map (kbd "C-SPC") 'company-complete)))
  )

(defun rcoacci/post-init-magit ()
  (setq-default magit-delete-by-moving-to-trash nil)
  )

(defun rcoacci/post-init-evil ()
  (setq-default evil-want-fine-undo t evil-search-module 'evil-search)
  )

(defun rcoacci/post-init-projectile ()
  (setq-default projectile-enable-caching t)
  )

;;; packages.el ends here
