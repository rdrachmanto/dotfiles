(deftheme cisco
  "Cisco Theme")

(let ((black1 "#0e100f")
      (black2 "#1e201f")
      (black3 "#1f211f")
      (black4 "#403e3c")
      (black5 "#878580")
      (black6 "#a0a0a0")
      
      (light1 "#f8f8f8")
      (light2 "#cecdc3")
      (light3 "#fefefe")
      
      (blue1 "#2b5375")
      (blue2 "#3aa99f")
      (blue3 "#4385be")
      (blue4 "#5b79e3")
      (blue5 "#79b8ff")
      (blue6 "#8caec1")

      (lightgreen "#a9be50")
      (green "#879a39")
      (green2 "#6c7b2e")

      (yellow1 "#ad8301")
      (yellow2 "#d0a215")
      (yellow3 "#f3cd07")

      (orange1 "#da702c")
      (orange2 "#fe9900")
      (orange3 "#ffab70")
      (orange4 "#ffc799")
      
      (purple1 "#b392f1")
      (purple2 "#e394dc")
      (purple3 "#834de8")
      
      (pink "#fa7584")
      (pink2 "#f84055")
      
      (red1 "#d14d41")
      (red2 "#d3604f"))
  (custom-theme-set-faces
   'cisco
   ;; UI elements
   `(default ((t (:background ,light3 :foreground ,black1))))
   `(vertical-border ((t (:foreground ,black4))))
   `(region ((t (:background ,light2))))
   `(line-number ((t (:foreground ,black5))))
   `(line-number-current-line ((t (:foreground ,orange1))))

   `(mode-line ((t (:background ,light2 :foreground ,black1))))
   `(mode-line-inactive ((t (:foreground ,black4))))

   `(fringe ((t (:background ,light3 :foreground ,light3))))

   ;; Text highlighting
   `(font-lock-comment-face ((t (:foreground ,black5))))
   `(font-lock-doc-face ((t (:inherit 'font-lock-comment-face))))
   `(font-lock-comment-delimiter-face ((t (:inherit 'font-lock-comment-face))))
   `(font-lock-type-face ((t (:foreground ,blue4))))
   `(font-lock-string-face ((t (:foreground ,orange1))))
   `(font-lock-regexp-face ((t (:foreground ,black6))))
   `(font-lock-constant-face ((t (:foreground ,blue4))))
   `(font-lock-variable-name-face ((t (:foreground ,black1))))
   `(font-lock-variable-use-face ((t (:inherit 'font-lock-variable-name-face))))
   `(font-lock-builtin-face ((t (:foreground ,blue4))))
   `(font-lock-punctuation-face ((t (:foreground ,black1))))
   `(font-lock-function-name-face ((t (:foreground ,purple3))))
   `(font-lock-function-call-face ((t (:inherit 'font-lock-function-name-face))))
   `(font-lock-operator-face ((t (:foreground ,pink2))))
   `(font-lock-keyword-face ((t (:foreground ,pink2))))
   
   ;; Flymake
   `(flymake-note-echo ((t (:foreground ,blue4))))
   `(flymake-warning-echo ((t (:foreground ,orange1))))
   `(flymake-error-echo ((t (:foreground ,pink2))))

   ;; Markdown
   `(markdown-code-face ((t (:inherit nil))))
   `(markdown-hr-face ((t (:foreground ,black2))))
   
   ;; Eldoc box
   `(eldoc-box-body ((t (:background ,light1))))
   `(eldoc-box-border ((t (:background ,black5))))

   ;; Rainbow delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,red1))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,orange1))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,yellow1))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,green2))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,blue4))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,blue6))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,purple2))))
   ))

(provide-theme 'cisco)
(provide 'cisco-theme)
