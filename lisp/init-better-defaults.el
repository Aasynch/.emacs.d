;; Disable Ring-bell
(setq ring-bell-function 'ignore)

;; Enable Abbrev-mode
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    
					    ))

;; Disable backup-files 
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Recentf-mode
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)

;; Enable Show-paren-mode
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; Delete-selection-mode
(delete-selection-mode t)


(provide 'init-better-defaults)
