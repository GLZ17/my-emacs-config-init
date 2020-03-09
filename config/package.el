;; 添加源（用于包的安装）
(require 'package)
;; (add-to-list 'package-archives '("melpa-stable" . "http://www.mirrorservice.org/sites/stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
(add-to-list 'package-archives '("MELPA Stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/") t)
(package-initialize)


;; 定义变量
;; 指定使用的包
(defvar package-list '(company ;; 补全
		       base16-theme ;; 主题（语法高亮）
		       counsel ;; minibuffer 补全提示
		       project-abbrev ;; 缩写补全
		       htmlize ;; org 导出 html
		       hungry-delete ;;智能删除
		       ;; ---之后的都有waring
		       markdown-mode ;;避免报错
		       rust-mode ;;报错
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
(setq project-abbrev-config-file "~/.emacs.d/project-abbrev.config")
(global-set-key (kbd "<tab>") 'project-abbrev-complete-word)

;; 打开窗口，光标自动匹配
(require 'popwin)
(popwin-mode 1)

;; 补全引号、括号之类的
(smartparens-global-mode t)
