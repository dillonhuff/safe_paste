"Reload file: M-x load-file <location>"

(defun simp-beginning-of-buffer ()
  "Move to beginning of buffer"
  (interactive)
  (push-mark)
  (goto-char (point-min)))

(defun my-yank ()
  "Copy in car kill ring"
  (interactive)
  (insert (car kill-ring-yank-pointer)))

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

(font-lock-add-keywords 'emacs-lisp-mode
			'(("foo" . 'my-highlight)))

;; agressive whitespace marking.
(defface extra-whitespace-face
  '((t (:background "pale green")))
  "Used in text-mode and friends for exactly one space after a period.")

(mapc (lambda (mode)
        (font-lock-add-keywords
         mode
         '(("hello" 0 'show-paren-mismatch-face)
           ("\\.\\( \\)\\b" 1 'my-highlight))))
      '(text-mode latex-mode html-mode emacs-lisp-mode
        texinfo-mode))

(defvar safe-paste-regions nil)
(make-variable-buffer-local 'safe-paste-regions)

(defun add-keyword (word)
  (interactive)
  )

(defun highlight (str-to-highlight)
      "Say hello to SOMEONE via M-x hello."
      (interactive "sWhat word do you want to highlight? ")
      (message "Highlighting %s!" str-to-highlight)

      (font-lock-add-keywords 'emacs-lisp-mode
			      '(("word" . 'my-highlight)))

      (font-lock-fontify-buffer)
      
      (message "Highlighting again %s!" str-to-highlight)
      )


(font-lock-add-keywords nil '(("three" . 'my-highlight)) 'append)

(defun my-font-lock-restart ()
  (interactive)
  (setq font-lock-mode-major-mode nil)
  (font-lock-fontify-buffer))

