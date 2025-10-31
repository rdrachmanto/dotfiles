(add-to-list 'load-path
	     (expand-file-name "lisp/" user-emacs-directory))
(add-to-list 'custom-theme-load-path
	     (expand-file-name "themes/" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory)
      treesit-extra-load-path '("~/.config/emacs/tree-sitter"))

(setq auto-save-default nil
      make-backup-files nil)

(set-fringe-mode '(3 . 3))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode)
;; (global-hl-line-mode 1)
(menu-bar--display-line-numbers-mode-relative)
(fido-vertical-mode t)
(which-key-mode t)

(setq initial-scratch-message ""
      inhibit-startup-screen t)

(setq tab-always-indent 'complete)

(load-theme 'cisco-dark t)

(setq ring-bell-function 'ignore)

(add-to-list 'default-frame-alist '(font . "Zed Mono Nerd Font-11"))

(setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t)

(setq minibuffer-visible-completions t
      resize-mini-windows t
      max-mini-window-height 0.15)

(windmove-default-keybindings)

;; Packages
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :config
  (setq corfu-cycle t
	corfu-quit-at-boundary nil
	corfu-quit-no-match nil
	corfu-on-exact-match nil)
  ;; Autocompletion settings
  (setq corfu-auto t
	corfu-auto-delay 0.3
	corfu-auto-prefix 3))

;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   (load-theme 'doom-one t))

;; Programming modes
(use-package rust-mode
  :ensure t)
(use-package markdown-mode
  :ensure t)

;; Treesitter
(setq treesit-font-lock-level 4)   ;; max level
(add-to-list 'major-mode-remap-alist '(rust-mode . rust-ts-mode))

;; (use-package scala-mode
;;   :ensure t
;;   :interpreter ("scala" . scala-mode))

;; Modal editing
(use-package meow
  :ensure t
  :config
  (require 'meow-keybinds)  ;; Keybinds for movement and others defined here
  (meow-setup)
  (meow-global-mode 1))

;; (use-package evil
;;   :ensure t
;;   :config (evil-mode 1))

(use-package consult
  :ensure t)

(use-package eglot
  :hook
  (prog-mode . eglot-ensure))

(use-package diff-hl
  :ensure t
  :config (global-diff-hl-mode))
