;; Configure the package manager
;; For some reason this cannot be done in the .org file
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Set use-package to always ensure that a package specified in the config is installed
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Read and tangle the emacs-config.org file
(require 'org)
(org-babel-load-file
  (expand-file-name "config.org" user-emacs-directory))

;; Set the file to write custom-configs from Emacs and load it
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file) (load custom-file))
