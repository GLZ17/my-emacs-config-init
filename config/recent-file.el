;; 开启最近打开文件的记录功能
(recentf-mode t)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; 设置打开配置文件快捷键
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

