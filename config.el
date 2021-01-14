;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq
 doom-theme 'doom-dark+
 doom-font (font-spec :family "Fira Code")
 doom-big-font (font-spec :family "Fira Code" :size 14.0)
 doom-themes-enable-italic t
 web-mode-markup-indent-offset 2
 web-mode-code-indent-offset 2
 js-indent-level 2
 css-indent-offset 2
 company-idle-delay 0.2
 company-echo-delay 0.0
 company-minimum-prefix-length 2
 company-tooltip-flip-when-above t
 company-dabbrev-downcase nil)

(after! cider-mode
  (setq cider-clojure-cli-global-options "-R:test"))

(use-package! lispyville
  :init
  (add-hook! '(emacs-lisp-mode-hook lisp-mode-hook clojure-mode-hook cider-repl-mode-hook) #'lispyville-mode)
  :config
  (lispyville-set-key-theme '(operators
                              text-objects
                              wrap
                              slurp/barf-cp
                              additional
                              additional-motions
                              (additional-wrap normal visual insert)
                              additional-insert)))

;; (use-package! flycheck-clj-kondo
;;   :after clojure-mode
;;   :config
;;   (require 'flycheck-clj-kondo))

(after! clojure-mode
  (format-all-mode -1)
  ;; (add-hook 'before-save-hook #'+format|buffer)
  )

;; (use-package! lsp-mode
;;   :after clojure-mode
;;   :ensure t
;;   :hook ((clojure-mode . lsp)
;;          (clojurec-mode . lsp)
;;          (clojurescript-mode . lsp))
;;   :config
;;   ;; add paths to your local installation of project mgmt tools, like lein
;;   (setenv "PATH" (concat
;;                    "/usr/local/bin" path-separator
;;                    (getenv "PATH")))
;;   (dolist (m '(clojure-mode
;;                clojurec-mode
;;                clojurescript-mode
;;                clojurex-mode))
;;      (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))
;;   (setq lsp-clojure-server-command '("bash" "-c" "clojure-lsp") ;; Optional: In case `clojure-lsp` is not in your PATH
;;         lsp-enable-indentation nil))

(map!
  ;; :nmvo doom-leader-key nil
  ;; :nmvo doom-localleader-key nil

  ;; Easier window navigation
  :n "C-h"   #'evil-window-left
  ;; :n "C-j"   #'evil-window-down
  ;; :n "C-k"   #'evil-window-up
  :n "C-l"   #'evil-window-right
  :n "\""    #'lispy-quotes
  :n "\""    #'lispy-quotes
  :n "\""    #'lispy-quotes

  (:after lispyville-mode
   :n "(" #'lispy-parens
   :n "[" #'lispy-brackets
   :n "{" #'lispy-braces)

  (:after cider-mode
    :n ",eb" #'cider-eval-buffer
    :n ",ed" #'cider-eval-defun-at-point
    :n ",eD" #'cider-insert-defun-in-repl
    :n ",ee" #'cider-eval-last-sexp
    :n ",eE" #'cider-insert-last-sexp-in-repl
    :n ",er" #'cider-eval-region
    :n ",eR" #'cider-insert-region-in-repl
    :n ",eu" #'cider-undef
    :n ",rt" #'lsp-clojure-thread-first-all
    :n ",rT" #'lsp-clojure-thread-last-all
    :n ",r-" #'clojure-cycle-privacy
    :n ",rn" #'clojure-cycle-not
    :n ",ri" #'clojure-cycle-if
    :n ",rw" #'clojure-cycle-when
    :n ",rl" #'clojure-introduce-let
    :n ",rL" #'clojure-move-to-let)
    ;; (:leader
    ;;   :desc "Lookup documentation at point" :n  "d"  #'cider-doc
    ;;   :desc "Jump to definition at point"   :n  "l"  #'cider-find-var
    ;;   :desc "eval" :prefix "e"
    ;;      :n "e" #'cider-eval-last-sexp
    ;;      :n "v" #'cider-eval-defun-at-point
    ;;      :n "b" #'cider-eval-buffer
    ;;      :n "D" #'cider-insert-defun-in-repl
    ;;      :n "e" #'cider-eval-last-sexp
    ;;      :n "E" #'cider-insert-last-sexp-in-repl
    ;;      :n "r" #'cider-eval-region
    ;;      :n "R" #'cider-insert-region-in-repl
    ;;      :n "u" #'cider-undef
  )
