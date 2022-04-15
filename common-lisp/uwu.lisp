;;; Here we load the libraries that we need in order to make drawing
;;; the screen possible. This library I am using is a foreign function
;;; interface (FFI) to the UNIX ncurses terminal library. It enables
;;; us to have non-blocking input into the terminal, so that we can
;;; press whatever key we want, to interrupt the execution of the
;;; code. This provides for a more seamless experience.

(ql:quickload :croatoan)
(require :croatoan)

#|

************
* GRAPHICS *
************

|#

(defparameter *egg-data*
  (list
   "."
   "｡"
   "ₒ"
   "o"
   "O"))

;;; o O °ﾟº Ó Õ Ø ô Ơ ơ Өө₀.

(defparameter *babby-data*
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


(defparameter *child-data*
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

(defparameter *teen-data*
  '((lawful

    (normie
     (data
      (name "uwu-tan")
      (neglect-max 0))
     (gfx
      "(u w u)" ;; forward      
      "(u w u )" ;; left-facing      
      "( u w u)" ;; right-facing      
      "(> u w u)>" ;; right-moving      
      "<( u w u <)")) ;; left-moving
     
    (active
     (data
      (name "owo-tan")
      (neglect-max 3))
     (gfx
      "(o w o)" ;; forward      
      "(o w o )" ;; left-facing      
      "( o w o)" ;; right-facing      
      "(> o w o)>" ;; right-moving
      "<( o w o <)")) ;; left-moving
    
     
    (funny
     (data
      (name "kirei-tan")
      (neglect-max 0))
     (gfx
      "(•˘v˘•)" ;; forward      
      "(•˘v˘n )" ;; left-facing      
      "( ˘v˘•)" ;; right-facing      
      "(n˘v˘•)¬" ;; right-moving      
      "~(•˘v˘n)")) ;; left-moving
    
    (loud
     (data
      (name "kagayaku-tan")
      (neglect-max 2))
     (gfx
      
      "( *°▽°* )" ;; forward
      "(*°▽°* )" ;; left-facing      
      "( *°▽°*)" ;; right-facing      
      "(>*°▽°*)>" ;; right-moving      
      "<(*°▽°*<)")) ;; left-moving
    
    (chaotic
     
     (normie
      (data
       (name "henna-tan")       
       (neglect-max 1))      
      (gfx       
       "(>.<)" ;; forward       
       "(<.<)" ;; left-facing       
       "(>.>)" ;; right-facing       
       "(>.>)//" ;; right-moving       
       "\\(<.<)")) ;; left-moving     

     (active
      (data
       (name "hadena-tan")       
       (neglect-max 3))      
      (gfx       
       " (•̀_•́)" ;; forward       
       " (•̀_•́ )" ;; left-facing       
       " ( •̀_•́)" ;; right-facing       
       " (ง •̀_•́)ง" ;; right-moving       
       " ლ(•̀_•́ლ)")) ;; left-moving     
     
     (funny
      (data
       (name "derp-tan")       
       (neglect-max 2))      
      (gfx
       " ¯\(°_o)/¯" ;; forward       
       "(°_o )" ;; left-facing       
       "( o_°)" ;; right-facing       
       " (/¯o_°)/¯" ;; right-moving       
       " ¯\(°_o¯\)")) ;; left-moving     
     
     (loud
      (data
       (name "gekido-tan")       
       (neglect-max 3))      
      (gfx       
       "(°□°)" ;; forward       
       "(°□° )" ;; left-facing       
       "( °□°)" ;; right-facing       
       "(╯°□°)╯" ;; right-moving       
       "╰(°□°╰)")))))) ;; left-moving
  
#|

((lawful                     <- CAR will select only 'lawful' fields
  (skill-alignment
   (species
    (data
     (data-field 1)
     (data field ...))
    (gfx "gfx-fields"))))

 (chaotic                  <- CDR will select only 'chaotic' fields
  (skill alignment
   (species
    (data
     (data-field 1)
     (data-field ...))
    (gfx "field")))))
|#

