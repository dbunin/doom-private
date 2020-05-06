;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-auto-revert-mode t)

(load-theme 'doom-dark+ t)

(setq
 doom-font (font-spec :family "JetBrains Mono")
 doom-big-font (font-spec :family "Mononoki" :size 14)
 doom-themes-enable-italic t
;; ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center))
 web-mode-markup-indent-offset 2
 web-mode-code-indent-offset 2
 js-indent-level 2
 css-indent-offset 2
 company-idle-delay 0.2
 company-echo-delay 0.0
 company-minimum-prefix-length 2
 company-tooltip-flip-when-above t
 company-dabbrev-downcase nil)

;; (add-to-list 'ivy-re-builders-alist
;;              '(counsel-projectile-find-file . ivy--regex-ignore-order))


(setq cider-clojure-cli-global-options "-R:test")


(use-package! lispyville
  :init
  (general-add-hook '(emacs-lisp-mode-hook lisp-mode-hook clojure-mode-hook cider-repl-mode-hook) #'lispyville-mode)
  :config
  (lispyville-set-key-theme '(operators
                              text-objects
                              wrap
                              slurp/barf-cp
                              additional
                              additional-motions
                              (additional-wrap normal visual insert)
                              additional-insert)))

(evil-define-key 'insert 'lispyville-mode "(" 'lispy-parens)
(evil-define-key 'insert 'lispyville-mode "[" 'lispy-brackets)
(evil-define-key 'insert 'lispyville-mode "{" 'lispy-braces)
(evil-define-key 'normal 'global "\"" 'lispy-quotes)
(evil-define-key 'visual 'global "\"" 'lispy-quotes)
(evil-define-key 'insert 'global "\"" 'lispy-quotes)


;; (use-package! evil-cleverparens
;;   ;:hook clojure-mode
;;   :config
;;   (add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
;;   )

(use-package! flycheck-clj-kondo
  :after clojure-mode
  :config
  (require 'flycheck-clj-kondo))

(map! ;; sexp navigation
  :nmvo doom-leader-key nil
  :nmvo doom-localleader-key nil

  ;; ;; Easier window navigation
  :n "C-h"   #'evil-window-left
  ;; :n "C-j"   #'evil-window-down
  ;; :n "C-k"   #'evil-window-up
  :n "C-l"   #'evil-window-right

  (:after cider-mode
    (:leader
      :desc "Lookup documentation at point" :n  "d"  #'cider-doc
      :desc "Jump to definition at point"   :n  "l"  #'cider-find-var
      :desc "eval" :prefix "e"
         :n "e" #'cider-eval-last-sexp
         :n "v" #'cider-eval-defun-at-point
         :n "b" #'cider-eval-buffer
         :n "D" #'cider-insert-defun-in-repl
         :n "e" #'cider-eval-last-sexp
         :n "E" #'cider-insert-last-sexp-in-repl
         :n "r" #'cider-eval-region
         :n "R" #'cider-insert-region-in-repl
         :n "u" #'cider-undef
      :desc "refactor" :prefix "r"
         :n "t" #'clojure-thread-first-all
         :n "T" #'clojure-thread-last-all
         :n "-" #'clojure-cycle-privacy
         :n "n" #'clojure-cycle-not
         :n "i" #'clojure-cycle-if
         :n "w" #'clojure-cycle-when
         :n "l" #'clojure-introduce-let
         :n "L" #'clojure-move-to-let)
    (:map cider-mode-map
      :localleader
      :n  "'"  #'cider-jack-in
      :n  "\"" #'cider-jack-in-clj&cljs
      :n  "r"  #'cider-switch-to-repl-buffer
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
