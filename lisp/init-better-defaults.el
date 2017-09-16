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

;; Config to Hippie-expand
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))

;; Change yes-or-no to y-or-n
(fset 'yes-or-no-p 'y-or-n-p)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(put 'dired-find-alternate-file 'disabled nil)
(require 'dired-x)
(setq dired-dwim-target t)

(provide 'init-better-defaults)
