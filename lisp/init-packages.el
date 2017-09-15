;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(when (>= emacs-major-version 24)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
    )

(require 'cl)

;;add whatever packages you want here
(defvar isalas/packages '(
			  company
			  monokai-theme
			  hungry-delete
			  swiper
			  counsel
			  smartparens
			  js2-mode
			  nodejs-repl
			  exec-path-from-shell
			  popwin
			  )  "Default packages")

(setq package-selected-packages isalas/packages)

(defun isalas/packages-installed-p ()
    (loop for pkg in isalas/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

(unless (isalas/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg isalas/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))

;; ------------------------------------------------------------------------------------------------------------------------------

;; Config Exec-path-from shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Enable Hungry-mode
(require 'hungry-delete)
(global-hungry-delete-mode t)

;; Enable Smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;; Config to swiper
(ivy-mode t)
(setq  ivy-use-virtual-buffers t)

;; Auto-mode-alist
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; Enable Company-mode
(global-company-mode t)

;; Theme
(load-theme 'monokai t)

;; Config to popwin
(require 'popwin)
(popwin-mode t)

;; Config nodejs-repl
(require 'nodejs-repl)


(provide 'init-packages)
