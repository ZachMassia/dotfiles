;;; init.el --- Settings and package configuration.
;;;
;;; Commentary:
;;;
;;; To be loaded by ~/.emacs after all packages are updated/installed.
;;;
;;; Code:

;; Enable varias global modes
(ido-mode t)
(global-flycheck-mode t)
(yas-global-mode t)

;; Autocomplete
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(autopair-global-mode t)

;; Theme
(load-theme 'solarized-dark t)

;; Remove GUI items
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Who needs a welcome screen
(setq inhibit-startup-screen t)

;; Tabs are evil
(setq-default indent-tabs-mode nil)

;; Highlight text past 80 columns
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; C-x g for git status
(global-set-key (kbd "C-x g") 'magit-status)

;; Indent on newline
(global-set-key (kbd "RET") 'newline-and-indent)

;; Indent on yank
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode `(emacs-lisp-mode lisp-mode clojure-mode
                                                     scheme-mode haskell-mode
                                                     ruby-mode rspec-mode
                                                     python-mode c-mode c++-mode
                                                     objc-mode latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

;;; Ruby Related Settings
;;; =====================
;; General ruby minor modes
(add-hook 'ruby-mode-hook
          (lambda ()
            (robe-mode)
            (ruby-interpolation-mode)
            (ruby-end-mode)
            (ruby-block-mode)))

;; Add robe sources to auto-complete
(push 'ac-source-robe ac-sources)
;;; =====================

;;; C++ Related Settings
;;; ====================
;; Use Stroustrup style for C-like languages
(setq c-default-style "stroustrup"
      c-basic-offset 4)

;; Switch between header/source with C-c o
(add-hook 'c-mode-common-hook
          (lambda ()
            (local-set-key (kbd "C-c o") 'ff-find-other-file)))

;; Clang auto-complete
;; Unfortunately the melpa recipe does not build the required executable,
;; so do not forget to clone the repo to build and link it.
(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process))

(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;; ====================

;;; Some settings from https://github.com/technomancy/better-defaults
;;; =================================================================
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(show-paren-mode t)
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      ido-enable-flex-matching t)
;;; =================================================================

;;; Smex Settings
;;; =============
;; Load smex on-demand
(global-set-key (kbd "M-x") (lambda ()
                              (interactive)
                              (or (boundp 'smex-cache)
                                  (smex-initialize))
                              (global-set-key [(meta x)] 'smex)
                              (smex)))

(global-set-key (kbd "M-X") (lambda ()
                              (interactive)
                              (or (boundp 'smex-cache)
                                  (smex-initialize))
                              (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                              (smex-major-mode-commands)))
; Smex space inserts hyphen
(defadvice smex (around space-inserts-hyphen activate compile)
       (let ((ido-cannot-complete-command
              `(lambda ()
                 (interactive)
                 (if (string= " " (this-command-keys))
                     (insert ?-)
                   (funcall ,ido-cannot-complete-command)))))
         ad-do-it))

; Update smex after load functions
(defun smex-update-after-load (unused)
  (when (boundp 'smex-cache)
    (smex-update)))
(add-hook 'after-load-functions 'smex-update-after-load)
;;; =============
