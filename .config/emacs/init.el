(add-to-list 'load-path
	     (expand-file-name "lisp/" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(setq auto-save-default nil
      make-backup-files nil)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode)
(global-hl-line-mode 1)
(menu-bar--display-line-numbers-mode-relative)
(fido-vertical-mode t)

(setq tab-always-indent 'complete)

(load-theme 'modus-vivendi t)

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

;; Programming modes
(use-package rust-mode
  :ensure t)

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
