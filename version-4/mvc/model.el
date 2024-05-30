
;; ╔╦╗╔═╗╔╦╗╔═╗╦  
;; ║║║║ ║ ║║║╣ ║  
;; ╩ ╩╚═╝═╩╝╚═╝╩═╝

(provide 'uwu-pet-model)

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

(defvar *movement* 0)
(defvar *character* +egg+)
(defvar *hearts* 4) ; this meter decreases with neglect
(defvar *hungry* 4) ; this meter decreases with hunger
(defvar *toilet* 0) ; this meter increases with more poops
(defvar *asleep* nil) ; initial value nil, means awake.
(defvar *lights* t) ; initial value t, means lights are on.
(defvar *attention* nil)
(defvar *attention-flag* nil)
(defvar *neglect* 0)
(defvar *illness* nil)
(defvar *free-neglects* 0)
(defvar *uwu-player-messages* "Welcome to uwu.el~")
