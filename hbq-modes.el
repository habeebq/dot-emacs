;; User level Emacs settings for User: hbq
;; Use this file to turn on, off or customize modes

;;(global-hl-line-mode 1)    ; turn on highlight mode
(global-whitespace-mode 0) ;turn off tabs vs space

;; CUA mode
;;(cua-mode t)
;;(setq-default cua-enable-cua-keys nil)
;;(setq-default indent-tabs-mode nil) ;; insert spaces, not tabs
(setq-default truncate-lines t) ;; long lines will go off the screen and not wrap around. One text line per screen line

;;Setups JEDI autocomplete for python
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;;
(package-initialize)
;; Use sublimity for smooth scrolling - this is just a visual nicety
;;(require 'sublimity)
;;(require 'sublimity-scroll)
;;(sublimity-mode 0)
;;(require 'sublimity-map)
;;(require 'sublimity-attractive)

;; Use the guide-key package to display key-bindings help
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x" "C-c" "C-x 5" "C-c C-p" "C-c C-t"))
(setq guide-key/popup-window-position (quote bottom))
(guide-key-mode 1)  ; Enable guide-key-mode

;; God mode hooks
(defun god-update-cursor ()
  "Update my cursor."
  (setq cursor-type
        (if god-local-mode
            'bar
          'box)))

(defun c/god-mode-update-cursor ()
  (let ((limited-colors-p (> 257 (length (defined-colors)))))
    (cond (god-local-mode (progn
                            (set-face-background 'mode-line (if limited-colors-p "blue4" "#e9e2cb"))
                            (set-face-background 'mode-line-inactive (if limited-colors-p "blue4" "#e9e2cb"))))
          (t (progn
               (set-face-background 'mode-line (if limited-colors-p "black" "#0a2832"))
               (set-face-background 'mode-line-inactive (if limited-colors-p "black" "#0a2832")))))))


(add-hook 'god-mode-enabled-hook 'god-update-cursor)
(add-hook 'god-mode-disabled-hook 'god-update-cursor)
;;(add-hook 'god-mode-enabled-hook 'c/god-mode-update-cursor)
;;(add-hook 'god-mode-disabled-hook 'c/god-mode-update-cursor)

;; Turn on ido-mode
(ido-mode 1)
(ido-vertical-mode 1)
(ido-everywhere 1)
(setq ido-use-filename-at-point 'guess)
(setq ido-enable-flex-matching t)
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right) ;;Up/Down to move, left/right for dir or histories
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; VHDL mode hooks
;;(defun auto-vhdl-mode-hook()
;;  (auto-complete-mode 1))
;;(add-hook 'vhdl-mode-hook 'auto-complete-mode)

;; vhdl mode customisations
;; override some of imgs syntax highlighting defined in site-start.el
;; because they look jarring on a dark theme
(setq vhdl-special-syntax-alist '(
    ("generic/constant" "\\<[cC]_\\w+\\>" "Gold4" "medium aquamarine" nil)
    ("type" "\\<\\w+_type\\>" "ForestGreen" "PaleGreen" nil)
    ("variable" "\\<\\w+_v\\>" "Grey30" "Grey80" nil)
    ("activelow" "\\<\\(resetn\\|en\\)\\>" "magenta" "#d33682" nil)
    ("local" "\\<\\w+_l\\>" "brown" "yellow2" nil)
    ("input" "\\<\\w+_i\\>" "Orange" "Orange" nil)
    ("output" "\\<\\w+_o\\>" "Orange" "Orange" nil)
    ("outputlowactiveenable" "\\<\\w+_oen\\>" "Orange" "Orange" nil)
    ("outputenable" "\\<\\w+_oe\\>" "Orange" "Orange" nil)
    ("interrupt" "\\<\\w+_irq\\>" "purple" "purple" nil)
    ("next" "\\<\\(n_\\w+\\|\\w+_adv\\)\\>" "cyan" "royalblue" nil)
    ("function" "\\<f_\\w+\\>" "cyan" "royalblue" nil)
    )
      )
