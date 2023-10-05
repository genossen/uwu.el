
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

(defconst +adult-characters+ ; need to find a way to reduce
			     ; hard-coding, such as here. the list of
			     ; characters to traverse could
			     ; potentially be placed within the
			     ; graphics pack, and loaded into the
			     ; evaluated code dynamically and
			     ; automatically.
   (list
    +adult-chaotic-0+
    +adult-chaotic-1+
    +adult-chaotic-2+
    +adult-chaotic-3+
    +adult-chaotic-4+
    +adult-chaotic-5+))

;; ┬  ┬┌─┐┬─┐┬┌─┐┌┐ ┬  ┌─┐┌─┐
;; └┐┌┘├─┤├┬┘│├─┤├┴┐│  ├┤ └─┐
;;  └┘ ┴ ┴┴└─┴┴ ┴└─┘┴─┘└─┘└─┘

(defvar *character* +egg+)
(defvar *hearts* 4) ; this meter decreases with neglect
(defvar *hungry* 4) ; this meter decreases with hunger
(defvar *toilet* 0) ; this meter increases with more poops
(defvar *asleep* nil)
(defvar *lights* nil)
(defvar *attention* nil)
(defvar *attention-flag* nil)
(defvar *neglect* 0)
(defvar *illness* nil)
(defvar *free-neglects* 0)
(defvar *uwu-player-messages* "Welcome to uwu.el~")
