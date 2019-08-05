;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-auto-revert-mode t)

(key-chord-mode 1)

(require 'company)
;; (require 'evil-cleverparens-text-objects)
(load-theme 'doom-vibrant t)

(setq
 doom-font (font-spec :family "Mononoki" :size 14)
 doom-big-font (font-spec :family "Mononoki" :size 14)
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
(setq doom-neotree-file-icons 'simple)

;; python
;;
(add-hook!
  python-mode 'blacken-mode)

;; javascript
(after! tide
  (key-chord-define-global ",d" 'tide-jump-to-definition)
  (setq tide-completion-detailed t
        tide-always-show-documentation t))

(add-hook!
  js2-mode 'prettier-js-mode
  (add-hook 'before-save-hook #'refmt-before-save nil t))

;; double key press for exiting insert mode

;; clojure config
;;
;; it formats buffer and attempts to return to original position.
(defun cider-format-buffer-back () (interactive)
  (let (p)
    (setq p (point))
    (cider-format-buffer)
    (goto-char p)))


(def-package! evil-cleverparens
  ;:hook clojure-mode
  :config
  (add-hook 'clojure-mode-hook #'evil-cleverparens-mode))

(def-package! flycheck-joker
  :after clojure-mode
  :config
  (add-hook 'clojure-mode-hook #'flycheck-mode))

(add-hook!
  clojure-mode
  (add-hook 'before-save-hook
            'cider-format-buffer
            nil t))

(map! ;; sexp navigation
  :nmvo doom-leader-key nil
  :nmvo doom-localleader-key nil

  ;; Easier window navigation
  :n "C-h"   #'evil-window-left
  :n "C-j"   #'evil-window-down
  :n "C-k"   #'evil-window-up
  :n "C-l"   #'evil-window-right

  (:after cider-mode
    (:leader
      :desc "Lookup documentation at point" :n  "d"  #'cider-doc
      :desc "Jump to definition at point"   :n  "l"  #'cider-find-var
      :desc "eval" :prefix "e"
         :n "e" #'cider-eval-last-sexp
         :n "v" #'cider-eval-defun-at-point)
    (:map cider-mode-map
      :localleader
      :n  "'"  #'cider-jack-in
      :n  "\"" #'cider-jack-in-clojurescript
      :n  "b"  #'cider-eval-buffer
      :n  "B"  #'cider-switch-to-repl-buffer
      :n  "n"  #'cider-repl-set-ns
      :n  "j"  #'cider-find-var
      (:desc "docs" :prefix "d"
        :desc "Browse Namespace"  :n  "n" #'cider-browse-ns
        :desc "Browse Spec"       :n  "s" #'cider-browse-spec)
      :n  "h"  #'cider-doc
      :n  "c"  #'cider-repl-clear-buffer
      :n  "i"  #'cider-inspect-last-result
      :n  "t"  #'cider-test-run-ns-tests
      :n  "T"  #'cider-test-run-test)
    (:after cider-browse-ns-mode
      (:map cider-browse-ns-mode-map
        :n "RET"       #'cider-browse-ns-operate-at-point))))

;; global shortcuts
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

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
