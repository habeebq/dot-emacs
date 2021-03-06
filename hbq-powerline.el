;; User theme related functioncs


;; Powerline more
(require 'powerline)
(powerline-default-theme)
(setq powerline-default-separator 'slant) ;; mirrored arrows, 

;;(nyan-mode)

;;(set-face-attribute 'mode-line-buffer-id nil :foreground "black" :overline "red" :underline "red")
(set-face-attribute 'mode-line-buffer-id nil :foreground "#073642")

(custom-set-faces
 '(mode-line ((t (:inherit mode-line :background "#268bd2" :foreground "#073642"))))
 '(powerline-active1 ((t (:inherit mode-line :background "#859900" :foreground "#002b36"))))
)

;;;###autoload
(defun powerline-hbq-theme ()
  "Setup the default mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (face3 (if active 'powerline-buffer-face-active 'powerline-buffer-face-inactive))
                          (separator-left (intern (format "powerline-%s-%s"
							  (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw "%*" nil 'l)
                                     (when powerline-display-buffer-size
                                       (powerline-buffer-size nil 'l))
                                     (when powerline-display-mule-info
                                       (powerline-raw mode-line-mule-info nil 'l))
                                     (powerline-buffer-id nil 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))
                                     (powerline-raw " ")
                                     (funcall separator-left mode-line face1)
                                     (when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-major-mode face1 'l)
                                     (powerline-process face1)
                                     (powerline-minor-modes face1 'l)
                                     (powerline-narrow face1 'l)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (powerline-vc face2 'r)
;;                                     (when (bound-and-true-p nyan-mode)
                                       (powerline-raw (list (nyan-create)) face2 'l)
;;                                       )
                                     ))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
                                     (funcall separator-right face2 face1)
				     (unless window-system
				       (powerline-raw (char-to-string #xe0a1) face1 'l))
				     (powerline-raw "%4l" face1 'l)
				     (powerline-raw ":" face1 'l)
				     (powerline-raw "%3c" face1 'r)
				     (funcall separator-right face1 mode-line)
				     (powerline-raw " ")
				     (powerline-raw "%6p" nil 'r)
                                     (when powerline-display-hud
                                       (powerline-hud face2 face1)))))
		     (concat (powerline-render lhs)
			     (powerline-fill face2 (powerline-width rhs))
			     (powerline-render rhs)))))))

;; Hook for God mode
(defun god-update-modeline ()
  "Updates the modeline colors in God mode"
  (if god-local-mode
      (set-face-background 'powerline-active1 "#dc322f")
      (set-face-background 'powerline-active1 "#859900")
      )
  (powerline-reset)
)

(add-hook 'god-mode-enabled-hook 'god-update-modeline)
(add-hook 'god-mode-disabled-hook 'god-update-modeline)
