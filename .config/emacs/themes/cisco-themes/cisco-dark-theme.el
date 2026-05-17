(require 'cisco-themes)

(deftheme cisco-dark
  "Cisco Dark Theme")

(cisco-theme-apply-faces 'cisco-dark cisco-theme-dark-palette)

(custom-theme-set-faces
 'cisco-dark
 `(font-lock-doc-face ((t :foreground ,(plist-get cisco-theme-dark-palette :accent-doc))))
 `(font-lock-comment-face ((t :foreground ,(plist-get cisco-theme-dark-palette :accent-comments))))
 `(font-lock-comment-delimiter-face ((t :inherit 'font-lock-comment-face)))
 `(font-lock-delimiter-face ((t :inherit 'font-lock-comment-face)))
 `(font-lock-bracket-face ((t :inherit 'font-lock-comment-face)))
 
 `(font-lock-string-face ((t :foreground ,(plist-get cisco-theme-dark-palette :accent-str))))
 `(font-lock-number-face ((t :foreground ,(plist-get cisco-theme-dark-palette :accent-num))))
 `(font-lock-punctuation-face ((t :foreground ,(plist-get cisco-theme-dark-palette :accent-punctuation))))
 `(font-lock-operator-face ((t :inherit 'font-lock-punctuation-face)))

 `(font-lock-function-name-face ((t :foreground ,(plist-get cisco-theme-dark-palette :accent-def))))
 `(font-lock-type-face ((t :inherit 'default)))
 `(font-lock-property-name-face ((t :inherit 'default)))
 `(font-lock-property-use-face ((t :inherit 'default)))
 `(font-lock-variable-name-face ((t :inherit 'default)))
 `(font-lock-variable-use-face ((t :inherit 'default)))
 `(font-lock-constant-face ((t :foreground ,(plist-get cisco-theme-dark-palette :accent-constants))))
 
 `(font-lock-keyword-face ((t :foreground ,(plist-get cisco-theme-dark-palette :accent-keywords))))
 `(font-lock-builtin-face ((t :inherit 'default))))

(provide-theme 'cisco-dark)
(provide 'cisco-dark-theme)
