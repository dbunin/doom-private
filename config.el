;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-auto-revert-mode t)

(key-chord-mode 1)

(require 'company)

(load-theme 'doom-dracula t)

(setq
 doom-font (font-spec :family "Mononoki" :size 14)
 doom-big-font (font-spec :family "Mononoki" :size 20)
 doom-themes-enable-italic t
 key-chord-two-keys-delay 0.2
 web-mode-markup-indent-offset 2
 web-mode-code-indent-offset 2
 js-indent-level 2
 css-indent-offset 2
 company-idle-delay 0.2
 company-echo-delay 0.0
 company-minimum-prefix-length 2
 company-tooltip-flip-when-above t
 company-dabbrev-downcase nil)

(doom-themes-visual-bell-config)
(doom-themes-neotree-config)

;; python

(add-hook!
  python-mode 'blacken-mode)

;; javascript
(after! tide
  (setq tide-completion-detailed t
        tide-always-show-documentation t))

(add-hook!
  js2-mode 'prettier-js-mode
  (add-hook 'before-save-hook #'refmt-before-save nil t))


;; double key press for exiting insert mode

;; clojure config

(after! clojure-mode
  (key-chord-define-global ",," 'cider-eval-defun-at-point)
  (key-chord-define-global ".." 'cider-eval-last-sexp)
  (key-chord-define-global ",f" 'cider-find-var)
  (key-chord-define-global ",'" 'cider-jack-in)
  (key-chord-define-global ",t" 'cider-switch-to-repl-buffer)
  (global-set-key (kbd "C->") 'sp-forward-slurp-sexp)
  (global-set-key (kbd "C-<") 'sp-backward-slurp-sexp)
  (define-clojure-indent
    (PUT 2)
    (POST 2)
    (GET 2)
    (PATCH 2)
    (DELETE 2)
    (api 2)
    (context 2)
    (checking 3)
    (context 2)
    (defroutes 'defun)
    (render 'defun)
    (componentDidMount 'defun)
    (componentWillMount 'defun)
    (query 'defun)
    (params 'defun))
  ;; (setq cider-cljs-lein-repl
  ;;       "(do (require 'figwheel-sidecar.repl-api)
  ;;        (figwheel-sidecar.repl-api/start-figwheel!)
  ;;        (figwheel-sidecar.repl-api/cljs-repl))")
  (setq cljr-magic-require-namespaces
        '(("io" . "clojure.java.io")
          ("sh" . "clojure.java.shell")
          ("jdbc" . "clojure.java.jdbc")
          ("set" . "clojure.set")
          ("time" . "java-time")
          ("walk" . "clojure.walk")
          ("zip" . "clojure.zip")
          ("async" . "clojure.core.async")
          ("component" . "com.stuartsierra.component")
          ("url" . "cemerick.url" )
          ("csv" . "clojure.data.csv")
          ("json" . "cheshire.core")
          ("s" . "clojure.spec.alpha")))
  (visual-line-mode 1))

;; global shortcuts
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define-global ";;" 'comment-line)
(key-chord-define-global ";+" 'comment-or-uncomment-region)

(global-set-key (kbd "s-y") 'sp-copy-sexp)
(global-set-key (kbd "s-x") 'sp-kill-sexp)
(global-set-key (kbd "s-c") 'sp-kill-symbol)

 ;; Coloring
(defun live-fontify-hex-colors (limit)
  (remove-overlays (point) limit 'fontify-hex-colors t)
  (while (re-search-forward "\\(#[[:xdigit:]]\\{6\\}\\)" limit t)
    (let ((ov (make-overlay (match-beginning 0)
                            (match-end 0))))
      (overlay-put ov 'face  (list :background (match-string 1) :foreground "black"))
      (overlay-put ov 'fontify-hex-colors t)
      (overlay-put ov 'evaporate t)))
  ;; return nil telling font-lock not to fontify anything from this
  ;; function
  nil)

(defun live-fontify-hex-colours-in-current-buffer ()
  (interactive)
  (font-lock-add-keywords nil
                          '((live-fontify-hex-colors))))

(provide 'live-fontify-hex)

(add-hook 'css-mode-hook
          #'live-fontify-hex-colours-in-current-buffer)

(add-hook 'scss-mode-hook
          #'live-fontify-hex-colours-in-current-buffer)

(add-hook 'scss-mode-hook
          #'live-fontify-hex-colours-in-current-buffer)

(add-hook 'js2-mode-hook
          #'live-fontify-hex-colours-in-current-buffer)

(add-hook 'cider-mode-hook
          #'live-fontify-hex-colours-in-current-buffer)

(add-hook 'web-mode-hook
          #'live-fontify-hex-colours-in-current-buffer)

(add-hook 'js2-mode-hook 'rainbow-delimiters-mode-disable)

;; zoombie keys
(define-key key-translation-map [dead-grave] "`")
(define-key key-translation-map [dead-acute] "'")
(define-key key-translation-map [dead-circumflex] "^")
(define-key key-translation-map [dead-diaeresis] "\"")
(define-key key-translation-map [dead-tilde] "~")
