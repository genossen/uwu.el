
;;; ┬ ┬┬ ┬┬ ┬ ┌─┐┬  
;;; │ │││││ │ ├┤ │  
;;; └─┘└┴┘└─┘o└─┘┴─┘

;; Version 2.
;; By ~vidak.

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

(provide 'uwu-graphics-v2)

(defconst +pet-evolution-tree+
  (list
   '(0 +egg+) ; EGG PHASE
   
   '(10 +babby-chaotic+) ; BABBY PHASE
   '(20 +babby-lawful+)
   
   '(30 +child-loud+) ; CHILD PHASE
   '(40 +child-normie+)
   '(50 +child-funny+)
   '(60 +child-active+)
   
   '(70 +teen-chaotic-loud+) ; TEEN PHASE
   '(80 +teen-chaotic-normie+)
   '(90 +teen-chaotic-funny+)
   '(100 +teen-chaotic-active+)

   '(110 +teen-lawful-loud+)
   '(120 +teen-lawful-normie+)
   '(130 +teen-lawful-funny+)
   '(140 +teen-lawful-active+)

   '(150 +adult-chaotic-loud-social+) ; ADULT PHASE
   '(160 +adult-chaotic-loud-smart+)
   '(170 +adult-chaotic-loud-creative+)
   
   '(180 +adult-chaotic-normie-social+)
   '(190 +adult-chaotic-normie-smart+)
   '(200 +adult-chaotic-normie-creative+)
   
   '(210 +adult-chaotic-funny-social+)
   '(220 +adult-chaotic-funny-smart+)
   '(230 +adult-chaotic-funny-creative+)
   
   '(240 +adult-chaotic-active-social+)
   '(250 +adult-chaotic-active-smart+)
   '(260 +adult-chaotic-active-creative+)

   '(270 +adult-lawful-loud-social+)
   '(280 +adult-lawful-loud-smart+)
   '(290 +adult-lawful-loud-creative+)
   
   '(300 +adult-lawful-normie-social+)
   '(310 +adult-lawful-normie-smart+)
   '(320 +adult-lawful-normie-creative+)
   
   '(330 +adult-lawful-funny-social+)
   '(340 +adult-lawful-funny-smart+)
   '(350 +adult-lawful-funny-creative+)
   
   '(360 +adult-lawful-active-social+)
   '(370 +adult-lawful-active-smart+)
   '(380 +adult-lawful-active-creative+)))
   
;;         ┌─┐┌─┐┌┬┐          
;;         ├─┘├┤  │           
;;         ┴  └─┘ ┴           
;; ┌┬┐┌─┐┌─┐┬┌┐┌┬┌┬┐┬┌─┐┌┐┌┌─┐
;;  ││├┤ ├┤ │││││ │ ││ ││││└─┐
;; ─┴┘└─┘└  ┴┘└┘┴ ┴ ┴└─┘┘└┘└─┘

(defconst +egg+    ; EGG PHASE
  (list
   '(gfx
     "."
     "｡"
     "ₒ"
     "o"
     "O")
   '(name "egge")))
   
(defconst +babby-chaotic+ ; BABBY PHASE
  (list
   '(gfx
     "( .◎. )" ;; forward
     "(｡◎｡  )" ;; left-facing
     "(  ｡◎｡)" ;; right-facing
     "(_ ｡◎｡)_" ;; right-moving
     "_(｡◎｡ _)") ;; left-moving
   '(name "chaotic babby")))
   
(defconst +babby-lawful+
  (list
   '(gfx
     "~:0" ;; forward
     "o:~" ;; left-facing
     "~:o" ;; right-facing
     "~:v" ;; right-moving
     "c:~") ;; left-moving
     '(name "lawful babby")))
   
(defconst +child-loud+ ;CHILD PHASE
  (list
   '(gfx
     "(＾▽＾)"
     "(＾▽＾ )"
     "( ＾▽＾)"
     "(>＾▽＾)>"
     "<(＾▽＾<)")
   '(name "loud child")))

(defconst +child-normie+
  (list
   '(gfx
     "(✿^‿^✿)"
     "(^‿^✿ )"
     "( ✿^‿^)"
     "(>✿^‿^)>"
     "<(^‿^✿<)")
   '(name "normie child")))

(defconst +child-funny+
  (list
   '(gfx
     "( 。v ° )"
     "(。v ° )☆"
     "☆( 。v °)"
     "☆( >。v °)>"
     "<(。v °< )☆")
   '(name "funny child")))

(defconst +child-active+
  (list
   '(gfx
     "( o v o )"
     "(o v o )"
     "( o v o)"
     "( ┘o v o)┘"
     "┌(o v o┌ )")
   '(name "active child")))


(defconst +teen-chaotic-loud+ ; TEEN PHASE
  (list
   '(gfx
       "(°□°)" ;; forward       
       "(°□° )" ;; left-facing       
       "( °□°)" ;; right-facing       
       "(╯°□°)╯" ;; right-moving       
       "╰(°□°╰)") ;; left-moving
   '(name "gekido")))

(defconst +teen-chaotic-normie+
  (list
   '(gfx
       "(>.<)" ;; forward       
       "(<.<)" ;; left-facing       
       "(>.>)" ;; right-facing       
       "(>.>)//" ;; right-moving       
       "\\(<.<)") ;; left-moving
   '(name "henna")))

(defconst +teen-chaotic-funny+
  (list
   '(gfx
       " ¯\(°_o)/¯" ;; forward       
       "(°_o )" ;; left-facing       
       "( o_°)" ;; right-facing       
       " (/¯o_°)/¯" ;; right-moving       
       " ¯\(°_o¯\)") ;; left-moving
   '(name "derp")))

(defconst +teen-chaotic-active+
  (list
   '(gfx
       " (•̀_•́)" ;; forward       
       " (•̀_•́ )" ;; left-facing       
       " ( •̀_•́)" ;; right-facing       
       " (ง •̀_•́)ง" ;; right-moving       
       " ლ(•̀_•́ლ)") ;; left-moving
   '(name "hadena")))

(defconst +teen-lawful-loud+
  (list
   '(gfx
      "( *°▽°* )" ;; forward
      "(*°▽°* )" ;; left-facing      
      "( *°▽°*)" ;; right-facing      
      "(>*°▽°*)>" ;; right-moving      
      "<(*°▽°*<)") ;; left-moving
   '(name "kagayaku")))

(defconst +teen-lawful-normie+
  (list
   '(gfx
      "(u w u)" ;; forward      
      "(u w u )" ;; left-facing      
      "( u w u)" ;; right-facing      
      "(> u w u)>" ;; right-moving      
      "<( u w u <)") ;; left-moving
   '(name "uwu")))

(defconst +teen-lawful-funny+
  (list
   '(gfx
      "(•˘v˘•)" ;; forward      
      "(•˘v˘n )" ;; left-facing      
      "( ˘v˘•)" ;; right-facing      
      "(n˘v˘•)¬" ;; right-moving      
      "~(•˘v˘n)") ;; left-moving
   '(name "kirei")))

(defconst +teen-lawful-active+
  (list
   '(gfx
      "(o w o)" ;; forward      
      "(o w o )" ;; left-facing      
      "( o w o)" ;; right-facing      
      "(> o w o)>" ;; right-moving
      "<( o w o <)") ;; left-moving
   '(name "owo")))



(defconst +adult-chaotic-loud-social+ ; ADULT PHASE
  (list
   '(gfx  
	"＼(´◓ Д ◔)／" ;; forward	
	"(´◓ Д ◔ )" ;; left-facing	
	"( ´◔ Д ◓)" ;; right-facing	
	"(／ ´◔ Д ◓)／" ;; right-moving	
	"＼(´◓ Д ◔ ＼)") ;; left-moving
   '(name "sakebu")))

(defconst +adult-chaotic-loud-smart+	  
  (list
   '(gfx
     "(｀▽´)" ;; forward
      "(｀▽´ )" ;; left-facing
      "( ｀▽´)" ;; right-facing
      "(o ｀▽´ )oΨ" ;; right-moving
      "Ψo(｀▽´ o)");; left-moving
   '(name "noroi")))

(defconst +adult-chaotic-loud-creative+
  (list
   '(gfx
      "(ﾟ Д ﾟ)" ;; forward
      "(ﾟ Д ﾟ )" ;; left-facing
      "( ﾟ Д ﾟ)" ;; right-facing
      "(> ﾟ Д ﾟ)>" ;; right-moving
      "<(ﾟ Д ﾟ <)");; left-moving
   '(name "osoroshii")))
   
(defconst +adult-chaotic-normie-social+
  (list
   '(gfx
	"(⌐■_■¬)" ;; forward	
	"(■_■¬ )" ;; left-facing	
	"( ⌐■_■)" ;; right-facing	
	"(>⌐■_■)>" ;; right-moving	
	"<(■_■¬<)");; left-moving
   '(name "kakkoii")))

(defconst +adult-chaotic-normie-smart+
  (list
   '(gfx
      "(▼皿▼)" ;; forward
      "(▼皿▼｡ )" ;; left-facing
      "( ｡▼皿▼)" ;; right-facing
      "(- ｡▼皿▼)-" ;; right-moving
      "-(▼皿▼｡ -)");; left-moving
   '(name "kabuto")))

(defconst +adult-chaotic-normie-creative+
  (list
   '(gfx
      "(*Φ ω Φ*)" ;; forward
      "(*Φ ω Φ* )" ;; left-facing
      "( *Φ ω Φ*)" ;; right-facing
      "(∿*Φ ω Φ*)∿" ;; right-moving
      "∿(*Φ ω Φ*∿)");; left-moving
   '(name "neko")))

(defconst +adult-chaotic-funny-social+
  (list
   '(gfx
     "('ڡ')" ;; forward
     "('ڡ' )" ;; left-facing
     "( 'ڡ')" ;; right-facing
     "(ง 'ڡ')ง" ;; right-moving
     "ლ('ڡ'ლ)");; left-moving
   '(name "dorobo")))

(defconst +adult-chaotic-funny-smart+
  (list
   '(gfx
      "(｀▽´)" ;; forward
      "(｀▽´ )" ;; left-facing
      "( ｀▽´)" ;; right-facing
      "(o ｀▽´ )oΨ" ;; right-moving
      "Ψo(｀▽´ o)");; left-moving
   '(name "noroi")))

(defconst +adult-chaotic-funny-creative+
  (list
   '(gfx
     "(⊙_◎)" ;; forward
      "(⊙_◎ )" ;; left-facing
      "( ⊙_◎)" ;; right-facing
      "(> ⊙_◎)>" ;; right-moving
      "<(⊙_◎ <)");; left-moving
   '(name "yotta")))

(defconst +adult-chaotic-active-social+
  (list
   '(gfx
     	"(Φ‿Φ)" ;; forward	
	"(Φ‿Φ )" ;; left-facing	
	"( Φ‿Φ)" ;; right-facing	
	"Ψ( ;Φ‿Φ)_↑" ;; right-moving	
	"↑_(Φ‿Φ;)Ψ");; left-moving
   '(name "akuma")))

(defconst +adult-chaotic-active-smart+
  (list
   '(gfx
      "(ʘ∀ʘ)" ;; forward
      "(๑ʘ∀ʘ )" ;; left-facing
      "( ๑ʘ∀ʘ)" ;; right-facing
      "ε=┌(๑ʘ∀ʘ)┘" ;; right-moving
      "┗(ʘ∀ʘ๑)┐┘=3");; left-moving
   '(name "hashiru")))

(defconst +adult-chaotic-active-creative+
  (list
   '(gfx
      "(ì_í)" ;; forward
      "(ì_í )" ;; left-facing
      "( ì_í)" ;; right-facing
      "(ó ì_í)=ó" ;; right-moving
      "ò=(ì_í ò)");; left-moving
   '(name "osu")))

(defconst +adult-lawful-loud-social+
  (list
   '(gfx
      "(≧∇≦)" ;; forward
      "(≧∇≦ )" ;; left-facing
      "( ≧∇≦)" ;; right-facing
      "(~ ≧∇≦)~" ;; right-moving
      "~(≧∇≦ ~)");; left-moving
   '(name "warai")))

(defconst +adult-lawful-loud-smart+
(list
   '(gfx
      "(▼∀▼)" ;; forward
      "(▼∀▼ )" ;; left-facing      
      "( ▼∀▼)" ;; right-facing
      "( >▼∀▼)>" ;; right-moving
      "<(▼∀▼< )");; left-moving
   '(name "shittakaburi")))

(defconst +adult-lawful-loud-creative+
(list
   '(gfx
       "(。々°)" ;; forward       
       "(。々° )" ;; left-facing       
       "( 。々°)" ;; right-facing       
       "(> 。々°)>" ;; right-moving       
       "<(。々° <)");; left-moving
   '(name "miotosu")))

(defconst +adult-lawful-normie-social+
(list
   '(gfx
       "(◕ヮ◕)" ;; forward       
       "(◕ヮ◕ )" ;; left-facing       
       "( ◕ヮ◕)" ;; right-facing       
       "(/◕ヮ◕)/" ;; right-moving
       "\\(◕ヮ◕\\)");; left-moving
   '(name "yorokobi")))

(defconst +adult-lawful-normie-smart+
(list
   '(gfx
       "(´◡‿|◡`)" ;; forward       
       "(´◡/‿◡` )" ;; left-facing       
       "( ´◡‿|◡`)" ;; right-facing       
       "(>´◡‿|◡`)>" ;; right-moving       
       "<(´◡/‿◡`<)");; left-moving
   '(name "yoshoku")))

(defconst +adult-lawful-normie-creative+
(list
   '(gfx
       "@(･ω･)@" ;; forward       
       "@(･ω･o )@" ;; left-facing       
       "@( o･ω･)@" ;; right-facing       
       "@( >o･ω･)@>" ;; right-moving       
       "<@(･ω･o< )@");; left-moving
   '(name "saru")))
  
(defconst +adult-lawful-funny-social+
(list
   '(gfx
     "(●ᴥ●)"	   ;; forward
       "(●ᴥ● )"	   ;; left-facing
       "( ●ᴥ●)"	   ;; right-facing
       "(> ●ᴥ●)>"  ;; right-moving
       "<(●ᴥ● <)") ;; left-moving
   '(name "inu")))

(defconst +adult-lawful-funny-smart+
(list
   '(gfx
       "(๑ÒωÓ๑)" ;; forward       
       "(๑ÒωÓ๑ )" ;; left-facing       
       "( ๑ÒωÓ๑)" ;; right-facing       
       "( >๑ÒωÓ๑)>" ;; right-moving       
       "<(๑ÒωÓ๑< )");; left-moving
'(name "otaku")))

(defconst +adult-lawful-funny-creative+
(list
   '(gfx
       "(≧∀≦)" ;; forward       
       "(≧∀≦ )" ;; left-facing       
       "( ≧∀≦)" ;; right-facing       
       "(/≧∀≦)/" ;; right-moving       
       "\\(≧∀≦\\)");; left-moving
   '(name "shifuku")))

(defconst +adult-lawful-active-social+
(list
   '(gfx
       "(•̀◡•́)"	     ;; forward
       "✧(-◡•́｡)"     ;; left-facing
       "(｡•̀◡-)✧"     ;; right-facing
       "(> ｡•̀◡-)>✧"  ;; right-moving
       "✧<(-◡•́｡ <)") ;; left-moving
   '(name "keihaku")))

(defconst +adult-lawful-active-smart+
(list
   '(gfx
       "(° ͜ʖ °)" ;; forward       
       "(° c͜ ° )" ;; left-facing       
       "( ° ͜ʖ °)" ;; right-facing       
       "(☞ ° ͜ʖ °)☞" ;; right-moving       
"☜( ° c͜ °☜)");; left-moving
   '(name "lenny")))

(defconst +adult-lawful-active-creative+
  (list
   '(gfx	  
       "(ˆ⌣ˆ)" ;; forward       
       "(ˆ⌣ˆc)" ;; left-facing       
       "(ↄˆ⌣ˆ)" ;; right-facing       
       "(>ↄˆ⌣ˆ)>" ;; right-moving       
       "<(ˆ⌣ˆc<)");; left-moving
   '(name "ureshii")))

;; ┬ ┬┌─┐┌─┐┬─┐┌┬┐┌─┐
;; ├─┤├┤ ├─┤├┬┘ │ └─┐
;; ┴ ┴└─┘┴ ┴┴└─ ┴ └─┘

(defconst +four-hearts+
"
     ♥♥♥♥♥♥♥♥
")

(defconst +three-and-half-hearts+
"
     ♥♥♥♥♥♥♥♡
")

(defconst +three-hearts+
"
     ♥♥♥♥♥♥♡♡
")

(defconst +two-and-half-hearts+
"
     ♥♥♥♥♥♡♡♡
")

(defconst +two-hearts+
"
     ♥♥♥♥♡♡♡♡
")

(defconst +one-and-half-hearts+
"
     ♥♥♥♡♡♡♡♡
")

(defconst +one-heart+
"
     ♥♥♡♡♡♡♡♡
"
)

(defconst +half-heart+
"
     ♥♡♡♡♡♡♡♡
")

(defconst +zero-hearts+
"
     ♡♡♡♡♡♡♡♡

hungry~!

(don't forget to
   M-x uwu-feed!)
")


;; ┌┬┐┌─┐┬┬  ┌─┐┌┬┐┌─┐
;;  │ │ │││  ├┤  │ └─┐
;;  ┴ └─┘┴┴─┘└─┘ ┴ └─┘

(defconst +zero-toilets+
"
")

(defconst +one-toilet+
"
       ς
       Δ
")

(defconst +two-toilets+
"
       ς  ξ
       Δ  Δ
")

(defconst +three-toilets+
"
       ς  ξ  ς
       Δ  Δ  Δ
")

(defconst +four-toilets+
  "
       ς  ξ  ς  ξ  (don't forget to
       Δ  Δ  Δ  Δ  M-x uwu-clean-up!)
")
