
(defun hbq-home () (interactive)
  (if (eq last-command 'hbq-home-screen-top) ; if last command took it to top of screen
      (beginning-of-buffer) ; go to the top of the buffer instead
    (if (eq last-command 'hbq-home-line) ; else, if the last command took it to the start of the line
        (progn
          (move-to-window-line 0) ;move to top of screen
          (setq this-command 'hbq-home-screen-top)) ; set the command name
      (move-beginning-of-line nil) ; else go to beginning of line
       (setq this-command 'hbq-home-line)) ; set the command name
      ))

(defun hbq-end () (interactive)
  (if (eq last-command 'hbq-end-screen-top) ; if last command took it to bottom of screen
      (end-of-buffer) ; go to the bottom of the buffer instead
    (if (eq last-command 'hbq-end-line) ; else, if the last command took it to the end of the line
        (progn
          (move-to-window-line -1) ;move to bottom of screen
          (setq this-command 'hbq-end-screen-top)) ; set the command name
      (move-end-of-line nil) ; else go to beginning of line
       (setq this-command 'hbq-end-line)) ; set the command name
      ))

(defun hbq-kill () (interactive)
  (if (not cua--rectangle)
      (if (eq mark-active t) ;not in rectangle mode, check to see if mark set
          (call-interactively 'kill-region) ;cut the selection
        (beginning-of-line) ;no mark set, move to start of line
        (kill-whole-line) ;cut the whole line
        )
    (call-interactively 'cua-cut-rectangle) ;rectangle set, cut the rectangle
    )
  (deactivate-mark)
  )

(defun hbq-copy () (interactive)
  (if (not cua--rectangle)
      (if (eq mark-active t) ;not a rectangle, check to see if mark set
          (call-interactively 'kill-ring-save) ;mark set, copy the selection
        (kill-ring-save (line-beginning-position) (line-beginning-position 2)) ;copy the line
        )
    (call-interactively 'cua-copy-rectangle) ;rectangle set, copy the rectangle
    )
  (deactivate-mark)
  )

(defun hbq-esc () (interactive)
  (if (and (>= (recursion-depth) 1) (active-minibuffer-window))
      (abort-recursive-edit)
    (god-mode-all)
    )
)

(define-key global-map [insert] 'cua-paste)
(define-key global-map [kp-insert] 'cua-paste)
(define-key global-map [kp-add] 'hbq-copy)
(define-key global-map [kp-subtract] 'hbq-kill)
(define-key global-map [home] 'hbq-home)
(define-key global-map [end]  'hbq-end)

;; Keyboard bindings
(global-set-key (kbd "C-SPC") 'dabbrev-expand)
(global-set-key (kbd "S-<end>") (kbd "C-S-e"))
(global-set-key (kbd "S-<home>") (kbd "C-S-a"))
(global-set-key (kbd "C-S-s") 'occur)

;;Keyboard bindings for windmove - jumping through frames
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(global-set-key (kbd "<escape>") 'hbq-esc)

;;Use smex for execute-extended-command
;(global-set-key (kbd "M-x") 'smex)
