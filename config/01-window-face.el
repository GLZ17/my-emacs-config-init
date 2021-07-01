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
;; 光标所在行高亮
(global-hl-line-mode 1)
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
