;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq
 want-native t
 doom-theme 'doom-snazzy-custom
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

(setq-default
 theming-modifications
 '((doom-old-hope
    (lsp-face-highlight-read :background nil :weight bold))))

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

(use-package! clojure-mode
  :config
  (setq clojure-indent-style 'align-arguments
        clojure-thread-all-but-last t
        clojure-align-forms-automatically t)
  (format-all-mode -1))

(use-package! lsp-mode
  :commands lsp
  :hook ((clojure-mode . lsp))
  :config
  (setq lsp-ui-doc-enable nil
        lsp-lens-enable t
        lsp-enable-file-watchers t
        ;; lsp-signature-auto-activate t
        lsp-semantic-tokens-enable t
        lsp-completion-use-last-result nil
        company-idle-delay 0.5

        ;; lsp-signature-auto-activate t

        lsp-ui-doc-delay 5

        ;; lsp-ui-imenu-enable t

        lsp-ui-sideline-enable nil)
  (setq lsp-file-watch-ignored-directories
        (cl-union lsp-file-watch-ignored-directories
                  '("[/\\\\]build\\'"
                    "[/\\\\]deployment\\'"
                    "[/\\\\]public\\'"
                    "[/\\\\]resource\\'"
                    "[/\\\\]target\\'"
                    "[/\\\\]tmp\\'"
                    "[/\\\\].log\\'"
                    "[/\\\\].clj-kondo\\'"
                    "[/\\\\].git\\'"
                    "[/\\\\].shadow-cljs\\'"
                    "[/\\\\]src/js\\'"
                    "[/\\\\]src/less\\'"
                    "[/\\\\]src/tailwind\\'"
                    "[/\\\\]test/e2e/screenshots\\'")))
  (advice-add #'lsp-rename :after (lambda (&rest _) (projectile-save-project-buffers))))

(after! cider-mode
  :config (setq cider-clojure-cli-aliases "-A:test:dev"))

(after! ivy-posframe
  :config (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center))))

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

 (:after clojure-mode
  :n "gd" #'lsp-find-definition
  :n "gD" #'lsp-find-references)

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
