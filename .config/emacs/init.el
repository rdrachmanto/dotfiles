;; -------------------------------------------------
;; Theming
;; -------------------------------------------------

(defun rd/set-invisible-dividers-for-themes(&rest _)
  "Make window dividers invisible, great for padded setups."
  (let ((bg (face-background 'default))
	(fg (face-foreground 'default)))
    
    (setq window-divider-default-bottom-width 8
	  window-divider-default-right-width 8
	  window-divider-default-places t)
    (custom-set-faces
     `(fringe ((t (:background ,bg :foreground ,bg))))
     `(window-divider ((t (:background ,bg :foreground ,bg))))
     `(window-divider-first-pixel ((t (:background ,bg :foreground ,bg))))
     `(window-divider-last-pixel ((t (:background ,bg :foreground ,bg)))))))
(load-theme 'cisco-dark t)
;; (add-hook 'enable-theme-functions #'rd/set-invisible-dividers-for-themes)


;; -------------------------------------------------
;; Builtin
;; -------------------------------------------------

;; Emacs
(use-package emacs
  :ensure nil
  :init
  ;; Helper modes
  (fido-vertical-mode t)
  (which-key-mode t)
  (windmove-default-keybindings)
  (menu-bar--display-line-numbers-mode-relative)
  (set-fringe-mode '(5 . 5))
  (electric-pair-mode)
  (global-hl-line-mode)

  (recentf-mode)
  ;; Completion settings
  (setq tab-always-indent 'complete)
  (setq read-file-name-completion-ignore-case t
	read-buffer-completion-ignore-case t)
  (setq minibuffer-visible-completions t
	resize-mini-windows t
	max-mini-window-height 0.15)
  ;; Initial screen
  (setq initial-scratch-message ""
	inhibit-startup-screen t)
  ;; Scroll smoothly
  (setq scroll-conservatively 10
      scroll-margin 15)
  :hook
  ;; (prog-mode . display-line-numbers-mode)
  (org-mode . display-line-numbers-mode)
  (text-mode . display-line-numbers-mode))

;; Hooks
(add-hook 'prog-mode-hook
	  (lambda ()
	    ;; (setq fill-column 80)
	    (display-line-numbers-mode)))
	    ;; (display-fill-column-indicator-mode)))

;; Dired
(use-package dired
  :ensure nil
  :config
  (setq dired-listing-switches "-al --group-directories-first"
	dired-dwim-target t
	dired-recursive-copies 'always
	dired-create-destination-dirs 'ask
	dired-kill-when-opening-new-dired-buffer t)
  :hook
  (dired-mode . dired-hide-details-mode)) ; Remove details, can be toggled with '('

;; Eglot Settings
(use-package eglot
  :ensure nil
  :hook
  (prog-mode . eglot-ensure))

;; Eldoc
(use-package eldoc
  :ensure nil
  :preface
  (add-to-list 'display-buffer-alist
	       '("^\\*eldoc\\*$"
		 (display-buffer-in-side-window)
		 (side . right)))
  (setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly
	eldoc-echo-area-use-multiline-p nil))


;; -------------------------------------------------
;; Packages
;; -------------------------------------------------

;; Minibuffer
(use-package consult
  :ensure t)

;; Completions
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :config
  (setq corfu-cycle t
	corfu-quit-at-boundary nil
	corfu-quit-no-match t)
  ;; Autocompletion settings
  (setq corfu-auto t
	corfu-auto-delay 0.3
	corfu-auto-prefix 2))

;; Documentation on hover
(use-package eldoc-box
  :ensure t
  :config
  (setq eldoc-box-only-multi-line t
	eldoc-box-hover-display-frame-above-point t))

;; Programming modes
(setq treesit-font-lock-level 4)   ;; max level
(use-package rust-mode
  :ensure t)
(use-package markdown-mode
  :ensure t)
(use-package web-mode
  :ensure t)
(use-package emmet-mode
  :ensure t
  :config
  (setq emmet-move-cursor-between-quotes t)
  :hook
  (sgml-mode . emmet-mode)
  (css-mode . emmet-mode))
(use-package nix-mode
  :ensure t)

;; Major mode remap
(add-to-list 'major-mode-remap-alist '(sh-mode . bash-ts-mode))
(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
(add-to-list 'major-mode-remap-alist '(rust-mode . rust-ts-mode))

;; Window management
(use-package transpose-frame
  :ensure t)

;; Modal editing
(use-package meow
  :ensure t
  :config
  (require 'meow-keybinds)  ;; Keybinds for movement and others defined here
  (meow-setup)
  (meow-global-mode 1))

;; Niceties
(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook
  (prog-mode . rainbow-delimiters-mode))
