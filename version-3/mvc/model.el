
;; ╔╦╗╔═╗╔╦╗╔═╗╦  
;; ║║║║ ║ ║║║╣ ║  
;; ╩ ╩╚═╝═╩╝╚═╝╩═╝

;; ┌─┐┌─┐┌┐┌┌─┐┌┬┐┌─┐┌┐┌┌┬┐┌─┐
;; │  │ ││││└─┐ │ ├─┤│││ │ └─┐
;; └─┘└─┘┘└┘└─┘ ┴ ┴ ┴┘└┘ ┴ └─┘

(defconst +five-minutes+ (* 5 60))
(defconst +fifteen-minutes+ (* 15 60))
(defconst +twenty-minutes+ (* 20 60))
(defconst +thirty-minutes+ (* 30 60))
(defconst +one-hour+ (* 60 60))
(defconst +one-day+ (* 24 +one-hour+))

;; ┬  ┬┌─┐┬─┐┬┌─┐┌┐ ┬  ┌─┐┌─┐
;; └┐┌┘├─┤├┬┘│├─┤├┴┐│  ├┤ └─┐
;;  └┘ ┴ ┴┴└─┴┴ ┴└─┘┴─┘└─┘└─┘

(defvar *total-points* 0)
(defvar *hearts* 4.0) ; this decreases with neglect
(defvar *hungry* 0) ; this increases with hunger
(defvar *toilet* 0) ; this increases with more poops
(defvar *asleep* nil)
(defvar *lights* nil)
(defvar *attention* nil)
(defvar *neglect* 0)

;; ┌─┐┬─┐┌─┐┌─┐┬ ┬┬┌─┐┌─┐
;; │ ┬├┬┘├─┤├─┘├─┤││  └─┐
;; └─┘┴└─┴ ┴┴  ┴ ┴┴└─┘└─┘

;; As the pet ages, it will evolve. The pet will move through the
;; following life-cycle stages:
;;
;; 1. EGG
;;
;; 2. BABBY
;;    - chaotic
;;    - lawful
;;
;; 3. CHILD
;;    - loud
;;    - normie
;;    - funny
;;    - active
;;
;; 4. TEEN
;;    - chaotic
;;        . loud
;;        . normie
;;        . funny
;;        . active
;;    - lawful
;;        . loud
;;        . normie
;;        . funny
;;        . active
;;
;; 5. ADULT
;;    - chaotic
;;        . loud
;;            ~ social
;;            ~ smart
;;            ~ creative
;;        . normie
;;            ~ social
;;            ~ ...
;;        . funny
;;        . active
;;    - lawful
;;        . loud
;;        . normie
;;        . funny
;;        . active

;; ##################################################################
;; #                             * EGG                              #
;; ##################################################################

;; * one option possible

