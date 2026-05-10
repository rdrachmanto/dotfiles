;; -------------------------------------------------
;; Theming
;; -------------------------------------------------

(defun rd/set-invisible-dividers-for-themes(&rest _)
  "Make window dividers invisible, great for padded setups."
  (let ((bg (face-background 'default))
	(fg (face-foreground 'default)))

    (setq window-divider-default-bottom-width 2
	  window-divider-default-right-width 8
	  window-divider-default-places t)
    (custom-set-faces
     `(fringe ((t (:background ,bg :foreground ,bg))))
     `(window-divider ((t (:background ,bg :foreground ,bg))))
     `(window-divider-first-pixel ((t (:background ,bg :foreground ,bg))))
     `(window-divider-last-pixel ((t (:background ,bg :foreground ,bg)))))))

(setq cisco-themes-large-mode-line t
      cisco-themes-pop-keywords nil)
(load-theme 'cisco-dark t)
;; (add-hook 'enable-theme-functions #'rd/set-invisible-dividers-for-themes)


;; -------------------------------------------------
;; Builtin
;; -------------------------------------------------

(setq-default indent-tabs-mode nil)
;; Emacs
(use-package emacs
  :ensure nil
  :init
  ;; Helper modes
  (fido-vertical-mode t)
  (which-key-mode t)
  (windmove-default-keybindings)
  (menu-bar--display-line-numbers-mode-relative)
  (set-fringe-mode '(5 . 0))
  (electric-pair-mode)
  (tab-bar-mode)
  (save-place-mode)
  (global-auto-revert-mode)
  (global-hl-line-mode)
  (global-visual-line-mode)
  (delete-selection-mode)

  (setq history-length 25)
  (savehist-mode)
  (recentf-mode)

  (setq use-dialog-box nil)

  ;; Completion settings
  (setq tab-always-indent 'complete)
  (global-completion-preview-mode)
  (setq read-file-name-completion-ignore-case t
	read-buffer-completion-ignore-case t
	completion-auto-help 'lazy
	completion-auto-select 'second-tab
	completion-cycle-threshold 3
	completions-format 'horizontal
	completions-sort 'historical
	completions-max-height 10
	completion-show-help nil
	completion-styles '(basic partial-completion substring initials))
  (setq minibuffer-visible-completions t
	resize-mini-windows t
	max-mini-window-height 0.15
	completions-detailed t)

  ;; Initial screen
  (setq initial-scratch-message ""
	inhibit-startup-screen t)

  ;; Scroll smoothly
  (setq scroll-conservatively 10
	scroll-margin 15)

  ;; Tab-bar
  (setq tab-bar-tab-hints t
	tab-bar-close-button-show nil
	tab-bar-auto-width nil
	tab-bar-new-button nil
	tab-bar-new-tab-choice "*scratch*")


  (setq org-hide-leading-stars t
	org-startup-indented t)

  :hook
  (org-mode . display-line-numbers-mode)
  (text-mode . display-line-numbers-mode))

;; Hooks
(add-hook 'prog-mode-hook
	  (lambda ()
	    (setq display-line-numbers-width 3)
	    (display-line-numbers-mode)
	    (column-number-mode)))

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (set-window-fringes
             (minibuffer-window frame) 6 6 nil t)))

;; Dired
(use-package dired
  :ensure nil
  :config
  (setq dired-listing-switches "-alh --group-directories-first --no-group"
	dired-dwim-target t
	dired-recursive-copies 'always
	dired-create-destination-dirs 'ask
	dired-kill-when-opening-new-dired-buffer t)
  :hook
  (dired-mode . dired-hide-details-mode)) ; Remove details, can be toggled with '('

;; Eglot Settings
(use-package eglot
  :ensure nil
  :config
  (setq eglot-ignored-server-capabilites '(:inlayHintProvider))
  :hook
  (prog-mode . eglot-ensure))

;; Eldoc
(use-package eldoc
  :ensure nil
  :preface
  (add-to-list 'display-buffer-alist
	       '("^\\*eldoc\\*$"
		 (display-buffer-in-side-window)
		 (side . right)
		 (window-width . 0.18)))
  (setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly
	eldoc-echo-area-use-multiline-p nil))

;; Display rules
(add-to-list 'display-buffer-alist
	     '("^\\*compilation\\*$"
	       (display-buffer-in-side-window)
	       (side . right)
	       (window-width . 0.18)))

(setq my-bottom-panel-buffers
      '("Flymake diagnostics for .*"
        "Completions"
	"terminal"
	"eat"
	"xref"))

(add-to-list
 'display-buffer-alist
 `(,(concat "\\*\\(" (string-join my-bottom-panel-buffers "\\|") "\\)\\*")
   (display-buffer-in-side-window)
   (side . bottom)
   (slot . 0)
   (window-height . 0.18)))

;; -------------------------------------------------
;; Packages
;; -------------------------------------------------

;; direnv
(use-package direnv
  :ensure t
  :config (direnv-mode))

;; Programming modes
(setq treesit-font-lock-level 4)   ;; max level is 4
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
(use-package typst-ts-mode
  :ensure t)

(use-package clojure-mode
  :ensure t)
(use-package clojure-ts-mode
  :ensure t)

;; Major mode remap
(add-to-list 'major-mode-remap-alist '(sh-mode . bash-ts-mode))
(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
(add-to-list 'major-mode-remap-alist '(rust-mode . rust-ts-mode))
(add-to-list 'major-mode-remap-alist '(clojure-mode . clojure-ts-mode))

;; Magit
(use-package magit
  :ensure t)

;; Autocompletions
(use-package corfu
  :ensure t
  :config
  (setq corfu-cycle t
	corfu-auto t
	corfu-auto-delay 0.2
	corfu-auto-prefix 2
	corfu-quit-no-match t)
  :hook (prog-mode . corfu-mode))

;; Popup documentation
(use-package eldoc-box
  :ensure t)

;; Movement
(use-package ace-window
  :ensure t
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

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
  :after magit
  :init (global-diff-hl-mode)
  :config
  (setq diff-hl-disable-on-remote t)
  :hook (magit-post-refresh-hook . diff-hl-magit-post-refresh))

(use-package nerd-icons
  :ensure t
  :config
  (setq nerd-icons-scale-factor 1.1))
(use-package nerd-icons-completion
  :ensure t
  :config
  (nerd-icons-completion-mode))
(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))
(use-package nerd-icons-ibuffer
  :ensure t
  :hook
  (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package pulsar
  :ensure t
  :config
  (pulsar-global-mode 1))

(use-package eat
  :ensure t)


;; -------------------------------------------------
;; Functions
;; Will be moved later
;; -------------------------------------------------
(defun rd/split-right ()
  (interactive)
  (split-window-right)
  (other-window 1))

(defun rd/split-right-dired ()
  (interactive)
  (split-window-right)
  (other-window 1)
  (dired "."))

(defun rd/split-right-project-dired ()
  (interactive)
  (split-window-right)
  (other-window 1)
  (project-dired))

(defun rd/split-below ()
  (interactive)
  (split-window-below)
  (other-window 1))

(defun rd/open-user-init ()
  (interactive)
  (find-file-other-window user-init-file))

(defun rd/reload-user-init ()
  (interactive)
  (load-file user-init-file)
  (message "Reloaded with newest init"))

(defun rd/comment-or-uncomment-line-or-region ()
  (interactive)
  (if (use-region-p)
      (comment-or-uncomment-region)
    (comment-line)))

(defun rd/open-buffer-diagnostics ()
  (interactive)
  (flymake-show-buffer-diagnostics)
  (other-window 1))

(defun rd/open-project-or-buffer-diagnostics ()
  (interactive)
  (if (project-current)
      (flymake-show-project-diagnostics)
    (flymake-show-buffer-diagnostics))
  (other-window 1))

;; -------------------------------------------------
;; Global Keybinds
;; Keybinds interacting with buffer content will stay with meow
;; -------------------------------------------------

;; Init
(keymap-global-set "C-c I" 'rd/open-user-init)
(keymap-global-set "C-c R" 'rd/reload-user-init)

;; Window
(keymap-global-set "C-c w" 'ace-window)
(keymap-global-set "C-x 2" 'rd/split-below)
(keymap-global-set "C-x 3" 'rd/split-right)
(keymap-global-set "C-c s d" 'rd/split-right-dired)
(keymap-global-set "C-c s p" 'rd/split-right-project-dired)

;; Tabs
(keymap-global-set "C-c t t" 'tab-list)
(keymap-global-set "C-c t n" 'tab-new)
(keymap-global-set "C-c t r" 'tab-rename)
(keymap-global-set "C-c t d" 'tab-close)
(keymap-global-set "C-c [" 'tab-previous)
(keymap-global-set "C-c ]" 'tab-next)

;; Buffer
(keymap-global-set "C-c -" 'previous-buffer)
(keymap-global-set "C-c =" 'next-buffer)

;; Recents
(keymap-global-set "C-c f" 'recentf)

;; Toggles
(keymap-global-set "C-c `" 'eat)
(keymap-global-set "C-c d d" 'rd/open-project-or-buffer-diagnostics)
(keymap-global-set "C-c d b" 'rd/open-buffer-diagnostics)
