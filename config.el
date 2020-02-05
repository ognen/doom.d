;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here


;; Configre lispy with more sane navigation keys

(after! lispy
  (lispy-set-key-theme '(paredit c-digits))
  ;; The following function breaks company when
  ;; cider is jacked in.
  (defun lispy-clojure-complete-at-point () nil))

;; (after! counsel
;;   (setq counsel-rg-base-command "~/.homebrew/bin/rg -S --no-heading --line-number --color never %s ."))
(after! org
  (setq org-bullets-bullet-list '("⁖")
        org-ellipsis " ... "))

(add-hook! 'after-change-major-mode-hook (setq truncate-lines nil))

(after! lispyville
  (map!
   :nv "H" #'lispyville-backward-sexp
   :nv "L" #'lispyville-forward-sexp
   :nvi "M-h" #'lispyville-beginning-of-defun
   :nvi "M-l" #'lispyville-end-of-defun
   ;; like lispy-flow
   :nv "s-[" #'lispyville-previous-opening
   :nv "s-]" #'lispyville-next-closing
   :nv "{" #'lispyville-next-opening
   :nv "}" #'lispyville-previous-closing
   ;; like lispy-left and lispy-right
   :nv "(" #'lispyville-backward-up-list
   :nv ")" #'lispyville-up-list
   :nv "C-(" #'sp-down-sexp
   :nv "C-)" #'sp-backward-down-sexp))

(map!
 :leader
 :prefix "b"
 :desc "Revert this buffer"
 "r" #'revert-buffer)

;; Use mac keybindings for evil-multiedit
(map! (:when (featurep! :editor multiple-cursors)
        :v  "R"     #'evil-multiedit-match-all
        :n  "s-d"   #'evil-multiedit-match-symbol-and-next
        :n  "s-D"   #'evil-multiedit-match-symbol-and-prev
        :v  "s-d"   #'evil-multiedit-match-and-next
        :v  "s-D"   #'evil-multiedit-match-and-prev
        :nv "C-s-d" #'evil-multiedit-restore
        (:after evil-multiedit
          (:map evil-multiedit-state-map
            "s-d"    #'evil-multiedit-match-and-next
            "s-D"    #'evil-multiedit-match-and-prev
            "RET"    #'evil-multiedit-toggle-or-restrict-region
            [return] #'evil-multiedit-toggle-or-restrict-region)
          (:map (evil-multiedit-state-map evil-multiedit-insert-state-map)
            "C-n" #'evil-multiedit-next
            "C-p" #'evil-multiedit-prev))))

;; General settings
(setq
 doom-font                       (font-spec :family "SF Mono" :size 13 :weight 'semi-bold)
 doom-big-font                   (font-spec :family "SF Mony" :size 16)
 projectile-project-search-path  '("~/Workspace")
 +format-on-save-enabled-modes   '(js2-mode)
 truncate-lines                  nil
 js-indent-level                 2
 mac-mouse-wheel-smooth-scroll   t)
