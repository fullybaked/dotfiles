;; resolve issue in packages see - https://github.com/bbatsov/prelude/issues/1225#issuecomment-511266025
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; set up package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(package-initialize)

;; ensure we have use-package installed if it isn't already
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; load the literate configuration
(org-babel-load-file "~/.emacs.d/readme.org")
