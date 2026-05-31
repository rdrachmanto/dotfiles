(require 'cisco-themes)

(deftheme cisco-light
  "Cisco Theme")

(cisco-theme-apply-faces 'cisco-light cisco-theme-light-palette)

(custom-theme-set-faces
 'cisco-light
 `(font-lock-punctuation-face ((t :foreground ,(plist-get cisco-theme-light-palette :accent-punctuation))))
 `(font-lock-operator-face ((t :inherit 'font-lock-punctuation-face)))

 `(font-lock-function-name-face ((t :foreground ,(plist-get cisco-theme-light-palette :accent-def))))
 `(font-lock-type-face ((t :inherit 'default)))
 `(font-lock-property-name-face ((t :inherit 'default)))
 `(font-lock-property-use-face ((t :inherit 'default)))
 `(font-lock-variable-name-face ((t :inherit 'default)))
 `(font-lock-variable-use-face ((t :inherit 'default)))
 `(font-lock-constant-face ((t :foreground ,(plist-get cisco-theme-light-palette :accent-constants))))
 
 `(font-lock-keyword-face ((t :foreground ,(plist-get cisco-theme-light-palette :accent-keywords))))
 `(font-lock-builtin-face ((t :inherit 'default))))

(provide-theme 'cisco-light)
(provide 'cisco-light-theme)

