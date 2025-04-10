(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))

(require 'use-package)
(setq use-package-always-ensure t)

(require 'org)
(org-babel-load-file
  (expand-file-name "config.org" user-emacs-directory))

;; Set the file to write custom-configs from Emacs and load it
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load-file custom-file))
