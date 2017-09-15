(tool-bar-mode 0)

;; Hide Scroll-bar-mode
(scroll-bar-mode 0)

;; Disable start page
(setq inhibit-splash-screen t)

;; Change cursor bar
(setq-default cursor-type 'bar)

;; Fullscreen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; Show current line
(global-hl-line-mode t)

;; Show line number
(global-linum-mode  t)

(provide 'init-ui)
