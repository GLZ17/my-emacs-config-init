(setq org-default-notes-file "~/.emacs.d/notes.org")
(setq org-agenda-files "~/.emacs.d/agenda")

;; agenda 快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
;; capture 快捷键
(global-set-key (kbd "C-c c") 'org-capture)