(defparameter *adult-data*
  '((lawful   ;; <- CAR selects lawful fields
    
    (smart     ;; <- CADAR selects lawful smart fields
           
     (normie      
      (data       
       (name "yoshoku-tan")       
       (max-age 15)       
       (min-skill 50)       
       (max-neglect nil))      
      (gfx       
       "(´◡‿|◡`)" ;; forward       
       "(´◡/‿◡` )" ;; left-facing       
       "( ´◡‿\◡`)" ;; right-facing       
       "(>´◡‿\◡`)>" ;; right-moving       
       "<(´◡/‿◡`<)"));; left-moving     
     
     
     (active
      (data
       (name "lenny-tan")       
       (max-age 20)       
       (min-skill 100)       
       (max-neglect 40))      
      (gfx       
       "(° ͜ʖ °)" ;; forward       
       "(° c͜ ° )" ;; left-facing       
       "( ° ͜ʖ °)" ;; right-facing       
       "(☞ ° ͜ʖ °)☞" ;; right-moving       
       "☜( ° c͜ °☜)"));; left-moving
     
     
     (funny
      (data
       (name "otaku-tan")       
       (max-age 10)       
       (min-skill 25)       
       (max-neglect nil))      
      (gfx       
       "(๑ÒωÓ๑)" ;; forward       
       "(๑ÒωÓ๑ )" ;; left-facing       
       "( ๑ÒωÓ๑)" ;; right-facing       
       "( >๑ÒωÓ๑)>" ;; right-moving       
       "<(๑ÒωÓ๑< )"));; left-moving
     
     
     (loud
      (data
       (name "shittakaburi-tan")       
       (max-age 5)       
       (min-skill 12)       
       (max-neglect nil))      
     (gfx
      "(▼∀▼)" ;; forward
      "(▼∀▼ )" ;; left-facing      
      "( ▼∀▼)" ;; right-facing
      "( >▼∀▼)>" ;; right-moving
      "<(▼∀▼< )")));; left-moving
     
    (creative
     (normie
      (data       
       (name "saru-tan")       
       (max-age 10)       
       (min-skill 25)       
       (max-neglect nil))      
      (gfx       
       "@(･ω･)@" ;; forward       
       "@(･ω･o )@" ;; left-facing       
       "@( o･ω･)@" ;; right-facing       
       "@( >o･ω･)@>" ;; right-moving       
       "<@(･ω･o< )@"));; left-moving
     
     
     (active
      (data       
       (name "ureshii-tan")       
       (max-age 5)       
       (min-skill 12)       
       (max-neglect nil))      
      (gfx       
       "(ˆ⌣ˆ)" ;; forward       
       "(ˆ⌣ˆc)" ;; left-facing       
       "(ↄˆ⌣ˆ)" ;; right-facing       
       "(>ↄˆ⌣ˆ)>" ;; right-moving       
       "<(ˆ⌣ˆc<)"));; left-moving
          
     (funny
      (data       
       (name "shifuku-tan")       
       (max-age 20)       
       (min-skill 50)       
       (max-neglect nil))      
      (gfx
       "(≧∀≦)" ;; forward       
       "(≧∀≦ )" ;; left-facing       
       "( ≧∀≦)" ;; right-facing       
       "(/≧∀≦)/" ;; right-moving       
       "\(≧∀≦\)"));; left-moving
          
     (loud
      (data
       (name "miotosu-tan")       
       (max-age 30)       
       (min-skill 100)
       (max-neglect 72))
      (gfx       
       "(。々°)" ;; forward       
       "(。々° )" ;; left-facing       
       "( 。々°)" ;; right-facing       
       "(> 。々°)>" ;; right-moving       
       "<(。々° <)")));; left-moving
    
    
    (social
     
     (normie
      (data
       (name "yorokobi-tan")       
       (max-age 30)       
       (min-skill 100)       
      (max-neglect nil))
      (gfx       
       "(◕ヮ◕)" ;; forward       
       "(◕ヮ◕ )" ;; left-facing       
       "( ◕ヮ◕)" ;; right-facing       
       "(/◕ヮ◕)/" ;; right-moving
       "\(◕ヮ◕\)"));; left-moving
      
     (active
      (data       
       (name "keihaku-tan")
       (max-age 60)              
       (min-skill 200)       
       (max-neglect 144))
      (gfx       
       "(•̀◡•́)"	     ;; forward
       "✧(-◡•́｡)"     ;; left-facing
       "(｡•̀◡-)✧"     ;; right-facing
       "(> ｡•̀◡-)>✧"  ;; right-moving
       "✧<(-◡•́｡ <)")) ;; left-moving
     
     (funny
      (data
       (name "inu-tan")
       (max-age 20)
       (min-skill 50)
       (max-neglect nil))
      (gfx
       "(●ᴥ●)"	   ;; forward
       "(●ᴥ● )"	   ;; left-facing
       "( ●ᴥ●)"	   ;; right-facing
       "(> ●ᴥ●)>"  ;; right-moving
       "<(●ᴥ● <)")) ;; left-moving
     
     (loud
      (data
      (name "waria-tan")
      (max-age 20)
      (min-skill 50)
      (max-neglect nil))
     (gfx
      "(≧∇≦)" ;; forward
      "(≧∇≦ )" ;; left-facing
      "( ≧∇≦)" ;; right-facing
      "(~ ≧∇≦)~" ;; right-moving
      "~(≧∇≦ ~)"))));; left-moving
    
   (chaotic
    (smart
     
     (normie
      (data
      (name "kabuto-chan")
      (max-age 20)
      (min-skill 100))
     (gfx
      "(▼皿▼)" ;; forward
      "(▼皿▼｡ )" ;; left-facing
      "( ｡▼皿▼)" ;; right-facing
      "(- ｡▼皿▼)-" ;; right-moving
      "-(▼皿▼｡ -)"));; left-moving

     (active
      (data
      (name "hashiru-chan")
      (max-age 15)
      (min-skill 50))
     (gfx
      "(ʘ∀ʘ)" ;; forward
      "(๑ʘ∀ʘ )" ;; left-facing
      "( ๑ʘ∀ʘ)" ;; right-facing
      "ε=┌(๑ʘ∀ʘ)┘" ;; right-moving
      "┗(ʘ∀ʘ๑)┐┘=3"));; left-moving
    
     (funny
      (data
      (name "fukou-chan")
      (max-age 5)
      (min-skill 12))
     (gfx
      "(´□｀)" ;; forward
      "(´□｀ )" ;; left-facing
      "( ´□｀)" ;; right-facing
      "(┘´□｀)┘" ;; right-moving
      "L(´□｀L)"));; left-moving
   
     (loud
      (data
      (name "noroi-chan")
      (max-age 20)
      (min-skill 100))
     (gfx
      "(｀▽´)" ;; forward
      "(｀▽´ )" ;; left-facing
      "( ｀▽´)" ;; right-facing
      "(o ｀▽´ )oΨ" ;; right-moving
      "Ψo(｀▽´ o)")));; left-moving
  
    (creative
     (normie
      (data
      (name "neko-chan")
      (max-age 30)
      (min-skill 100))
     (gfx
      "(*Φ ω Φ*)" ;; forward
      "(*Φ ω Φ* )" ;; left-facing
      "( *Φ ω Φ*)" ;; right-facing
      "(∿*Φ ω Φ*)∿" ;; right-moving
      "∿(*Φ ω Φ*∿)"));; left-moving
    
     (active
      (data
      (name "osu-chan")
      (max-age 30)
      (min-skill 100))
     (gfx
      "(ì_í)" ;; forward
      "(ì_í )" ;; left-facing
      "( ì_í)" ;; right-facing
      "(ó ì_í)=ó" ;; right-moving
      "ò=(ì_í ò)"));; left-moving
     
     (funny
      (data
      (name "yotta-chan")
      (max-age 5)
      (min-skill 12))
     (gfx
      "(⊙_◎)" ;; forward
      "(⊙_◎ )" ;; left-facing
      "( ⊙_◎)" ;; right-facing
      "(> ⊙_◎)>" ;; right-moving
      "<(⊙_◎ <)"));; left-moving

     (loud
      (data
      (name "osoroshii-tan")
      (max-age 15)
      (min-skill 50))
     (gfx
      "(ﾟ Д ﾟ)" ;; forward
      "(ﾟ Д ﾟ )" ;; left-facing
      "( ﾟ Д ﾟ)" ;; right-facing
      "(> ﾟ Д ﾟ)>" ;; right-moving
      "<(ﾟ Д ﾟ <)")));; left-moving

     (social
      

      (normie
       (data	
	(name "kakkoii-chan")	
	(max-age 30)	
	(min-skill 100))       
       (gfx	
	"(⌐■_■¬)" ;; forward	
	"(■_■¬ )" ;; left-facing	
	"( ⌐■_■)" ;; right-facing	
	"(>⌐■_■)>" ;; right-moving	
	"<(■_■¬<)"));; left-moving
      

      (active       
       (data	
	(name "akuma-chan")	
	(max-age 60)	
	(min-skill 200))       
       (gfx	
	"(Φ‿Φ)" ;; forward	
	"(Φ‿Φ )" ;; left-facing	
	"( Φ‿Φ)" ;; right-facing	
	"Ψ( ;Φ‿Φ)_↑" ;; right-moving	
	"↑_(Φ‿Φ;)Ψ"));; left-moving
      


      (funny       
       (data	
	(name "dorobo-chan")	
	(max-age 30)	
	(min-skill 100)	
	(max-neglect 100))       
       (gfx	
	"('ڡ')" ;; forward	
	"('ڡ' )" ;; left-facing	
	"( 'ڡ')" ;; right-facing	
	"(ง 'ڡ')ง" ;; right-moving	
	"ლ('ڡ'ლ)"));; left-moving
      
      (loud       
       (data	
	(name "sakebu-chan")	
	(max-age 30)	
	(min-skill 100))       
       (gfx	
	"＼(´◓ Д ◔)／" ;; forward	
	"(´◓ Д ◔ )" ;; left-facing	
	"( ´◔ Д ◓)" ;; right-facing	
	"(／ ´◔ Д ◓)／" ;; right-moving	
	"＼(´◓ Д ◔ ＼)")))))) ;; left-moving
 
   #|
					
   poop:				
   cξ~~					
					
					
   sleeping animations:			
   (ー。ー) zzz				; ; ;
					; ; ;
   ★☽(。￣-￣)				; ; ;
					; ; ;
   (ﾉ△･｡)				; ; ;
					; ; ;
   (_ _)..ooOO				; ; ;
					; ; ;
   secret pet evolution characters:	; ; ;
					; ; ;
   (⁎ ⁍̴̛ᴗ⁍̴̛ ⁎)				; ; ;
   |#

