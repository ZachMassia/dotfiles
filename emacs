(require 'cl)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu", "http://elpa.gnu.org/packages/")))
(package-initialize)

(defvar packages-list
  '(auto-complete auto-complete-clang-async go-autocomplete fuzzy go-mode
                  enh-ruby-mode inf-ruby robe rspec-mode ruby-block ruby-end
                  ruby-interpolation rhtml-mode rinari autopair yasnippet smex
                  flycheck flycheck-color-mode-line solarized-theme jump
                  ethan-wspace magit clojure-mode)
  "List of packages that need to be installed")

(defun has-package-not-installed ()
  (loop for p in packages-list
        when (not (package-installed-p p)) do (return t)
        finally (return nil)))
(when (has-package-not-installed)
  ;; Check for new package versions
  (message "%s" "Getting latest versions of all packages..")
  (package-refresh-contents)
  (message "%s" "done.")
  ;; Install the missing packages
  (dolist (p packages-list)
    (when (not (package-installed-p p))
      (package-install p))))

;;; Load the real init file
(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/init.el")))
