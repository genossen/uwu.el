
;; ╔═╗╦═╗╔═╗╔═╗╦ ╦╦╔═╗╔═╗
;; ║ ╦╠╦╝╠═╣╠═╝╠═╣║║  ╚═╗
;; ╚═╝╩╚═╩ ╩╩  ╩ ╩╩╚═╝╚═╝
;;     ╔═╗╔═╗╔═╗╦╔═      
;;     ╠═╝╠═╣║  ╠╩╗      
;;     ╩  ╩ ╩╚═╝╩ ╩ 


;; ┌─┐┌─┐┌─┐
;; ├┤ │ ┬│ ┬
;; └─┘└─┘└─┘

(defconst +egg+
  (list
   '(gfx
     "."
     "｡"
     "ₒ"
     "o"
     "O")
   '(name "egge")))

;; ┌┐ ┌─┐┌┐ ┬ ┬
;; ├┴┐├─┤├┴┐└┬┘
;; └─┘┴ ┴└─┘ ┴

(defconst +babby-chaotic+ 
  (list
   '(gfx
     "( .◎. )" ;; forward
     "(｡◎｡  )" ;; left-facing
     "(  ｡◎｡)" ;; right-facing
     "(_ ｡◎｡)_" ;; right-moving
     "_(｡◎｡ _)") ;; left-moving
   '(name "chaotic babby")))

;; ┌─┐┬ ┬┬┬  ┌┬┐
;; │  ├─┤││   ││
;; └─┘┴ ┴┴┴─┘─┴┘

(defconst +child-chaotic+
  (list
   '(gfx
     "( 。v ° )"
     "(。v ° )☆"
     "☆( 。v °)"
     "☆( >。v °)>"
     "<(。v °< )☆")
   '(name "chaotic child")))

;; ┌┬┐┌─┐┌─┐┌┐┌
;;  │ ├┤ ├┤ │││
;;  ┴ └─┘└─┘┘└┘

(defconst +teen-chaotic-0+ 
  (list
   '(gfx
       "(°□°)" ;; forward       
       "(°□° )" ;; left-facing       
       "( °□°)" ;; right-facing       
       "(╯°□°)╯" ;; right-moving       
       "╰(°□°╰)") ;; left-moving
   '(name "gekido")))

(defconst +teen-chaotic-1+
  (list
   '(gfx
       " (•̀_•́)" ;; forward       
       " (•̀_•́ )" ;; left-facing       
       " ( •̀_•́)" ;; right-facing       
       " (ง •̀_•́)ง" ;; right-moving       
       " ლ(•̀_•́ლ)") ;; left-moving
   '(name "hadena")))

;; ┌─┐┌┬┐┬ ┬┬ ┌┬┐
;; ├─┤ │││ ││  │ 
;; ┴ ┴─┴┘└─┘┴─┘┴ 

;; # 0

(defconst +adult-chaotic-0+	  
  (list
   '(gfx
     "(｀▽´)" ;; forward
      "(｀▽´ )" ;; left-facing
      "( ｀▽´)" ;; right-facing
      "(o ｀▽´ )oΨ" ;; right-moving
      "Ψo(｀▽´ o)");; left-moving
   '(name "noroi")))

;; # 1

(defconst +adult-chaotic-1+
  (list
   '(gfx
	"(⌐■_■¬)" ;; forward	
	"(■_■¬ )" ;; left-facing	
	"( ⌐■_■)" ;; right-facing	
	"(>⌐■_■)>" ;; right-moving	
	"<(■_■¬<)");; left-moving
   '(name "kakkoii")))

;; # 2

(defconst +adult-chaotic-2+
  (list
   '(gfx
      "(▼皿▼)" ;; forward
      "(▼皿▼｡ )" ;; left-facing
      "( ｡▼皿▼)" ;; right-facing
      "(- ｡▼皿▼)-" ;; right-moving
      "-(▼皿▼｡ -)");; left-moving
   '(name "kabuto")))

;; # 3

(defconst +adult-chaotic-3+
  (list
   '(gfx
      "(*Φ ω Φ*)" ;; forward
      "(*Φ ω Φ* )" ;; left-facing
      "( *Φ ω Φ*)" ;; right-facing
      "(∿*Φ ω Φ*)∿" ;; right-moving
      "∿(*Φ ω Φ*∿)");; left-moving
   '(name "neko")))


;; # 4

(defconst +adult-chaotic-4+
  (list
   '(gfx
      "(ʘ∀ʘ)" ;; forward
      "(๑ʘ∀ʘ )" ;; left-facing
      "( ๑ʘ∀ʘ)" ;; right-facing
      "ε=┌(๑ʘ∀ʘ)┘" ;; right-moving
      "┗(ʘ∀ʘ๑)┐┘=3");; left-moving
   '(name "hashiru")))

;; # 5

(defconst +adult-chaotic-5+
  (list
   '(gfx
     	"(Φ‿Φ)" ;; forward	
	"(Φ‿Φ )" ;; left-facing	
	"( Φ‿Φ)" ;; right-facing	
	"Ψ( ;Φ‿Φ)_↑" ;; right-moving	
	"↑_(Φ‿Φ;)Ψ");; left-moving
   '(name "akuma")))

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
