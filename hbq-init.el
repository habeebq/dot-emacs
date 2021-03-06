;; User level Emacs settings for User: hbq


;; Handle repos, packages and auto-install
(custom-set-variables
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.org/packages/"))))
)

;; Environment
(setq split-height-threshold nil) 
(setq split-width-threshold 0) ; split across width
(custom-set-variables
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t))

(tool-bar-mode 0)
(menu-bar-mode 0)

;; Themes
(load "hbq-themes.el")

;;Keyboard bindings start
(load "hbq-kmacros.el")

;; Setup major and minor modes
(load "hbq-modes.el")

;; Setup powerline only if images are supported
(if (image-type-available-p 'xpm)
  (load "hbq-powerline.el")
)
