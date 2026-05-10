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

(defun cisco-themes-set-large-mode-line ()
  (when cisco-themes-large-mode-line
    `(:line-width 1 :color ,border)))

(defun cisco-themes-set-keywords-pop (subtle bright)
  (if cisco-themes-pop-keywords bright subtle))


(provide 'cisco-themes)
