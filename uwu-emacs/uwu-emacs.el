;;; *********************************
;;; ** DEFINITION OF THE CONSTANTS **
;;; *********************************

(defconst +five-minutes+ (* 5 60))
(defconst +fifteen-minutes+ (* 15 60))
(defconst +thirty-minutes+ (* 30 60))
(defconst +one-hour+ (* 60 60))
(defconst +one-day+ (* 24 +one-hour+))

;;; *********************************
;;; ** DEFINITION OF THE VARIABLES **
;;; *********************************

(defvar *HP* 8)
(defvar movement 0)

;;; ************
;;; * GRAPHICS *
;;; ************

;;; EGG

(defconst +egg-data+
  (list
   "."
   "｡"
   "ₒ"
   "o"
   "O"))

;;; BABBY

(defconst +babby-data+
  '((lawful
     "~:0" ;; forward
     "o:~" ;; left-facing
     "~:o" ;; right-facing
     "~:v" ;; right-moving
     "c:~" ;; left-moving
     )
   (chaotic
     "( .◎. )" ;; forward
     "(｡◎｡  )" ;; left-facing
     "(  ｡◎｡)" ;; right-facing
     "(_ ｡◎｡)_" ;; right-moving
     "_(｡◎｡ _)" ;; left-moving
     )))

(defconst +child-gfx+
  '((normie
     "(✿^‿^✿)"
     "(^‿^✿ )"
     "( ✿^‿^)"
     "(>✿^‿^)>"
     "<(^‿^✿<)")
   (active
     "( o v o )"
     "(o v o )"
     "( o v o)"
     "( ┘o v o)┘"
     "┌(o v o┌ )")
   (funny
     "( 。v ° )"
     "(。v ° )☆"
     "☆( 。v °)"
     "☆( >。v °)>"
     "<(。v °< )☆")
   (loud
     "(＾▽＾)"
     "(＾▽＾ )"
     "( ＾▽＾)"
     "(>＾▽＾)>"
     "<(＾▽＾<)")))

;;; how to access the child-data graphics: (cdr (nth ? +child-gfx+))

(defconst +teen-gfx+
  '((lawful
    (normie          
      "(u w u)" ;; forward      
      "(u w u )" ;; left-facing      
      "( u w u)" ;; right-facing      
      "(> u w u)>" ;; right-moving      
      "<( u w u <)") ;; left-moving
    
    (active
      "(o w o)" ;; forward      
      "(o w o )" ;; left-facing      
      "( o w o)" ;; right-facing      
      "(> o w o)>" ;; right-moving
      "<( o w o <)") ;; left-moving
     
    (funny
      "(•˘v˘•)" ;; forward      
      "(•˘v˘n )" ;; left-facing      
      "( ˘v˘•)" ;; right-facing      
      "(n˘v˘•)¬" ;; right-moving      
      "~(•˘v˘n)") ;; left-moving
    
    (loud
      "( *°▽°* )" ;; forward
      "(*°▽°* )" ;; left-facing      
      "( *°▽°*)" ;; right-facing      
      "(>*°▽°*)>" ;; right-moving      
      "<(*°▽°*<)")) ;; left-moving
    
    (chaotic
     
     (normie
       "(>.<)" ;; forward       
       "(<.<)" ;; left-facing       
       "(>.>)" ;; right-facing       
       "(>.>)//" ;; right-moving       
       "\\(<.<)") ;; left-moving     

     (active
       " (•̀_•́)" ;; forward       
       " (•̀_•́ )" ;; left-facing       
       " ( •̀_•́)" ;; right-facing       
       " (ง •̀_•́)ง" ;; right-moving       
       " ლ(•̀_•́ლ)") ;; left-moving     
     
     (funny
       " ¯\\(°_o)/¯" ;; forward       
       "(°_o )" ;; left-facing       
       "( o_°)" ;; right-facing       
       " (/¯o_°)/¯" ;; right-moving       
       " ¯\\(°_o¯\\)") ;; left-moving     
     
     (loud
       "(°□°)" ;; forward       
       "(°□° )" ;; left-facing       
       "( °□°)" ;; right-facing       
       "(╯°□°)╯" ;; right-moving       
       "╰(°□°╰)")))) ;; left-moving


