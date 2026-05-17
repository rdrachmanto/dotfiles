;; -------------------------------------------------
;; Theming
;; -------------------------------------------------

(setq cisco-themes-large-mode-line t
      cisco-themes-pop-keywords nil
      cisco-themes-italic-keywords t)
(load-theme 'cisco-dark t)

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

  (require 'setup-tab-bar)

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
  :config
  (setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly
	eldoc-echo-area-use-multiline-p nil))

;; Display rules
(require 'window-rules)

(defvar blist-for-bottom-panel
      '(("^\\*[Ff]lymake.*\\*$" 0)
        ("^\\*eat\\*$" 0)
        ("^\\*xref\\*$" 0)
        ("^\\*[Cc]ompletions\\*$" 0)))

(defvar blist-for-right-panel
  '(("^\\*[Hh]elp\\*$" 1)
    ("^\\*[Ee]ldoc\\*$" -1)))

(setq window-rules-bottom-panel-list blist-for-bottom-panel
      window-rules-right-panel-list blist-for-right-panel)
(window-rules-apply)

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

(use-package nix-mode
  :ensure t)
(use-package nix-ts-mode
  :ensure t)

;; Major mode remap
(add-to-list 'major-mode-remap-alist '(sh-mode . bash-ts-mode))
(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
(add-to-list 'major-mode-remap-alist '(rust-mode . rust-ts-mode))
(add-to-list 'major-mode-remap-alist '(clojure-mode . clojure-ts-mode))
(add-to-list 'major-mode-remap-alist '(nix-mode . nix-ts-mode))

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
  (meow-setup-indicator)
  (meow-global-mode 1))

;; Easy way to interact with parens
;; Kind of like paredit
(use-package puni
  :ensure t
  :defer t
  :init (puni-global-mode)
  :hook
  (term-mode . puni-disable-puni-mode))

(use-package expreg
  :ensure t)

(use-package move-text
  :ensure t
  :init (move-text-default-bindings))

(defun indent-region-advice (&rest ignored)
  (let ((deactivate deactivate-mark))
    (if (region-active-p)
        (indent-region (region-beginning) (region-end))
      (indent-region (line-beginning-position) (line-end-position)))
    (setq deactivate-mark deactivate)))

(advice-add 'move-text-up :after 'indent-region-advice)
(advice-add 'move-text-down :after 'indent-region-advice)


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

(defun rd/go-to-beginning-of-line ()
  (interactive)
  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(defun rd/switch-to-buffer (&optional all-buffers)
  (interactive "P")
  (if (or (not (project-current)) all-buffers)
      (call-interactively #'switch-to-buffer)
    (call-interactively #'project-switch-to-buffer)))

(defun rd/find-file (&optional all-buffers)
  (interactive "P")
  (if (or (not (project-current)) all-buffers)
      (call-interactively #'find-file)
    (call-interactively #'project-find-file)))

(defun rd/meow-insert-start-of-line ()
  (interactive)
  (back-to-indentation)
  (meow-insert))

(defun rd/meow-insert-end-of-line ()
  (interactive)
  (end-of-line)
  (meow-insert))

;; -------------------------------------------------
;; Global Keybinds
;; Keybinds interacting with buffer content will stay with meow
;; -------------------------------------------------

(defun rd/bind-keys (&rest bindings)
  "Helper function for binding keys"
  (dolist (binding bindings)
    (pcase-let ((`(,key ,command) binding))
      (keymap-global-set key command))))

(rd/bind-keys
 ;; Init
 '("C-c i i" rd/open-user-init)
 '("C-c i r" rd/reload-user-init)
 ;;
 '("C-c w" ace-window)
 '("C-x 2" rd/split-below)
 '("C-x 3" rd/split-right)
 '("C-c s d" rd/split-right-dired)
 '("C-c s D" rd/split-right-project-dired)
 ;;
 '("C-c t t" tab-list)
 '("C-c t n" tab-new)
 '("C-c t r" tab-rename)
 '("C-c t d" tab-close)
 '("C-c [" tab-previous)
 '("C-c ]" tab-next)
 ;;
 '("C-=" expreg-expand)
 '("C--" expreg-contract)
 ;;
 '("C-c f r" recentf-open)
 ;;
 '("C-c `" eat)
 '("C-c d d" rd/open-project-or-buffer-diagnostics)
 '("C-c d b" rd/open-buffer-diagnostics)
 ;;
 '("C-a" rd/go-to-beginning-of-line)
 '("C-x b" rd/switch-to-buffer)
 '("C-x C-f" rd/find-file)
 ;;
 '("C-)" puni-slurp-forward)
 '("C-(" puni-slurp-backward)
 '("C-}" puni-barf-forward)
 '("C-{" puni-barf-backward)
 '("C-c l s" puni-splice)
 '("C-c l r" puni-raise))

