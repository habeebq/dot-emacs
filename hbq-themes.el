;; User theme related functioncs

(defun random-color-theme ()
  (interactive)
  (random t)
  (funcall (car (nth (random (length color-themes)) color-themes))))

;; Setup solarized theme and load customisations on top
;;(custom-set-variables
;; '(frame-background-mode (quote dark))
;; '(custom-enabled-themes (quote (solarized-dark)))
;;)
(package-initialize)
(load-theme 'solarized-dark t)
;; This customisation is on-top of and only for the solarized theme
(custom-set-faces
 '(font-lock-function-name-face ((t (:foreground "deep sky blue"))))
 '(vhdl-font-lock-reserved-words-face ((t (:foreground "red" :bold t))) t)
 '(vhdl-font-lock-translate-off-face ((t (:background "dark slate gray"))) t))
;; Add for solarized powerline cleanup
(setq x-underline-at-descent-line t)
