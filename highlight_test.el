(defface my-highlight
       '((((class color) (min-colors 88) (background light))
          :background "darkseagreen2")
         (((class color) (min-colors 88) (background dark))
          :background "darkolivegreen")
         (((class color) (min-colors 16) (background light))
          :background "darkseagreen2")
         (((class color) (min-colors 16) (background dark))
          :background "darkolivegreen")
         (((class color) (min-colors 8))
          :background "green" :foreground "black")
         (t :inverse-video t))
       "Basic face for highlighting."
       :group 'basic-faces)

(defvar highlight-symbol-keyword-alist nil)
(make-variable-buffer-local 'highlight-symbol-keyword-alist)

(defun highlight-symbol-flush ()
  (if (fboundp 'font-lock-flush)
      (font-lock-flush)
    ;; Emacs < 25
    (with-no-warnings
      (font-lock-fontify-buffer))))

(defun highlight-symbol-add-symbol-with-face (symbol face)
  (let ((keywords `(,symbol 0 ',face prepend)))
    (push keywords highlight-symbol-keyword-alist)
    (font-lock-add-keywords nil (list keywords) 'append)
    (highlight-symbol-flush)))

(defun highlight-symbol-remove-symbol (symbol)
  (let ((keywords (assoc symbol highlight-symbol-keyword-alist)))
    (setq highlight-symbol-keyword-alist
          (delq keywords highlight-symbol-keyword-alist))
    (font-lock-remove-keywords nil (list keywords))
    (highlight-symbol-flush)))

(highlight-symbol-add-symbol-with-face "font" 'my-highlight)
(highlight-symbol-add-symbol-with-face "nil" 'my-highlight)

(highlight-symbol-remove-symbol "nil")
(highlight-symbol-remove-symbol "font")

(length nil)
