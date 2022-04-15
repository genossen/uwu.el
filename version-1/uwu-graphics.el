;;; ┬ ┬┬ ┬┬ ┬ ┌─┐┬  
;;; │ │││││ │ ├┤ │  
;;; └─┘└┴┘└─┘o└─┘┴─┘

;; Version 1.
;; By: ~vidak

;;; ************
;;; * GRAPHICS *
;;; ************

;; This program is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see
;; <https://www.gnu.org/licenses/>.

(defconst +egg-data+
  (list
   "."
   "｡"
   "ₒ"
   "o"
   "O"))

;;; o O °ﾟº Ó Õ Ø ô Ơ ơ Өө₀.

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


(defconst +child-data+
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

(defconst +teen-data+
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
  


;((lawful                     <- CAR will select only 'lawful' fields
;  (skill-alignment
;   (genus
;    (data
;     (data-field 1)
;     (data field ...))
;    (gfx "gfx-fields"))))

; (chaotic                  <- CDR will select only 'chaotic' fields
;  (skill alignment
;   (genus
;    (data
;     (data-field 1)
;     (data-field ...))
;    (gfx "field")))))

(defconst +adult-data+
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
       "( ´◡‿|◡`)" ;; right-facing       
       "(>´◡‿|◡`)>" ;; right-moving       
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
       "\\(◕ヮ◕\\)"));; left-moving
      
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
 

					
;   poop:				
;   cξ~~					
					
					
;   sleeping animations:			
;   (ー。ー) zzz
					
;   ★☽(。￣-￣)			
					
;   (ﾉ△･｡)				
					
;   (_ _)..ooOO				
					
;   secret pet evolution characters:	
					
;   (⁎ ⁍̴̛ᴗ⁍̴̛ ⁎)				
