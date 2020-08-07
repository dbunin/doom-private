;;; init.el -*- lexical-binding: t; -*-
;; Copy me to ~/.doom.d/init.el or ~/.config/doom/init.el, then edit me!

(doom! :feature
       ;;debugger          ; FIXME stepping through code, to help you add bugs
       eval              ; run code, run (also, repls)
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       (lookup           ; helps you navigate your code and documentation
        +docsets)        ; ...or in Dash docsets locally
       snippets          ; my elves. They type so I don't have to
       spellcheck        ; tasing you for misspelling mispelling
       syntax-checker    ; tasing you for every semicolon you forget
       workspaces        ; tab emulation, persistence & separate workspaces

       :completion
       company           ; the ultimate code completion backend
       helm              ; the *other* search engine for love and life
       ;;ido              ; the other *other* search engine...
       ;; (ivy
       ;;  +fuzzy
       ;;  +icons)                            ; a search engine for love and life

       :ui
       deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-modeline     ; a snazzy Atom-inspired mode-line
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       evil-goggles      ; display visual hints when editing in evil
       ;;fci               ; a `fill-column' indicator
       hl-todo           ; highlight TODO/FIXME/NOTE tags
       modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash         ; blink the current line after jumping
       neotree           ; a project drawer, like NERDTree for vim
       treemacs          ; a project drawer, like neotree but cooler
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       ;; pretty-code       ; replace bits of code with pretty symbols
       ;;tabbar            ; FIXME an (incomplete) tab bar for Emacs
       unicode           ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows

       :editor
       (format +onsave)  ; automated prettiness
       ;; lispy             ; vim for lisp, for people who dont like vim
       multiple-cursors  ; editing in many places at once
       ;; parinfer          ; turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates

       :emacs
       (dired            ; making dired pretty [functional]
       ;;+ranger         ; bringing the goodness of ranger to dired
       +icons          ; colorful icons for dired-mode
        )
       ediff             ; comparing files in Emacs
       electric          ; smarter, keyword-based electric-indent
       ;;eshell            ; a consistent, cross-platform shell (WIP)
       hideshow          ; basic code-folding support
       imenu             ; an imenu sidebar and searchable code index
       term              ; terminals in Emacs
       vc                ; version-control and Emacs, sitting in a tree

       :tools
       ;;ansible
       docker
       editorconfig      ; let someone else argue about tabs vs spaces
       ;;ein               ; tame Jupyter notebooks with emacs
       ;;gist              ; interacting with github gists
       ;;macos             ; MacOS-specific commands
       make              ; run make tasks from Emacs
       magit             ; a git porcelain for Emacs
       ;;password-store    ; password manager for nerds
       ;;pdf               ; pdf enhancements
       ;;prodigy           ; FIXME managing external services & code builders
       rgb               ; creating color strings
       ;;terraform         ; infrastructure as code
       ;;tmux              ; an API for interacting with tmux
       ;;upload            ; map local to remote projects via ssh/ftp
       ;;wakatime

       :lang
       ;;assembly          ; assembly for fun or debugging
       ;;(cc +irony +rtags); C/C++/Obj-C madness
       (clojure +lsp)           ; java with a lisp
       ;;common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       ;;crystal           ; ruby at the speed of c
       ;;csharp            ; unity, .NET, and mono shenanigans
       data              ; config/data formats
       ;;erlang            ; an elegant language for a more civilized age
       ;; elixir            ; erlang done right
       ;; elm               ; care for a cup of TEA?
       emacs-lisp        ; drown in parentheses
       ;;ess               ; emacs speaks statistics
       ;; go                ; the hipster dialect
       ;;(haskell +intero) ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris             ;
       ;;(java +meghanada) ; the poster child for carpal tunnel syndrome
       javascript        ; all(hope(abandon(ye(who(enter(here))))))
       ;;julia             ; a better, faster MATLAB
       ;; latex             ; writing papers in Emacs has never been so fun
       ;;ledger            ; an accounting system in Emacs
       ;;lua               ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore
       ;;nim               ; python + lisp at the speed of c
       ;; nix               ; I hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       (org              ; organize your plain life in plain text
        +attach          ; custom attachment system
        +babel           ; running code in org
        +capture         ; org-capture in and outside of Emacs
        +export          ; Exporting org to whatever you want
        +present)        ; Emacs for presentations
       ;;perl              ; write code no one else can comprehend
       php               ; perl's insecure younger brother
       ;;plantuml          ; diagrams for confusing people more
       ;;purescript        ; javascript, but functional
       (python +lsp)            ; beautiful is better than ugly
       ;;qt                ; the 'cutest' gui framework ever
       ;;racket            ; a DSL for DSLs
       ;;rest              ; Emacs as a REST client
       ;;ruby              ; 1.step do {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       ;; rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       scala             ; java, but good
       (sh +fish)        ; she sells (ba|z|fi)sh shells on the C xor
       ;;solidity          ; do you need a blockchain? No.
       ;;swift             ; who asked for emoji variables?
       web               ; the tubes
       yaml              ; JSON, but readable
       ;;vala              ; GObjective-C

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They may have additional dependencies and
       ;; should be loaded late.
       :app
       ;;(email +gmail)    ; emacs as an email client
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought
       ;; (write            ; emacs as a word processor (latex + org + markdown)
       ;;  +wordnut         ; wordnet (wn) search
       ;;  +langtool)       ; a proofreader (grammar/style check) for Emacs

       :collab
       ;;floobits          ; peer programming for a price
       ;;impatient-mode    ; show off code over HTTP

       :config
       ;; For literate config users. This will tangle+compile a config.org
       ;; literate config in your `doom-private-dir' whenever it changes.
       ;;literate

       ;; The default module sets reasonable defaults for Emacs. It also
       ;; provides a Spacemacs-inspired keybinding scheme and a smartparens
       ;; config. Use it as a reference for your own modules.
       (default +bindings +smartparens))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("423435c7b0e6c0942f16519fa9e17793da940184a50201a4d932eafe4c94c92d" "f951343d4bbe5a90dba0f058de8317ca58a6822faa65d8463b0e751a07ec887c" "70cc30fd9d27a8d0d3ae82974ac2c409fd2cd5746470e2246778c6bec2d4857c" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "f2b83b9388b1a57f6286153130ee704243870d40ae9ec931d0a1798a5a916e76" "0fdd9258f9bf92772bf3d7839dee12161a48225f58b91035de33abb5e3a11a73" "614e5089876ea69b515c50b6d7fa0a37eb7ed50fda224623ec49e1c91a0af6a1" "8c847a5675ece40017de93045a28ebd9ede7b843469c5dec78988717f943952a" "4e132458143b6bab453e812f03208075189deca7ad5954a4abb27d5afce10a9a" "2f0cbe053485bccbbbb582acdba7c7c9585ad808ee8ab32f0d727c3d39b42275" "155a5de9192c2f6d53efcc9c554892a0d87d87f99ad8cc14b330f4f4be204445" "d0c943c37d6f5450c6823103544e06783204342430a36ac20f6beb5c2a48abe3" "34c99997eaa73d64b1aaa95caca9f0d64229871c200c5254526d0062f8074693" "b0fd04a1b4b614840073a82a53e88fe2abc3d731462d6fde4e541807825af342" "a8c210aa94c4eae642a34aaf1c5c0552855dfca2153fa6dd23f3031ce19453d4" "43c808b039893c885bdeec885b4f7572141bd9392da7f0bd8d8346e02b2ec8da" default)))
 '(safe-local-variable-values
   (quote
    ((cider-repl-init-code "(watch-build :app-watch)")
     (cider-shadow-default-options . "app-watch")
     (cider-default-cljs-repl . shadow)
     (cider-preferred-build-tool . shadow-cljs)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