;;; *********************************
;;; ** DEFINITION OF THE CONSTANTS **
;;; *********************************

(defconstant +five-minutes+ (* 5 60))
(defconstant +fifteen-minutes+ (* 15 60))
(defconstant +one-hour+ (* 60 60))
(defconstant +one-day+ (* 24 +one-hour+))

;;; *********************************
;;; ** DEFINITION OF THE VARIABLES **
;;; *********************************

;;; Here we define the global variables. Each of the variables which
;;; keep track of your pet's state range from 0 to 5.

;;; This is the happiness state. When it reaches zero, the pet is
;;; fully upset, and at maximum displeasure, and is the opposite of
;;; happy with you.

;;; When the happines state reaches zero, the programme will trigger
;;; an alert (*attention-required*) to the user.

(defparameter *happiness* 5)
(defparameter *happiness-secret* 2)

;;; This variable is the amount of hunger that the pet is
;;; experiencing.  When the value reaches zero, the pet is absolutely
;;; famished. When it reaches this value, the happiness of your pet
;;; starts to decrease.

;;; When the hunger state reaches zero, the programme will trigger an
;;; alert (*attention-required*) to the user.

(defparameter *hunger* 5)
(defparameter *hunger-secret 2)

;;; This is the poop state variable. This ranges from 0 to 4.

