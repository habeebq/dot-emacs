These are my emacs startup files.
Tested on emacs 24.3.
Requires image support to be compiled in emacs.

It is divided into a number of basic files, and some experimental additions.

Main
- hbq-init.el
- hbq-init-packages.el
- hbq-modes.el
- hbq-kmacros.el
- hbq-themes.el

Experimental and outliers
- hbq-powerline.el
- nyan-power.el

hbq-init-packages.el does not normally run, however if you want to set up a new emacs environment, evaluate this file to get all the packages.

TODO:
Migrate to use-package.

How to use:
Clone the repo somewhere.
Then add the path to your .emacs and try to load it with:

    ;; Emacs User Settings
    (add-to-list 'load-path "/user/hbq/workspace/user_settings/emacs")
    (load "hbq-init.el")
