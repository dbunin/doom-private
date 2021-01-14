(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "f2927d7d87e8207fa9a0a003c0f222d45c948845de162c885bf6ad2a255babfd" "cf3d5d77679f7daed6a2c863e4f2e30427d5e375b254252127be9359957502ec" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "423435c7b0e6c0942f16519fa9e17793da940184a50201a4d932eafe4c94c92d" "f951343d4bbe5a90dba0f058de8317ca58a6822faa65d8463b0e751a07ec887c" "70cc30fd9d27a8d0d3ae82974ac2c409fd2cd5746470e2246778c6bec2d4857c" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "f2b83b9388b1a57f6286153130ee704243870d40ae9ec931d0a1798a5a916e76" "0fdd9258f9bf92772bf3d7839dee12161a48225f58b91035de33abb5e3a11a73" "614e5089876ea69b515c50b6d7fa0a37eb7ed50fda224623ec49e1c91a0af6a1" "8c847a5675ece40017de93045a28ebd9ede7b843469c5dec78988717f943952a" "4e132458143b6bab453e812f03208075189deca7ad5954a4abb27d5afce10a9a" "2f0cbe053485bccbbbb582acdba7c7c9585ad808ee8ab32f0d727c3d39b42275" "155a5de9192c2f6d53efcc9c554892a0d87d87f99ad8cc14b330f4f4be204445" "d0c943c37d6f5450c6823103544e06783204342430a36ac20f6beb5c2a48abe3" "34c99997eaa73d64b1aaa95caca9f0d64229871c200c5254526d0062f8074693" "b0fd04a1b4b614840073a82a53e88fe2abc3d731462d6fde4e541807825af342" "a8c210aa94c4eae642a34aaf1c5c0552855dfca2153fa6dd23f3031ce19453d4" "43c808b039893c885bdeec885b4f7572141bd9392da7f0bd8d8346e02b2ec8da" default))
 '(package-selected-packages '(lsp-mode))
 '(safe-local-variable-values
   '((eval with-eval-after-load "clj-refactor"
           (add-hook 'cider-connected-hook #'cider-sync-request:ns-load-all))
     (cljr-eagerly-build-asts-on-startup . t)
     (cljr-populate-artifact-cache-on-startup . t)
     (cljr-warn-on-eval)
     (cljr-clojure-test-declaration . "[clojure.test :refer [deftest testing is]]")
     (cljr-favor-prefix-notation)
     (clojure-align-forms-automatically . t)
     (cider-repl-init-code "(watch-build :app-watch)")
     (cider-shadow-default-options . "app-watch")
     (cider-default-cljs-repl . shadow)
     (cider-preferred-build-tool . shadow-cljs))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
