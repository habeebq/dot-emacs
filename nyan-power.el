;; active power mode + nyan-mode

(defvar nyan-power-length 3)


(defun nyan-power-decrement ()
  (if (> nyan-bar-length 3)
      (progn (setq nyan-power-length (- nyan-power-length 1))
       (setq nyan-bar-length nyan-power-length)
       (run-at-time 0.1 nil 'nyan-power-decrement)
       )
    )
)

(defun nyan-power-update ()
  (setq nyan-power-length (+ nyan-power-length 1))
  (setq nyan-bar-length nyan-power-length)
  (run-at-time 0.1 nil 'nyan-power-decrement)
)
;; Add hook to run a function
(add-hook 'post-self-insert-hook 'nyan-power-update)


(provide 'nyan-power)

