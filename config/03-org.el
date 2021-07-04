(setq org-default-notes-file "~/.emacs.d/notes.org")
(setq org-agenda-files "~/.emacs.d/agenda")

;; agenda 快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
;; capture 快捷键
(global-set-key (kbd "C-c c") 'org-capture)


(setq-default  org-export-with-sub-superscripts nil)


;; hidden minibuffer message: indentation setup for shell type sh
(advice-add 'sh-set-shell :around
            (lambda (orig-fun &rest args)
              (let ((inhibit-message t))
                (apply orig-fun args))))

;; 运行代码
;; (org-babel-do-load-languages
;;       'org-babel-load-languages
;;       '((emacs-lisp . t)
;;         (C . t)
;;         (java . t)
;;         (js . t)
;;         (ruby . t)
;;         (ditaa . t)
;;         (python . t)
;;         (shell . t)
;;         (latex . t)
;;         (plantuml . t)
;;         (R . t)))

;; enalbe <s TAB completion emacs v27.2
(require 'org-tempo)
