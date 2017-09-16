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
			  window-numbering
			  ;;powerline
			  which-key
			  ;evil
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

;; Config to Powerline which from Git
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline/")
(setq ns-use-srgb-colorspace nil)
(require 'powerline)
(setq powerline-arrow-shape 'arrow14)
(custom-set-faces
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

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

;; Enable Company-mode
(global-company-mode t)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; Enable windownumbering
(window-numbering-mode t)

;; Enable Powerline
;;(require 'powerline)
;;(powerline-default-theme)


;; Enable which-keu mode
(which-key-mode t)
(setq which-key-side-window-location 'right)
(setq which-key-idle-delay 1.0)

(provide 'init-packages)
