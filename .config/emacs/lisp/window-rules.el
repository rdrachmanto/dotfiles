;;; window-rules.el -*- lexical-binding: t; -*-

(defgroup window-rules nil
  "Options for window-rules")

(defcustom window-rules-bottom-panel-list '()
  "List of buffer and its slot that will be in bottom panel

Each element should have the form:

(BUFFER-NAME SLOT)

BUFFER-NAME is a regexp matching the name of the buffer
SLOT is integer specifying the slot to put the buffer in, valid values are -1, 0, 1 going left to right
"
  :type '(repeat
          (list
           (string :tag "Buffer name")
           (choice :tag "Slot"
                   (const -1)
                   (const 0)
                   (const 1))))
  :group 'window-rules)

(defcustom window-rules-right-panel-list '()
  "List of buffer and its slot that will be in right panel

Each element should have the form:

(BUFFER-NAME SLOT)

BUFFER-NAME is a regexp matching the name of the buffer
SLOT is integer specifying the slot to put the buffer in, valid values are -1, 0, 1 going top to bottom
"
  :type '(repeat
          (list
           (string :tag "Buffer name")
           (choice :tag "Slot"
                   (const -1)
                   (const 0)
                   (const 1))))
  :group 'window-rules)

(defcustom window-rules-bottom-panel-size 0.18
  "Size of bottom panel, expressed as decimal value from 0 to 1"
  :type 'float
  :group 'window-rules)

(defcustom window-rules-right-panel-size 0.18
  "Size of right panel, expressed as decimal value from 0 to 1"
  :type 'float
  :group 'window-rules)

(defun window-rules-apply ()
  "Apply `add-to-list' to `display-buffer-alist' for both bottom and right panel "
  (dolist (blist window-rules-bottom-panel-list)
    (pcase-let ((`(,bname ,bslot) blist))
      (add-to-list
       'display-buffer-alist
       `(,bname
         (display-buffer-in-side-window)
         (side . bottom)
         (slot . ,bslot)
         (window-height . ,window-rules-bottom-panel-size)))))

  (dolist (blist window-rules-right-panel-list)
    (pcase-let ((`(,bname ,bslot) blist))
      (add-to-list
       'display-buffer-alist
       `(,bname
         (display-buffer-in-side-window)
         (side . right)
         (slot . ,bslot)
         (window-width . ,window-rules-right-panel-size))))))


(provide 'window-rules)
;;; window-rules.el ends here