;;; When this variable reaches 4, an alert (*attention-required*) will
;;; be triggered to the user.

(defparameter *poop* 0)

;;; This is the variable that keeps track of the pet's "need for
;;; attention". When either, or both of the happiness and hunger
;;; meters reaches zero, this will trigger this variable to become
;;; 'T'. This will also let out a sound to let the user know that the
;;; pet is 'crying' or 'singing out' for attention because it is
;;; hungry or sad, etc.

;;; The user will have 15 minutes to respond to the pet, otherwise the
;;; pet will accrue a 'neglect point'. This will have an effect on the
;;; kind of emoticon that the pet will evolve into.

(defparameter *attention-required* nil)

;;; This keeps track of how many times the user has failed to respond
;;; within 15 minutes to the pet's demand for attention. This has a
;;; direct effect on what kind of character the pet will eventually be
;;; able to evolve into. This counter variable will not be visible to
;;; the user.

;;; Neglect points are not reset after an evolution: they keep track
;;; of the overall history of your pet, throughout its life.

(defparameter *neglect-points* 0)

;;; This is the sickness state variable. It keeps track of whether the
;;; pet is ill. I can be either T or NIL. Same as above---failing to
;;; cure a pet's sickness within 15 minutes of being alerted results
;;; in a neglect point.

