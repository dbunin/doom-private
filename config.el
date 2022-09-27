;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(add-hook 'window-setup-hook #'toggle-frame-fullscreen)

(setq
 explicit-shell-file-name "/bin/zsh"
 auth-sources '("~/.authinfo")
 doom-localleader-key ","
 want-native t
 doom-theme 'doom-old-hope
 doom-font (font-spec :family "JetBrains Mono")
 doom-big-font (font-spec :family "JetBrains Mono" :size 14.0)
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

(add-hook! 'doom-load-theme-hook :append (load! "+themes"))
(lispy-mode -1)
(load! "+gui")

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

;; (use-package! catppuccin-theme
;;  :config
;;  (setq catppuccin-height-title1 1.5))

;; (use-package! lispyville
;;   :init
;;   (add-hook! '
;;   :config
;;   (lispyville-set-key-theme '(operators
;;
;;                               wrap
;;                               slurp/barf-cp
;;                               additional
;;                               additional-motions
;;                               (additional-wrap normal visual insert)
;;                               additional-insert)))

(use-package! clojure-mode
  :config
  (setq clojure-indent-style 'align-arguments
        clojure-thread-all-but-last t
        clojure-align-forms-automatically t)
  (format-all-mode -1))

(use-package! jest
  :defer t
  :config
  (setq jest-executable "npx --version & npx --no-install jest")
  :hook ((clojurescript-mode . jest-minor-mode))
  :init
  (map! :after clojurescript-mode
        (:localleader
         :desc "jest" :prefix "j"
           :n "f" #'jest-file
           :n "k" #'jest-file-dwim
           :n "m" #'jest-repeat
           :n "p" #'jest-popup)))

(use-package! lsp-mode
  :commands lsp
  :hook ((clojure-mode . lsp))
  :config
  (setq cider-font-lock-dynamically nil ; use lsp semantic tokens
        cider-eldoc-display-for-symbol-at-point nil ; use lsp
        cider-prompt-for-symbol nil

        lsp-headerline-breadcrumb-enable nil
        lsp-lens-enable t
        lsp-enable-file-watchers t
        lsp-signature-render-documentation nil
        lsp-signature-function 'lsp-signature-posframe
        lsp-semantic-tokens-enable t
        lsp-idle-delay 0.3
        lsp-use-plists nil
        lsp-completion-sort-initial-results t
        lsp-completion-no-cache t
        lsp-completion-use-last-result nil

        ;; lsp-ui-doc-enable nil ; testing it out

        ;; lsp-ui-imenu-enable t

        lsp-ui-sideline-enable t ; testing it out
                                   )

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
  (advice-add #'lsp-rename :after (lambda (&rest _) (projectile-save-project-buffers)))
  (set-lookup-handlers! 'cider-mode nil) ; use lsp
  (add-hook 'cider-mode-hook (lambda () (remove-hook 'completion-at-point-functions #'cider-complete-at-point))) ; use lsp
  )

(after! cider-mode
  :config (setq cider-clojure-cli-aliases "-A:test:dev"))

(after! ivy-posframe
  :config (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center))))

(map!
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
  :n "gD" #'lsp-find-references
  ;; (:localleader
  ;;  (:desc "lsp" :prefix "r"
  ;;   :n "t" #'lsp-clojure-thread-first-all
  ;;   :n "T" #'lsp-clojure-thread-last-all))
  ))
