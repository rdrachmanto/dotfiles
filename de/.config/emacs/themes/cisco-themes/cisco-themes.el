;;; cisco-theme.el -*- lexical-binding: t; -*-

(defgroup cisco-themes nil
  "Options for Cisco"
  :group 'faces)

(defcustom cisco-themes-large-mode-line nil
  "Add box or not around mode-line"
  :type 'boolean
  :group 'cisco-themes)

(defcustom cisco-themes-pop-keywords nil
  "Use brighter or subtler shade of blue for keywords"
  :type 'boolean
  :group 'cisco-themes)

(defcustom cisco-themes-italic-keywords nil
  "Change keyword :slant option"
  :type 'boolean
  :group 'cisco-themes)

(defun cisco-themes-set-italic-keywords ()
  (if cisco-themes-italic-keywords 'italic 'normal))

(defun cisco-themes-set-large-mode-line (border)
  (when cisco-themes-large-mode-line
    `(:line-width 1 :color ,border)))

(defun cisco-themes-set-keywords-pop (subtle bright)
  (if cisco-themes-pop-keywords bright subtle))

(defconst cisco-theme-light-palette
  (list :bg "#f8f8f8"
        :bg+1 "#cecdc3"
        :bg+2 "#e0e0e0"
        :border "gray75"
        :fg "#0e100f"
        :fg-dim "#cecdc3"
        :fg-dim+1 "#cecdc3"
        :accent-punctuation "#3076b2"
        :accent-parens "#2b5375"
        :accent-todos "#f0f8ff"
        :accent-str "#608242"
        :accent-num "#db6f0e"
        :accent-comments "#76726e"
        :accent-doc "#a78b00"
        :accent-constants "#db6f0e"
        :accent-keywords "#f72e45"
        :accent-def "#834de8"
        :accent-cursor "#fe9900"
        :accent-hl-line "#efefec"
        :signal-ok "#6c7b2e"
        :signal-warn "#ffab70"
        :signal-error "#d14d41"
        :signal-info "#3076b2"))

(defconst cisco-theme-dark-palette
  (list :bg "#181818"
        :bg+1 "#1e201f"
        :bg+2 "#1f211f"
        :border "#282828"
        :fg "#cacaca"
        :fg-dim "#878580"
        :fg-dim+1 "#403e3c"
        :accent-punctuation "#73c2fb"
        :accent-parens "#2b5375"
        :accent-todos "#f0f8ff"
        :accent-str "#8cb369"
        :accent-num "#f4a259"
        :accent-comments "#76726e"
        :accent-doc "#efc700"
        :accent-constants "#f4a259"
        :accent-keywords "#fa7584"
        :accent-def "#b392f1"
        :accent-cursor "#fe9900"
        :accent-hl-line "#1e201f"
        :signal-ok "#6c7b2e"
        :signal-warn "#ffab70"
        :signal-error "#d14d41"
        :signal-info "#6fa8d8"))

(defun cisco-theme-color (palette key)
  (plist-get palette key))

(defun cisco-theme-apply-faces (theme palette)
  "Apply shared face definition"
  (let ((bg (cisco-theme-color palette :bg))
        (bg+1 (cisco-theme-color palette :bg+1))
        (bg+2 (cisco-theme-color palette :bg+2))
        (border (cisco-theme-color palette :border))
        (fg (cisco-theme-color palette :fg))
        (fg-dim (cisco-theme-color palette :fg-dim))
        (fg-dim+1 (cisco-theme-color palette :fg-dim+1))
        (accent-cursor (cisco-theme-color palette :accent-cursor))
        
        (accent-doc (cisco-theme-color palette :accent-doc))
        (accent-comments (cisco-theme-color palette :accent-comments))
  	(accent-punctuation (cisco-theme-color palette :accent-punctuation))
	(accent-str (cisco-theme-color palette :accent-str))
	(accent-num (cisco-theme-color palette :accent-num))
        
	(accent-def (cisco-theme-color palette :accent-def))
        
        (accent-hl-line (cisco-theme-color palette :accent-hl-line))
        (signal-ok (cisco-theme-color palette :signal-ok))
        (signal-warn (cisco-theme-color palette :signal-warn))
        (signal-error (cisco-theme-color palette :signal-error))
        (signal-info (cisco-theme-color palette :signal-info)))
    (custom-theme-set-faces
     theme

     `(default ((t (:background ,bg :foreground ,fg))))
     `(vertical-border ((t (:foreground ,border))))
     `(internal-border ((t (:foreground ,border :background ,bg))))
     `(mode-line ((t (:background ,border :foreground ,fg :box ,(cisco-themes-set-large-mode-line border)))))
     `(mode-line-inactive ((t (:background ,bg :foreground ,fg-dim))))
     `(hl-line ((t (:background ,accent-hl-line))))
     `(cursor ((t (:background ,accent-cursor))))
     `(region ((t (:background ,fg-dim+1))))

     `(line-number ((t (:foreground ,fg-dim+1))))
     `(line-number-current-line ((t (:foreground ,accent-num :background ,accent-hl-line))))

     `(fringe ((t (:background ,bg :foreground ,bg))))
     `(window-divider ((t (:background ,bg :foreground ,border))))
     
     `(minibuffer-prompt ((t (:foreground ,signal-info))))
     `(icomplete-selected-match ((t (:background ,border))))

     `(tab-bar ((t (:background ,border :foreground ,fg :box (:line-width 1 :color ,border)))))
     `(tab-bar-tab ((t (:inherit 'tab-bar-tab :foreground ,signal-info :bold t))))
     `(tab-bar-tab-inactive ((t (:inherit 'tab-bar-tab :foreground ,fg-dim :bold t))))

     `(show-paren-match ((t :foreground ,signal-info :background ,bg)))
     `(show-paren-mismatch ((t :foreground ,signal-error :background ,bg)))

     ;; Common highlighting
     `(font-lock-doc-face ((t :foreground ,accent-doc)))
     `(font-lock-comment-face ((t :foreground ,accent-comments)))
     `(font-lock-comment-delimiter-face ((t :inherit 'font-lock-comment-face)))
     `(font-lock-delimiter-face ((t :inherit 'font-lock-comment-face)))
     `(font-lock-bracket-face ((t :inherit 'font-lock-comment-face)))
     
     `(font-lock-string-face ((t :foreground ,accent-str)))
     `(font-lock-number-face ((t :foreground ,accent-num)))

     ;; Flymake
     `(flymake-note-echo ((t (:foreground ,signal-info))))
     `(flymake-warning-echo ((t (:foreground ,signal-warn))))
     `(flymake-error-echo ((t (:foreground ,signal-error))))

     ;; Markdown
     `(markdown-code-face ((t (:inherit nil))))
     `(markdown-hr-face ((t (:foreground ,bg+1))))

     ;; Eglot
     `(eglot-inlay-hint-face ((t (:inherit nil :foreground ,fg :height 0.8))))

     ;; Eldoc box
     `(eldoc-box-body ((t :background ,border)))
     `(eldoc-box-border ((t :background ,border)))

     ;; Org
     `(org-document-info-keyword ((t (:foreground ,fg))))
     `(outline-1 ((t (:foreground ,accent-def :weight bold))))
     `(outline-2 ((t (:foreground ,accent-def :weight bold))))
     `(outline-3 ((t (:foreground ,accent-def :weight bold))))
     `(outline-4 ((t (:foreground ,accent-def))))
     `(outline-5 ((t (:foreground ,accent-def))))
     `(outline-6 ((t (:foreground ,accent-def))))
     `(outline-7 ((t (:foreground ,accent-def))))
     
     ;; Diff-hl
     `(diff-hl-insert ((t :foreground nil :background ,signal-ok :inherit nil)))
     `(diff-hl-change ((t :foreground nil :background ,signal-info :inherit nil)))
     `(diff-hl-delete ((t :foreground nil :background ,signal-error :inherit nil))))))

(provide 'cisco-themes)
