"Reload file: M-x load-file <location>"

(defun simp-beginning-of-buffer ()
  "Move to beginning of buffer"
  (interactive)
  (push-mark)
  (goto-char (point-min)))

(defun my-yank ()
  "Copy in car kill ring"
  (interactive)
  (let ((old-point (point))) 
    (insert (car kill-ring-yank-pointer))
    (message "initial point = %i, final point = %i" old-point (point))
  ))

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

;; (font-lock-add-keywords 'emacs-lisp-mode
;; 			'(("foo" . 'my-highlight)))

;; (font-lock-add-keywords 'emacs-lisp-mode
;; 			'(("lock" . 'my-highlight)))

;; (font-lock-add-keywords 'emacs-lisp-mode
;; 			'(("my" . 'my-highlight)))

;; (font-lock-add-keywords 'emacs-lisp-mode
;; 			'(("local" . 'my-highlight)))

;; agressive whitespace marking.
(defface extra-whitespace-face
  '((t (:background "pale green")))
  "Used in text-mode and friends for exactly one space after a period.")

;; (mapc (lambda (mode)
;;         (font-lock-add-keywords
;;          mode
;;          '(("hello" 0 'show-paren-mismatch-face)
;;            ("\\.\\( \\)\\b" 1 'my-highlight))))
;;       '(text-mode latex-mode html-mode emacs-lisp-mode
;;         texinfo-mode))

(defvar safe-paste-regions nil)
(make-variable-buffer-local 'safe-paste-regions)

;; (defun add-keyword (word)
;;   (interactive)
;;   )
;; (defun highlight (str-to-highlight)
;;       "Say hello to SOMEONE via M-x hello."
;;       (interactive "sWhat word do you want to highlight? ")
;;       (message "Highlighting %s!" str-to-highlight)

;;       (font-lock-add-keywords nil
;; 			      '(("mode" . 'my-highlight)) 'append)

;;       (font-lock-fontify-buffer)
      
;;       (message "Highlighting again %s!" str-to-highlight)
;;       )

;; (defun highlight-word (word)
;;   (font-lock-add-keywords nil '((word . 'my-highlight)) 'append)
;;   (font-lock-fontify-buffer))

;; (highlight-word "hello")

(font-lock-add-keywords nil '(("lock" . 'my-highlight)) 'append)
(font-lock-add-keywords nil '(("nil" . 'my-highlight)) 'append)
(font-lock-add-keywords nil '(("cube" . 'my-highlight)) 'append)
(font-lock-add-keywords nil '(("append" . 'my-highlight)) 'append)
(font-lock-add-keywords nil '(("mode" . 'my-highlight)) 'append)
(font-lock-fontify-buffer)

(defun highlight-word nil
  (font-lock-add-keywords nil '(("buffer" . 'my-highlight)) 'append)
  (font-lock-fontify-buffer))


;; This function call does not work, but the above call, highlight-word
;; does work. Maybe somehow arg is not actually being evaluated inside the string?
(defun highlight-word-str (arg)
  (font-lock-add-keywords nil `((,arg . my-highlight)) 'append)
  (font-lock-fontify-buffer))

;;(highlight-word)

(highlight-word-str "major")

(defun let-major-l () 'major)
;; (defun my-font-lock-restart ()
;;   (interactive)
;;   (setq font-lock-mode-major-mode nil)
;;   (font-lock-fontify-buffer))

;;(my-font-lock-restart)

;; (defun word-test (arg)
;;   `((,arg . 'my-highlight)))
;; (message (word-test "hello"))

;; (defun word-test-2 ()
;;   '(("string" . 'my-highlight)))
;; (message (word-test-2))
;; (message (word-test-2));; (message (word-test-2));; (message (word-test-2))
;; (message (word-test-2));; (message (word-test-2));; (message (word-test-2))
;; (message (word-test-2));; (message (word-test-2));; (message (word-test-2))



