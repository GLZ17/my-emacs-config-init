;; 禁止生产备份文件
(setq make-backup-files nil)

;; 禁止自动保存文件生产
(setq auto-save-default nil)





;; M-x customize-group Return 输入某一个类别可以设置对应的种类
;; 如：rigion 设置激活区域，hl-line 设置当前行高亮
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(pixel-scroll-mode t)
 ;; '(scroll-conservatively 1000000)
 ;; '(scroll-preserve-screen-position 1)
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(hl-line ((t (:background "#586F3E" :foreground "#dddddd"))))
 '(region ((t (:background "#863434" :foreground "#cccccc")))))







;;中英文字体对齐
;; Auto generated by cnfonts
;; <https://github.com/tumashu/cnfonts>
(set-face-attribute
 'default nil
 :font (font-spec :name "-outline-Consolas-bold-italic-normal-mono-*-*-*-*-c-*-iso10646-1"
                  :weight 'normal
                  :slant 'normal
                  :size 12.5))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font
   (frame-parameter nil 'font)
   charset
   (font-spec :name "-outline-文泉驿等宽微米黑-normal-normal-normal-sans-*-*-*-*-p-*-iso10646-1"
              :weight 'normal
              :slant 'normal
              :size 13.5)))




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



;; 添加源（用于包的安装）
(require 'package)
;; (add-to-list 'package-archives '("melpa-stable" . "http://www.mirrorservice.org/sites/stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
(add-to-list 'package-archives '("MELPA Stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/") t)
(package-initialize)


;; 定义变量
;; 指定使用的包
(defvar package-list '(
		       company ;; 补全
		       base16-theme ;; 主题（语法高亮）
		       counsel ;; minibuffer 补全提示
		       ;;project-abbrev ;; 缩写补全
		       htmlize ;; org 导出 html
		       hungry-delete ;;智能删除
		       php-mode
		       typescript-mode
		       haskell-mode
		       smartparens ;; 补全括号、引号之类的
		       popwin ;; 新打开的辅助窗口时光标自动适应
		       )) 
;; 设置变量方便管理包（如：使用命令可以自动删除包）
(setq package-selected-packages package-list)
;; fetch the list of packages available
;; 获取可用包信息
(unless package-archive-contents
  (package-refresh-contents))
;; install the missing packages
;; 安装缺少的包
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; 补全延迟时间
(setq-default company-idle-delay 0.7)
;; 开始补全的最小字符
(setq-default company-minimum-prefix-length 2)
;; 全局补全
(add-hook 'after-init-hook 'global-company-mode)

;; 设置主题
(load-theme 'base16-default-dark t)

;; 使minibuffer 可读性变得很强，搜索也很爽
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; C-n/C-p 可以选择 minibuffer 中的选项
;; C-x b 可以切换 buffer
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; 配置缩写补全，默认的补全文件会影响自定义配置文件的加载（会失效）
;;(setq project-abbrev-config-file "~/.emacs.d/project-abbrev.config")
;;(global-set-key (kbd "<tab>") 'project-abbrev-complete-word)

;; 打开窗口，光标自动匹配
(require 'popwin)
(popwin-mode 1)
;; 补全引号、括号之类的
(smartparens-global-mode t)

;; 不设置 interative-haskell-mode中进入ghci中会卡死（不停提示进程死亡）
(set-language-environment 'utf-8)




;; 开启最近打开文件的记录功能
(recentf-mode t)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; 设置打开配置文件快捷键
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)




;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭菜单栏
(menu-bar-mode -1)
;; 关闭滚动条
(scroll-bar-mode -1)
;; 关闭欢迎页面
(setq-default inhibit-startup-screen t)
;; 高亮匹配的括号
(show-paren-mode t)
;; 行号右对齐
(setq display-line-numbers-width-start t)
;; 显示行号
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
;; 显示当前行
;;(global-hl-line-mode t)
;; 设置光标类型
(setq-default cursor-type 'bar)


;; 文字以像素单位滚动
(pixel-scroll-mode t)
;; 大于100后，光标不会自动居中（超出上下屏不会自动居中）
(setq scroll-conservatively 222)
;; 滚动时维持光标位置
(setq scroll-preserve-screen-position t)

;; 禁止鼠标滚轮滚动
(mouse-wheel-mode -1)
;; 隐藏滚轮时间
(global-set-key [wheel-up] 'ignore)
(global-set-key [wheel-down] 'ignore)
(global-set-key [double-wheel-up] 'ignore)
(global-set-key [double-wheel-down] 'ignore)
(global-set-key [triple-wheel-up] 'ignore)
(global-set-key [triple-wheel-down] 'ignore)
