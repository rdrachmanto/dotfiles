;; Add MELPA to package.el
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)


;; Additional load paths
(add-to-list 'load-path
	     (expand-file-name "lisp/" user-emacs-directory))
(add-to-list 'custom-theme-load-path
	     (expand-file-name "themes/" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory)
      treesit-extra-load-path '("~/.config/emacs/tree-sitter"))


;; Disable backups
(setq auto-save-default nil
      make-backup-files nil)


;; UI tweaks
;; Padding and font
(dolist (var '(default-frame-alist initial-frame-alist))
  ;; (add-to-list var '(right-divider-width . 10))
  (add-to-list var '(internal-border-width . 8))
  (add-to-list var '(font . "Zed Mono Nerd Font-11")))

(setq window-divider-default-bottom-width 8
      window-divider-default-right-width 8
      window-divider-default-places t)
(add-hook 'after-init-hook #'window-divider-mode)

;; Disable UI elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq ring-bell-function 'ignore)


