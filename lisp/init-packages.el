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
			  reveal-in-osx-finder
			  web-mode
			  js2-refactor
			  expand-region
			  iedit
			  helm-ag
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
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
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

;; Config to Web-mode
(add-hook 'web-mode-hook 'isalas/web-mode-indent-setup)

;; Config to js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)

;; Config to expand-region
(require 'expand-region)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(provide 'init-packages)
