;; Org-mode syntax highlight

(with-eval-after-load 'org
  (setq org-src-fontify-natively t)

  (setq org-agenda-files '("~/.emacs.d/org"))
  
  (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/org/list.org" "Work List")
	 "* TODO [#B] %?\n %i\n"
	 :empty-lines 1))))

(provide 'init-org)
