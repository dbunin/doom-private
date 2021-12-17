;;; doom-clapoto-dark-theme.el -*- lexical-binding: t;no-byte-compile: t -*-

;;; Commentary:
(require 'doom-themes)
;;; Code:
;;
(defgroup doom-clapoto-dark-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-clapoto-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-clapoto-dark-theme
  :type 'boolean)

(defcustom doom-clapoto-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-clapoto-dark-theme
  :type 'boolean)

(defcustom doom-clapoto-dark-comment-bg doom-clapoto-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background.
Enhancing their legibility."
  :group 'doom-clapoto-dark-theme
  :type 'boolean)

(defcustom doom-clapoto-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-clapoto-dark-theme
  :type '(choice integer boolean))

(def-doom-theme doom-clapoto-dark
  "A greenish/gold dark theme"

  ((bg         '("#0c120d" "color-233"))
   (bg-alt     '("#000000" "color-16"))
   (base0      '("#1c261e" "color-235"))
   (base1      '("#1c261e" "color-235"))
   (base2      '("#272727" "color-235"))
   (base3      '("#324034" "color-237"))
   (base4      '("#525249" "color-239"))
   (base5      '("#6e6e62" "color-242"))
   (base6      '("#808074" "color-244"))
   (base7      '("#a3a39b" "color-247"))
   (base8      '("#faf4c6" "color-230"))
   (fg         '("#fcfcdd" "color-230"))
   (fg-alt     '("#fcfbd2" "color-230"))

   (grey        '("#76715e" "color-243"))
   (red         '("#fb5574" "color-204"))
   (orange      '("#cc8914" "color-172"))
   (green       '("#cffb6c" "color-191"))
   (green-br    '("#92b34e" "color-107"))
   (teal        '("#4f7579" "color-66"))
   (yellow      '("#e7d757" "color-185"))
   (dark-yellow '("#b28914" "color-136"))
   (blue        '("#7b97e2" "color-110"))
   (dark-blue   '("#4e608e" "color-60"))
   (magenta     '("#fbbadc" "color-218"))
   (violet      '("#905e78" "color-96"))
   (cyan        '("#a6f5fc" "color-159"))
   (dark-cyan   '("#4f7579" "color-66"))
   ;; face categories
   (highlight      dark-yellow)
   (vertical-bar   base0)
   (selection      base4)
   (builtin        dark-yellow)
   (comments       (if doom-clapoto-dark-brighter-comments green-br grey))
   (doc-comments   (if doom-clapoto-dark-brighter-comments (doom-lighten green-br 0.15) (doom-darken grey 0.1)))
   (constants      base7)
   (functions      base8)
   (keywords       dark-yellow)
   (methods        yellow)
   (operators      green-br)
   (type           dark-yellow)
   (strings        green)
   (variables      base8)
   (numbers        base8)
   (region         base3)
   (error          red)
   (warning        orange)
   (success        green)
   (vc-modified    teal)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (hidden-alt `(,(car bg-alt) "black" "black"))
   (-modeline-pad
    (when doom-clapoto-dark-padded-modeline
      (if (integerp doom-clapoto-dark-padded-modeline) doom-sourcerer-padded-modeline 4)))

   (modeline-fg base7)
   (modeline-fg-alt (doom-blend yellow grey (if doom-clapoto-dark-brighter-modeline 0.4 0.08)))

   (modeline-bg
    (if doom-clapoto-dark-brighter-modeline
        `(,(car base4) ,@(cdr base1))
      `(,(car base3) ,@(cdr base0))))
   (modeline-bg-l
    (if doom-clapoto-dark-brighter-modeline
        modeline-bg
      `(,(doom-darken (car bg) 0.15) ,@(cdr base1))))
   (modeline-bg-inactive   (doom-darken bg 0.20))
   (modeline-bg-inactive-l `(,(doom-darken (car bg-alt) 0.2) ,@(cdr base0))))

  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background base4 :foreground base1)
   (cursor :background yellow)
   (font-lock-comment-face
    :foreground comments
    :background (if doom-clapoto-dark-comment-bg (doom-darken bg-alt 0.095)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)
   (mode-line-buffer-id :foreground green-br :bold bold)
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground teal :bold bold)

   (doom-modeline-bar :background (if doom-clapoto-dark-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-path :foreground (if doom-clapoto-dark-brighter-modeline base8 blue) :bold bold)
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-project-root :foreground teal :weight 'bold)

   (tab-line :background base3)
   (tab-line-tab :background base3 :foreground fg)
   (tab-line-tab-inactive :background base3 :foreground fg-alt :box `(:line-width 1 :color ,base1 :style released-button))
   (tab-line-tab-current :background base4 :foreground fg :box `(:line-width 1 :color ,base1 :style pressed-button))
   (tab-bar :background base2)
   (tab-bar-tab :background base4 :foreground highlight)
   (tab-bar-tab-inactive :background bg-alt :foreground fg-alt)

   (mode-line
    :background base3 :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,base3)))
   (mode-line-inactive
    :background bg-alt :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if doom-clapoto-dark-brighter-modeline base8 highlight))
   (fringe :background base2)
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   (lazy-highlight :foreground fg :background base4)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground yellow)

;;;;; ivy-mode
   (ivy-current-match :background base3 :distant-foreground base7 :weight 'normal)
   (ivy-posframe :background base0 :foreground fg)
   (internal-border :background base7)

;;;;; lsp-mode and lsp-ui-mode
   (lsp-face-highlight-textual :background dark-cyan :foreground base8 :distant-foreground base7 :weight 'bold)
   (lsp-face-highlight-read    :background dark-cyan :foreground base8 :distant-foreground base7 :weight 'bold)
   (lsp-face-highlight-write   :background dark-cyan :foreground base8 :distant-foreground base7 :weight 'bold)
   (lsp-ui-peek-header :foreground fg :background (doom-lighten bg 0.1) :bold bold)
   (lsp-ui-peek-list :background (doom-darken bg 0.1))
   (lsp-ui-peek-peek :background (doom-darken bg 0.1))

   ;; tooltip and company
   (tooltip              :background bg-alt :foreground fg)
   (company-tooltip-selection     :background base3)

   ;; markdown-mode
   (markdown-header-face :inherit 'bold :foreground red)

   ;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground dark-yellow)
   (rainbow-delimiters-depth-2-face :foreground green-br)
   (rainbow-delimiters-depth-3-face :foreground teal)
   (rainbow-delimiters-depth-4-face :foreground orange)
   (rainbow-delimiters-depth-5-face :foreground magenta)
   (rainbow-delimiters-depth-6-face :foreground yellow)
   (rainbow-delimiters-depth-7-face :foreground orange)
;;;;; org-mode
   ((org-block &override) :background bg-alt)
   ((org-block-begin-line &override) :background bg-alt :slant 'italic)
   ((org-block-end-line &override) :background bg-alt :slant 'italic)
   ((org-document-title &override) :foreground yellow :height 1.953125)
   ((org-level-1 &override) :foreground blue :height 1.75)
   ((org-level-2 &override) :foreground green-br :height 1.5625)
   ((org-level-3 &override) :foreground yellow :height 1.25)
   ((org-level-4 &override) :foreground red)
   ((org-level-5 &override) :foreground magenta)
   ((org-level-6 &override) :foreground violet)
   ((org-level-7 &override) :foreground cyan)
   ((org-level-8 &override) :foreground magenta)
   (org-hide :foreground hidden)
   ((org-quote &override) :background base1)
   (solaire-org-hide-face :foreground hidden-alt)

;;;;; rjsx-mode
   (rjsx-tag :foreground yellow)
   (rjsx-tag-bracket-face :foreground base8)
   (rjsx-attr :foreground magenta :slant 'italic :weight 'medium)

;;;;; selectrum
   (selectrum-current-candidate :background base3 :distant-foreground base7 :weight 'normal)

;;;;; treemacs
   (treemacs-root-face :foreground strings :weight 'bold :height 1.2)
   (doom-themes-treemacs-file-face :foreground comments)
   )


  ;; --- extra variables --------------------
  ;; ()

  )

;;; doom-clapoto-dark-theme.el ends here