(defconst +adult-gfx+
  '((lawful   ;; <- CAR selects lawful fields
    
     (normie      
      "(´◡‿|◡`)" ;; forward       
       "(´◡/‿◡` )" ;; left-facing       
       "( ´◡‿\\◡`)" ;; right-facing       
       "(>´◡‿\\◡`)>" ;; right-moving       
       "<(´◡/‿◡`<)");; left-moving     
     
     (active
       "(ˆ⌣ˆ)" ;; forward       
       "(ˆ⌣ˆc)" ;; left-facing       
       "(ↄˆ⌣ˆ)" ;; right-facing       
       "(>ↄˆ⌣ˆ)>" ;; right-moving       
       "<(ˆ⌣ˆc<)");; left-moving

     (funny
       "(≧∀≦)" ;; forward       
       "(≧∀≦ )" ;; left-facing       
       "( ≧∀≦)" ;; right-facing       
       "(/≧∀≦)/" ;; right-moving       
       "\\(≧∀≦\\)");; left-moving

     (loud
      "(▼∀▼)" ;; forward
      "(▼∀▼ )" ;; left-facing      
      "( ▼∀▼)" ;; right-facing
      "( >▼∀▼)>" ;; right-moving
      "<(▼∀▼< )"));; left-moving

    (chaotic

     (normie
      "(▼皿▼)" ;; forward
      "(▼皿▼｡ )" ;; left-facing
      "( ｡▼皿▼)" ;; right-facing
      "(- ｡▼皿▼)-" ;; right-moving
      "-(▼皿▼｡ -)");; left-moving

     (active
      "(Φ‿Φ)" ;; forward	
      "(Φ‿Φ )" ;; left-facing	
      "( Φ‿Φ)" ;; right-facing	
      "Ψ( ;Φ‿Φ)_↑" ;; right-moving	
      "↑_(Φ‿Φ;)Ψ");; left-moving

     (funny
      "(*Φ ω Φ*)" ;; forward
      "(*Φ ω Φ* )" ;; left-facing
      "( *Φ ω Φ*)" ;; right-facing
      "(∿*Φ ω Φ*)∿" ;; right-moving
      "∿(*Φ ω Φ*∿)") ;; left-moving

     (loud
      "(｀▽´)" ;; forward
      "(｀▽´ )" ;; left-facing
      "( ｀▽´)" ;; right-facing
      "(o ｀▽´ )oΨ" ;; right-moving
      "Ψo(｀▽´ o)"))));; left-moving
          





(defun pet-movement (pet-gfx)

  (let ((rng-move (random 5)))

    (cond ((and (= 3 rng-move) (> movement 0)) (decf movement))
	  ((and (= 4 rng-move) (< movement 9)) (incf movement)))

    (print
     (concat
      (substring "         " movement)
      (nth rng-move pet-gfx))
     (get-buffer "*scratch*"))))


(defun egg-life ()
  (set-buffer "*scratch*")
  (erase-buffer)
  ;; calculate proper pet evolution function
  (pet-movement +egg-data+))

(defun egg-loop ()
  (run-with-timer 0.2 0.2 'egg-life))


(defun hello-world ()
  (princ "hello" (get-buffer "*scratch*")))

(run-at-time 1 nil 'hello-world)

(random 2)

;;-------------------------------------
;; testing keyboard events
;;-------------------------------------

(defun uwu-emacs-feed ()
  "print 'feed'"
  (interactive)
  (message "feed"))

;;-------------------------------------
;; keybindings
;;-------------------------------------

(defvar uwu-emacs-map nil "Keymap for 'uwu-emacs-mode'")

(progn
  (setq uwu-emacs-map (make-sparse-keymap))

  (define-key uwu-emacs-map (kbd "f") 'uwu-emacs-feed))

;;-------------------------------------
;; define the mode
;;-------------------------------------

(define-derived-mode uwu-emacs special-mode "uwu")
