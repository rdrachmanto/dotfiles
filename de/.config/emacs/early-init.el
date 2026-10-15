;; Add MELPA to package.el
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)


;; Additional load paths
(add-to-list 'load-path
	     (expand-file-name "lisp/" user-emacs-directory))

;; Load all inside themes/
(let ((theme-dir (expand-file-name "themes/" user-emacs-directory)))
  (add-to-list 'custom-theme-load-path theme-dir)
  (add-to-list 'load-path theme-dir)
  
  (dolist (dir (directory-files theme-dir t "^[^.]"))
    (when (file-directory-p dir)
      (add-to-list 'load-path dir)
      (add-to-list 'custom-theme-load-path dir))))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory)
      treesit-extra-load-path '("~/.config/emacs/tree-sitter"))


;; Disable backups
(setq auto-save-default nil
      make-backup-files nil)


;; UI tweaks
;; Padding and font
(dolist (var '(default-frame-alist initial-frame-alist))
  (add-to-list var '(right-divider-width . 10))
  (add-to-list var '(internal-border-width . 0))
  ;; (add-to-list var '(font . "Maple Mono NF-10")))
  (add-to-list var '(font . "Iosevka Nerd Font-10.5")))

(setq window-divider-default-bottom-width 1
      window-divider-default-right-width 1
      window-divider-default-places t)
(add-hook 'after-init-hook #'window-divider-mode)

;; Disable UI elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq ring-bell-function 'ignore)


