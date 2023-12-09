;; Read and tangle the emacs-config.org file
(require 'org)
(org-babel-load-file
  (expand-file-name "config.org" user-emacs-directory))

;; Set the file to write custom-configs from Emacs and load it
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load-file custom-file))