(defconst +egg+
  (list
   '(gfx
     "."
     "｡"
     "ₒ"
     "o"
     "O")
   '(name "egge")))


;; ##################################################################
;; #                             * BABBY                            #
;; ##################################################################

;; * two options possible

;; ** chaotic

(defconst +babby-chaotic+ 
  (list
   '(gfx
     "( .◎. )" ;; forward
     "(｡◎｡  )" ;; left-facing
     "(  ｡◎｡)" ;; right-facing
     "(_ ｡◎｡)_" ;; right-moving
     "_(｡◎｡ _)") ;; left-moving
   '(name "chaotic babby")))

;; ** lawful

(defconst +babby-lawful+
  (list
   '(gfx
     "~:0" ;; forward
     "o:~" ;; left-facing
     "~:o" ;; right-facing
     "~:v" ;; right-moving
     "c:~") ;; left-moving
     '(name "lawful babby")))

;; ##################################################################
;; #                             * CHILD                            #
;; ##################################################################

;; * four options possible

;; ** loud

(defconst +child-loud+
  (list
   '(gfx
     "(＾▽＾)"
     "(＾▽＾ )"
     "( ＾▽＾)"
     "(>＾▽＾)>"
     "<(＾▽＾<)")
   '(name "loud child")))

;; ** normie

(defconst +child-normie+
  (list
   '(gfx
     "(✿^‿^✿)"
     "(^‿^✿ )"
     "( ✿^‿^)"
     "(>✿^‿^)>"
     "<(^‿^✿<)")
   '(name "normie child")))

;; ** funny

(defconst +child-funny+
  (list
   '(gfx
     "( 。v ° )"
     "(。v ° )☆"
     "☆( 。v °)"
     "☆( >。v °)>"
     "<(。v °< )☆")
   '(name "funny child")))

;; ** active

(defconst +child-active+
  (list
   '(gfx
     "( o v o )"
     "(o v o )"
     "( o v o)"
     "( ┘o v o)┘"
     "┌(o v o┌ )")
   '(name "active child")))

;; ##################################################################
;; #                             * TEEN                             #
;; ##################################################################

;; * eight options possible

;; ** chaotic
;; *** loud

(defconst +teen-chaotic-loud+ 
  (list
   '(gfx
       "(°□°)" ;; forward       
       "(°□° )" ;; left-facing       
       "( °□°)" ;; right-facing       
       "(╯°□°)╯" ;; right-moving       
       "╰(°□°╰)") ;; left-moving
   '(name "gekido")))

;; *** normie

(defconst +teen-chaotic-normie+
  (list
   '(gfx
       "(>.<)" ;; forward       
       "(<.<)" ;; left-facing       
       "(>.>)" ;; right-facing       
       "(>.>)//" ;; right-moving       
       "\\(<.<)") ;; left-moving
   '(name "henna")))

;; *** funny

(defconst +teen-chaotic-funny+
  (list
   '(gfx
       " ¯\(°_o)/¯" ;; forward       
       "(°_o )" ;; left-facing       
       "( o_°)" ;; right-facing       
       " (/¯o_°)/¯" ;; right-moving       
       " ¯\(°_o¯\)") ;; left-moving
   '(name "derp")))

;; *** active

(defconst +teen-chaotic-active+
  (list
   '(gfx
       " (•̀_•́)" ;; forward       
       " (•̀_•́ )" ;; left-facing       
       " ( •̀_•́)" ;; right-facing       
       " (ง •̀_•́)ง" ;; right-moving       
       " ლ(•̀_•́ლ)") ;; left-moving
   '(name "hadena")))

;; ** lawful

;; *** loud

(defconst +teen-lawful-loud+
  (list
   '(gfx
      "( *°▽°* )" ;; forward
      "(*°▽°* )" ;; left-facing      
      "( *°▽°*)" ;; right-facing      
      "(>*°▽°*)>" ;; right-moving      
      "<(*°▽°*<)") ;; left-moving
   '(name "kagayaku")))

;; *** normie

(defconst +teen-lawful-normie+
  (list
   '(gfx
      "(u w u)" ;; forward      
      "(u w u )" ;; left-facing      
      "( u w u)" ;; right-facing      
      "(> u w u)>" ;; right-moving      
      "<( u w u <)") ;; left-moving
   '(name "uwu")))

;;; *** funny

(defconst +teen-lawful-funny+
  (list
   '(gfx
      "(•˘v˘•)" ;; forward      
      "(•˘v˘n )" ;; left-facing      
      "( ˘v˘•)" ;; right-facing      
      "(n˘v˘•)¬" ;; right-moving      
      "~(•˘v˘n)") ;; left-moving
   '(name "kirei")))

;; *** active

(defconst +teen-lawful-active+
  (list
   '(gfx
      "(o w o)" ;; forward      
      "(o w o )" ;; left-facing      
      "( o w o)" ;; right-facing      
      "(> o w o)>" ;; right-moving
      "<( o w o <)") ;; left-moving
   '(name "owo")))

;; ##################################################################
;; #                             * ADULT                            #
;; ##################################################################

;; ** chaotic
;; *** loud
;; **** social

(defconst +adult-chaotic-loud-social+ 
  (list
   '(gfx  
	"＼(´◓ Д ◔)／" ;; forward	
	"(´◓ Д ◔ )" ;; left-facing	
	"( ´◔ Д ◓)" ;; right-facing	
	"(／ ´◔ Д ◓)／" ;; right-moving	
	"＼(´◓ Д ◔ ＼)") ;; left-moving
   '(name "sakebu")))

;; **** smart

(defconst +adult-chaotic-loud-smart+	  
  (list
   '(gfx
     "(｀▽´)" ;; forward
      "(｀▽´ )" ;; left-facing
      "( ｀▽´)" ;; right-facing
      "(o ｀▽´ )oΨ" ;; right-moving
      "Ψo(｀▽´ o)");; left-moving
   '(name "noroi")))

;; **** creative

(defconst +adult-chaotic-loud-creative+
  (list
   '(gfx
      "(ﾟ Д ﾟ)" ;; forward
      "(ﾟ Д ﾟ )" ;; left-facing
      "( ﾟ Д ﾟ)" ;; right-facing
      "(> ﾟ Д ﾟ)>" ;; right-moving
      "<(ﾟ Д ﾟ <)");; left-moving
   '(name "osoroshii")))

;; *** normie
;; **** social

(defconst +adult-chaotic-normie-social+
  (list
   '(gfx
	"(⌐■_■¬)" ;; forward	
	"(■_■¬ )" ;; left-facing	
	"( ⌐■_■)" ;; right-facing	
	"(>⌐■_■)>" ;; right-moving	
	"<(■_■¬<)");; left-moving
   '(name "kakkoii")))

;; **** smart

(defconst +adult-chaotic-normie-smart+
  (list
   '(gfx
      "(▼皿▼)" ;; forward
      "(▼皿▼｡ )" ;; left-facing
      "( ｡▼皿▼)" ;; right-facing
      "(- ｡▼皿▼)-" ;; right-moving
      "-(▼皿▼｡ -)");; left-moving
   '(name "kabuto")))

;; **** creative

(defconst +adult-chaotic-normie-creative+
  (list
   '(gfx
      "(*Φ ω Φ*)" ;; forward
      "(*Φ ω Φ* )" ;; left-facing
      "( *Φ ω Φ*)" ;; right-facing
      "(∿*Φ ω Φ*)∿" ;; right-moving
      "∿(*Φ ω Φ*∿)");; left-moving
   '(name "neko")))

;; *** funny
;; **** social

(defconst +adult-chaotic-funny-social+
  (list
   '(gfx
     "('ڡ')" ;; forward
     "('ڡ' )" ;; left-facing
     "( 'ڡ')" ;; right-facing
     "(ง 'ڡ')ง" ;; right-moving
     "ლ('ڡ'ლ)");; left-moving
   '(name "dorobo")))

;; **** smart

(defconst +adult-chaotic-funny-smart+
  (list
   '(gfx
      "(｀▽´)" ;; forward
      "(｀▽´ )" ;; left-facing
      "( ｀▽´)" ;; right-facing
      "(o ｀▽´ )oΨ" ;; right-moving
      "Ψo(｀▽´ o)");; left-moving
   '(name "noroi")))

;; **** creative

(defconst +adult-chaotic-funny-creative+
  (list
   '(gfx
     "(⊙_◎)" ;; forward
      "(⊙_◎ )" ;; left-facing
      "( ⊙_◎)" ;; right-facing
      "(> ⊙_◎)>" ;; right-moving
      "<(⊙_◎ <)");; left-moving
   '(name "yotta")))

;; *** active
;; **** social

(defconst +adult-chaotic-active-social+
  (list
   '(gfx
     	"(Φ‿Φ)" ;; forward	
	"(Φ‿Φ )" ;; left-facing	
	"( Φ‿Φ)" ;; right-facing	
	"Ψ( ;Φ‿Φ)_↑" ;; right-moving	
	"↑_(Φ‿Φ;)Ψ");; left-moving
   '(name "akuma")))

;; **** smart

(defconst +adult-chaotic-active-smart+
  (list
   '(gfx
      "(ʘ∀ʘ)" ;; forward
      "(๑ʘ∀ʘ )" ;; left-facing
      "( ๑ʘ∀ʘ)" ;; right-facing
      "ε=┌(๑ʘ∀ʘ)┘" ;; right-moving
      "┗(ʘ∀ʘ๑)┐┘=3");; left-moving
   '(name "hashiru")))

;; **** creative

(defconst +adult-chaotic-active-creative+
  (list
   '(gfx
      "(ì_í)" ;; forward
      "(ì_í )" ;; left-facing
      "( ì_í)" ;; right-facing
      "(ó ì_í)=ó" ;; right-moving
      "ò=(ì_í ò)");; left-moving
   '(name "osu")))

;; ** lawful
;; *** loud
;; **** social

(defconst +adult-lawful-loud-social+
  (list
   '(gfx
      "(≧∇≦)" ;; forward
      "(≧∇≦ )" ;; left-facing
      "( ≧∇≦)" ;; right-facing
      "(~ ≧∇≦)~" ;; right-moving
      "~(≧∇≦ ~)");; left-moving
   '(name "warai")))

;; *** loud
;; **** smart

(defconst +adult-lawful-loud-smart+
(list
   '(gfx
      "(▼∀▼)" ;; forward
      "(▼∀▼ )" ;; left-facing      
      "( ▼∀▼)" ;; right-facing
      "( >▼∀▼)>" ;; right-moving
      "<(▼∀▼< )");; left-moving
   '(name "shittakaburi")))

;; **** creative

(defconst +adult-lawful-loud-creative+
(list
   '(gfx
       "(。々°)" ;; forward       
       "(。々° )" ;; left-facing       
       "( 。々°)" ;; right-facing       
       "(> 。々°)>" ;; right-moving       
       "<(。々° <)");; left-moving
   '(name "miotosu")))

;; *** normie
;; **** social

(defconst +adult-lawful-normie-social+
(list
   '(gfx
       "(◕ヮ◕)" ;; forward       
       "(◕ヮ◕ )" ;; left-facing       
       "( ◕ヮ◕)" ;; right-facing       
       "(/◕ヮ◕)/" ;; right-moving
       "\\(◕ヮ◕\\)");; left-moving
   '(name "yorokobi")))

;; **** smart

(defconst +adult-lawful-normie-smart+
(list
   '(gfx
       "(´◡‿|◡`)" ;; forward       
       "(´◡/‿◡` )" ;; left-facing       
       "( ´◡‿|◡`)" ;; right-facing       
       "(>´◡‿|◡`)>" ;; right-moving       
       "<(´◡/‿◡`<)");; left-moving
   '(name "yoshoku")))

;; **** creative

(defconst +adult-lawful-normie-creative+
(list
   '(gfx
       "@(･ω･)@" ;; forward       
       "@(･ω･o )@" ;; left-facing       
       "@( o･ω･)@" ;; right-facing       
       "@( >o･ω･)@>" ;; right-moving       
       "<@(･ω･o< )@");; left-moving
   '(name "saru")))

;; *** funny
;; **** social

(defconst +adult-lawful-funny-social+
(list
   '(gfx
     "(●ᴥ●)"	   ;; forward
       "(●ᴥ● )"	   ;; left-facing
       "( ●ᴥ●)"	   ;; right-facing
       "(> ●ᴥ●)>"  ;; right-moving
       "<(●ᴥ● <)") ;; left-moving
   '(name "inu")))

;; **** smart

(defconst +adult-lawful-funny-smart+
(list
   '(gfx
       "(๑ÒωÓ๑)" ;; forward       
       "(๑ÒωÓ๑ )" ;; left-facing       
       "( ๑ÒωÓ๑)" ;; right-facing       
       "( >๑ÒωÓ๑)>" ;; right-moving       
       "<(๑ÒωÓ๑< )");; left-moving
'(name "otaku")))

;; **** creative

(defconst +adult-lawful-funny-creative+
(list
   '(gfx
       "(≧∀≦)" ;; forward       
       "(≧∀≦ )" ;; left-facing       
       "( ≧∀≦)" ;; right-facing       
       "(/≧∀≦)/" ;; right-moving       
       "\\(≧∀≦\\)");; left-moving
   '(name "shifuku")))

;; *** active
;; **** social

(defconst +adult-lawful-active-social+
(list
   '(gfx
       "(•̀◡•́)"	     ;; forward
       "✧(-◡•́｡)"     ;; left-facing
       "(｡•̀◡-)✧"     ;; right-facing
       "(> ｡•̀◡-)>✧"  ;; right-moving
       "✧<(-◡•́｡ <)") ;; left-moving
   '(name "keihaku")))

;; **** smart

(defconst +adult-lawful-active-smart+
(list
   '(gfx
       "(° ͜ʖ °)" ;; forward       
       "(° c͜ ° )" ;; left-facing       
       "( ° ͜ʖ °)" ;; right-facing       
       "(☞ ° ͜ʖ °)☞" ;; right-moving       
"☜( ° c͜ °☜)");; left-moving
   '(name "lenny")))

;; **** creative

(defconst +adult-lawful-active-creative+
  (list
   '(gfx	  
       "(ˆ⌣ˆ)" ;; forward       
       "(ˆ⌣ˆc)" ;; left-facing       
       "(ↄˆ⌣ˆ)" ;; right-facing       
       "(>ↄˆ⌣ˆ)>" ;; right-moving       
       "<(ˆ⌣ˆc<)");; left-moving
   '(name "ureshii")))

;; ┌─┐┌─┐┌┬┐  ┌┬┐┌─┐┌┬┐┌─┐
;; ├─┘├┤  │    ││├─┤ │ ├─┤
;; ┴  └─┘ ┴   ─┴┘┴ ┴ ┴ ┴ ┴

;; ******************************* EGG ******************************
;; egg is the initial life-cycle stage
;; you, as it were, start with a blank sheet (:
;; ******************************************************************

;; ****************************** BABBY *****************************
;; the babby stage is RNG-ed between 'lawful' and 'chaotic'
;; ******************************************************************

;; ****************************** CHILD *****************************
;; the child phase is RNG-ed between 'normie', 'active', 'funny', and
;; 'loud'. this is the phase you start looking after your pet.
;; ******************************************************************

;; -*-

;; ****************************** TEEN ******************************
;; lawful
;;    normie -> 0
;;    active -> 3
;;    funny -> 0
;;    loud -> 2
;;
;; chaotic
;;    normie -> 1
;;    active -> 3
;;    funny -> 2
;;    loud -> 3
;; ******************************************************************

;; -*-

;; ***************************** ADULT ******************************
;;
;;  chaotic
;;    . loud
;;        ~ social
;;        ~ smart
;;        ~ creative
;;    . normie
;;        ~ social
;;        ~ smart
;;        ~ creative
;;    . funny
;;        ~ social
;;        ~ smart
;;        ~ creative
;;    . active
;;        ~ social
;;        ~ smart
;;        ~ creative
;;  lawful
;;    . loud
;;        ~ social -> nil
;;        ~ smart -> nil
;;        ~ creative -> 72
;;    . normie
;;        ~ social -> nil
;;        ~ smart -> nil
;;        ~ creative -> nil
;;    . funny
;;        ~ social -> nil
;;        ~ smart -> nil
;;        ~ creative -> nil
;;    . active
;;        ~ social -> 144
;;        ~ smart -> 40
;;        ~ creative -> nil
;; ******************************************************************
