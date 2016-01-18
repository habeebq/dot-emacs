;; This file will find, install and load all the packages mentioned in this list
;; It has one dependency, it requires the packages package which comes installed with emacs 24

(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(add-to-list 'load-path "~/.emacs.d/site-lisp/")

(setq package-list
      '(atom-dark-theme 
        color-theme-solarized
        god-mode
        guide-key
        ido-ubiquitous 
        jedi 
        auto-complete
        jedi-core
        moe-theme
        molokai-theme
        monokai-theme
        markdown-mode
        nyan-mode
        paredit
        powerline
        python-environment
        sublimity
        solarized-theme
        undo-tree
        virtualenv
        zenburn-theme))


;active all the packages
(package-initialize)

;fetch list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install any missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
