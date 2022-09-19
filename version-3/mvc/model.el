
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

(defvar *hearts* 4) ; this meter decreases with neglect
(defvar *hungry* 4) ; this meter decreases with hunger
(defvar *toilet* 0) ; this meter increases with more poops
(defvar *asleep* nil)
(defvar *lights* nil)
(defvar *attention* nil)
(defvar *neglect* 0)
(defvar *illness* nil)