(defparameter *ill* nil)

;;; This variable keeps track of where the pet is in its life
;;; cycle. The states which this variable can be are: (i) egg; (ii)
;;; baby; (iii) child; (iv) teen; (v) adult; (vi) elder; or (vii)
;;; special. Special corresponds to a 'secret' pet evolution that the
;;; player can achieve if they take very good care of their pet.

(defparameter *life-cycle* 'egg)

;;; This variable keeps track of how old the pet is overall, in days.

(defparameter *age-global* 0)

;;; This variable keeps track of how long a pet has been in its
;;; current state of evolution.

(defparameter *age-current-evolution* 0)

;;; These three variables keep track of the number of wins you have
;;; made in the respective minigames. Over the lifespan of the pet
;;; from childhood to the end of the pet's teenage life, the relative
;;; magnitude of each of these variables, compared to the others,
;;; determines whether your pet will become a particular evolution.

;;; There are, however, for some evolutions, a minimum number of skill
;;; points required to achieve that evolution. Otherwise, the pet will
;;; default to the next highest skill to determine its evolution.

(defparameter *skill-smart* 0)
(defparameter *skill-creative* 0)
(defparameter *skill-social* 0)

;;; *************************
;;; ** AUXILIARY VARIABLES **
;;; *************************

;;; This global variable below keeps track of the state of the
;;; keyboard. When a key is pressed, the value is stored in to this
;;; variable.

(defparameter *keypress* nil)

;;; This variable below is the frame counter. It keeps track of which
;;; frame of pet animation we are in. There are, at the moment, 5
;;; different frames of animation, which are the pet facing: forwards,
;;; left, right, and looking left and right.

(defparameter *frame-counter* 0)

;;; This variable below keeps track of the previous position of the
;;; pet as it moves left and right, back and forwards across the
;;; screen.

(defparameter *movement* 0)

;;; This variable below stores the value of where the pet is going to
;;; move _next_. It is compared to the variable *movement* above, in
;;; order to work out which way the pet is facing as it
;;; moves. According to common sense, if someone was going to move
;;; left, they would, of course, start facing left, etc.

(defparameter *rng-move* 0)

;;; This variable keeps track of the list of animation frames that
;;; display what emotion and mode your pet is in, uwu.

(defparameter *pet-appearance* *egg-gfx*)

;;; ******************************************************************************
;;; *                                   GAME CODE                                *
;;; ******************************************************************************

;;; This is a simple utility function that enables me to clear the
;;; screen so that a new frame of animation can be drawn.

(defun clear-emacs-buffer ()
  (swank:eval-in-emacs
   '(progn
         (run-at-time 0 nil 'slime-repl-clear-buffer)
         nil)))

;;; <><><><><><><><><><><>
;;;       MAIN LOOPS
;;; <><><><><><><><><><><>

(defun egg-loop ()
  (loop
     
  
  (croatoan:with-screen (scr :input-echoing nil
			     :input-buffering nil
			     :input-blocking 100
			     :cursor-visible nil
			     :enable-colors nil
			     )
    (setf *rng-move* (random 5))
    (cond ((and (= 3 *rng-move*) (> *movement* 0)) (decf *movement*))
	  ((and (= 4 *rng-move*) (< *movement* 9)) (incf *movement*)))
    (format t
	    (apply #'concatenate 'string
		   (list
		    (subseq "         " *movement*)
		    (nth *rng-move* *egg-data*))) #\return))))

(defun babby-loop ()
  )

(defun child-loop ()
  )

(defun teen-loop ()
  )

(defun adult-loop ()
  )

#|

<><><><><><><><><><><><>
  INITIALISE THE GAME
<><><><><><><><><><><><>

|#

(defun uwu-init ()

  (clear-emacs-buffer)
  (setf *pet-appearance* *egg-data*))

;;; This, below, is a simple little function that (i) clears the
;;; screen, and then (ii) draws the screen. Here it is executed for
;;; the first time, under the init function.
  
  (defun idle-state ()

    (clear-emacs-buffer)
    (draw-screen-idle *hunger* *entertainment*))

;;; Now, this, immediately below, is a fairly complex line. Here we
;;; are, evaluating from right to left: (i) creating a timer object
;;; out of the idle-state function, which we are giving the same name
;;; as the original function; then (ii) storing that object into
;;; memory as a variable.
  
  (setq *idle-state* (make-timer #'idle-state :name 'idle-state))

;;; And we did that because then we can schedule and unschedule the
;;; execution of the idle-state function using the 'schedule-timer'
;;; and 'unschedule-timer' functions. If we wanted the idle-state
;;; function to continue running forever, uninterrupted, then we would
;;; not have to bother separating out the above expression from the
;;; one below.
  
  (schedule-timer *idle-state* 1 :repeat-interval 1)

;;; Initialise the hunger variable. Here we are doing the same thing
;;; as before, even though I anticipate this little scheduled function
;;; not to need to be halted and restarted that often. I suppose what
;;; I am doing here is trying to make my life easier, if I decide to
;;; allow the user to put their pet in 'holiday mode' or some such.

  (setq *increase-hunger* (make-timer #'increase-hunger :name 'increase-hunger))

  (schedule-timer *increase-hunger* 5 :repeat-interval 5))



;;; <><><><><><><><><><><><><>
;;;    READING USER INPUT
;;; <><><><><><><><><><><><><>

#|

Write the comments for the keypressing function here.

|#

(defun read-keys ()
  (croatoan:with-screen (scr :input-echoing nil
			     :input-buffering nil
			     :input-blocking 100
			     :cursor-visible nil
			     :enable-colors nil
			     )
    
    (croatoan:event-case (scr event)

      (#\f
       (setf *keypress* 'feed)
       (return-from croatoan:event-case))

      (#\t
       (setf *keypress* 'toy)
       (return-from croatoan:event-case))

      (#\m
       (setf *keypress* 'menu)
       (return-from croatoan:event-case))
      
      ((nil)
       (setf *keypress* nil)
       (return-from croatoan:event-case))

      (otherwise
       (setf *keypress* nil)
       (return-from croatoan:event-case))

      )))
  
#|
<><><><><><><>
  GAME LOGIC
<><><><><><><>
|#

(defun comprehend-input (key-input)
  (cond ((equal 'feed key-input) (feed))
	((equal 'toy key-input) (setf *enterainment* (+ *entertainment* 10)))
	((equal 'menu key-input) ()
		)))

(defun process-state ()

  (cond
    ((equal 'normal *state*)
     (cond ((> *hunger* 90) (setf *pet-appearance* birb-face))
	   ((> *hunger* 80)(setf *pet-appearance* owo-gfx))
	   ((> *hunger* 50)(setf *pet-appearance* uwu-gfx))
	   ((> *hunger* 40)(setf *pet-appearance* shocked-gfx))
	   ((> *hunger* 20)(setf *pet-appearance* run-away-gfx))))))
  
(defun increase-hunger ()
  (setf *hunger* (+ *hunger* 5))
  )

(defun feed ()
  (setf *hunger* 0))




    

#|
<><><><><><><><><><><>
  DRAWING THE SCREEN
<><><><><><><><><><><>
|#

(defun draw-screen-idle (hunger entertainment)

 
  (croatoan:with-screen (scr :input-echoing nil
			     :input-buffering nil
			     :input-blocking 100
			     :cursor-visible nil
			     :enable-colors nil
			     )
    (setf *rng-move* (random 5))
    (cond ((and (= 3 *rng-move*) (> *movement* 0)) (decf *movement*))
	  ((and (= 4 *rng-move*) (< *movement* 9)) (incf *movement*)))
    (format t
	    (apply #'concatenate 'string
		   (list
		    (subseq "         " *movement*)
		    (nth *rng-move* *pet-appearance*))) #\return)
    (print *hunger*)
    (print *movement*)
    ))



