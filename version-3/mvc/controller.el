
;; ╔═╗╔═╗╔╗╔╔╦╗╦═╗╔═╗╦  ╦  ╔═╗╦═╗
;; ║  ║ ║║║║ ║ ╠╦╝║ ║║  ║  ║╣ ╠╦╝
;; ╚═╝╚═╝╝╚╝ ╩ ╩╚═╚═╝╩═╝╩═╝╚═╝╩╚═

(defun uwu-init ()
  (setf *character* +egg+)
  (setf *hearts* 4)
  (setf *toilet* 0)
  (setf *hungry* 4)

;;  (get-buffer-create "*uwu*")
;;  (switch-to-buffer "*uwu*")
;;  (uwu-visualiser)
  (uwu-init-timers))

;; ╔╦╗╦╔╦╗╔═╗╦═╗╔═╗
;;  ║ ║║║║║╣ ╠╦╝╚═╗
;;  ╩ ╩╩ ╩╚═╝╩╚═╚═╝

(defun uwu-init-timers ()
  (uwu-hunger-timer)
  (uwu-toilet-timer)
  (uwu-sleep-timer)
  (uwu-egg-hatch-timer)
  (uwu-attention-timer))

;; ┬ ┬┬ ┬┌┐┌┌─┐┌─┐┬─┐
;; ├─┤│ │││││ ┬├┤ ├┬┘
;; ┴ ┴└─┘┘└┘└─┘└─┘┴└─

(defun uwu-hunger-timer ()
  (run-with-timer +fifteen-minutes+ +fifteen-minutes+ #'uwu-hunger))

(defun uwu-hunger ()
  (unless
      (= *hungry* 0)
    (setf *hungry* (- *hungry* 1))
    (setf *attention* nil))
  
  (when
      (= *hungry* 0)
    (setf *attention* t)))

;; ┌┬┐┌─┐┬┬  ┌─┐┌┬┐
;;  │ │ │││  ├┤  │ 
;;  ┴ └─┘┴┴─┘└─┘ ┴

(defun uwu-toilet-timer ()
  (run-with-timer +five-minutes+ (* 3 +one-hour+) #'uwu-toilet))

(defun uwu-toilet ()
  (unless
      (= *toilet* 4)
    (setf *toilet* (+ *toilet* 1))
    (setf *attention* nil))
  
  (when
      (= *toilet* 4)
    (setf *attention* t)))

;; ┌─┐┬  ┌─┐┌─┐┌─┐
;; └─┐│  ├┤ ├┤ ├─┘
;; └─┘┴─┘└─┘└─┘┴  

(defun uwu-sleep-timer ()
  (run-with-timer (* 8 +one-hour+) (* 8 +one-hour+) #'uwu-sleep-handler))

(defun uwu-toggle-asleep ()
  (cond  ((equal *asleep* t) (setf *asleep* nil))
	 ((equal *asleep* nil) (setf *asleep* t)))) ; this may not work
					         ; (apparently it
					         ; does?)

;; the way that the COND macrro works is that it exits whenever it
;; encounters a condition that returns T. this means that the ordering
;; of the clauses is very important.
;;
;; the uwu-sleep-handler function runs every 8 hours. it toggles
;; whether the pet character is asleep, and checks to see if the user
;; has set the light in the correct mode for the sleep state of the
;; pet character.
;;
;; the initial state of the pet is awake. this means that when the
;; sleep handler runs for the first time, it is very likely that the
;; user will need to turn the lights off.

(defun uwu-sleep-handler ()
  
  (uwu-toggle-asleep)
  
  (cond

   ;; when awake, and lights on. (correct care)
   
   ((and (equal *asleep* nil) (equal *lights* t)) 
    (setf *uwu-player-messages* ""))

   ;; when asleep, and lights on. (neglectful care)
   
   ((and (equal *asleep* t) (equal *lights* t))
    (setf *attention* t))

   ;; when asleep, and lights off. (correct care)

   ((and (equal *asleep* t) (equal *lights* nil))
    (setf *uwu-player-messages* ""))

   ;; when awake, and lights off. (neglectful care)
      
   ((and (equal *asleep* nil) (equal *lights* nil))
    (setf *attention* t))))
  

;; ┬  ┬┌─┐┬ ┬┌┬┐
;; │  ││ ┬├─┤ │ 
;; ┴─┘┴└─┘┴ ┴ ┴ 

;; need function for alerting user to turn off/on light upon sleep
;; state changing



;; ┬┬  ┬  ┌┐┌┌─┐┌─┐┌─┐
;; ││  │  │││├┤ └─┐└─┐
;; ┴┴─┘┴─┘┘└┘└─┘└─┘└─┘

;; - pet get sick (*illness*) if poops remain too long, will require
;;   medicine


;; ┬ ┬┌─┐┌─┐┬─┐┌┬┐┌─┐
;; ├─┤├┤ ├─┤├┬┘ │ └─┐
;; ┴ ┴└─┘┴ ┴┴└─ ┴ └─┘

;; need function for assessing the level of hearts

;; ┌─┐┬─┐┌─┐┬ ┬┌┬┐┬ ┬
;; │ ┬├┬┘│ ││││ │ ├─┤
;; └─┘┴└─└─┘└┴┘ ┴ ┴ ┴

;; egg hatches after 5 mins
;; baby turns into child after 65 mins
;; child becomes teen after 3 days
;; teen becomes adult after 6 days

;; all these timers are one-shots. when one finishes, they run the
;; next one.

(defun uwu-egg-hatch-timer ()
  (run-with-timer +five-minutes+ nil #'uwu-grow-to-baby))

(defun uwu-grow-to-baby ()
  (setf *character* +babby-chaotic+)
  (uwu-grow-to-child-timer))

(defun uwu-grow-to-child-timer ()
  (run-with-timer (+ +one-hour+ +five-minutes+) nil #'uwu-grow-to-child))

(defun uwu-grow-to-child ()
  (setf *character* +child-chaotic+)
  (uwu-grow-to-teen-timer))

(defun uwu-grow-to-teen-timer ()
  (run-with-timer (* 3 +one-day+) nil #'uwu-grow-to-teen))

(defun uwu-grow-to-teen ()
  (cond ((<= *neglect* *free-neglects*) (setf *character* +teen-chaotic-0+))
	(t                (setf *character* +teen-chaotic-1+)))
  (uwu-grow-to-adult-timer))

(defun uwu-grow-to-adult-timer ()
  (run-with-timer (* 6 +one-day+) nil #'uwu-grow-to-adult))

(defun uwu-grow-to-adult ()
  (cond ((<= *neglect* *free-neglects*) (setf *character*
				(nth (random 6)
				     +adult-characters+)))
	(t                (setf *character*
				(nth (- 5 (random 3))
				     +adult-characters+)))))

;; ┌─┐┌┬┐┌┬┐┌─┐┌┐┌┌┬┐┬┌─┐┌┐┌
;; ├─┤ │  │ ├┤ │││ │ ││ ││││
;; ┴ ┴ ┴  ┴ └─┘┘└┘ ┴ ┴└─┘┘└┘

(defun uwu-attention-timer ()
  (run-with-timer +fifteen-minutes+ +fifteen-minutes+ #'uwu-handle-attention))

;; ╦ ╦╔═╗╔═╗╦═╗ 
;; ║ ║╚═╗║╣ ╠╦╝ 
;; ╚═╝╚═╝╚═╝╩╚═ 
;; ╦╔╗╔╔═╗╦ ╦╔╦╗
;; ║║║║╠═╝║ ║ ║ 
;; ╩╝╚╝╩  ╚═╝ ╩  

(defun uwu-feed ()
  (interactive)
  (if (< *hearts* 4)
  (cl-incf *hearts*))) ; feeding now only fills one heart at a time.

(defun uwu-clean-up ()    
  (interactive)
  (if (> *toilet* 0)
    (setf *toilet* 0)))

;; ╔╦╗╔═╗╦╔╗╔  
;; ║║║╠═╣║║║║  
;; ╩ ╩╩ ╩╩╝╚╝  
;; ╦  ╔═╗╔═╗╔═╗
;; ║  ║ ║║ ║╠═╝
;; ╩═╝╚═╝╚═╝╩

(defun uwu-main-loop ()
  (run-with-timer 1 1 #'uwu-loop))

(defun uwu-loop ()
  (one-frame-of-animation *character*))

(defun one-frame-of-animation (character)
  (blank-and-draw-frame (uwu-character-gfx-lookup character)))

(defun blank-and-draw-frame (character)
  (set-buffer "*uwu*")
  (erase-buffer)
  (pet-movement character))

(defun uwu-character-gfx-lookup (character)
  (assoc 'gfx character))

;; ╔═╗╔╦╗╔╦╗╔═╗╔╗╔╔╦╗╦╔═╗╔╗╔
;; ╠═╣ ║  ║ ║╣ ║║║ ║ ║║ ║║║║
;; ╩ ╩ ╩  ╩ ╚═╝╝╚╝ ╩ ╩╚═╝╝╚╝
;;         ╔═╗╔╗╔╔╦╗        
;;         ╠═╣║║║ ║║        
;;         ╩ ╩╝╚╝═╩╝        
;;   ╔╗╔╔═╗╔═╗╦  ╔═╗╔═╗╔╦╗  
;;   ║║║║╣ ║ ╦║  ║╣ ║   ║   
;;   ╝╚╝╚═╝╚═╝╩═╝╚═╝╚═╝ ╩   



(defun uwu-handle-attention (uwu-attention-p)

  (cond

   ;; the attention flag has already been raised, and again the
   ;; attention variable has been "triggered", i.e.,  set to T.
   ;;
   ;; the result will be that the pet character loses a heart.

   ((and (equal uwu-attention-p t) (equal *attention-flag* t))
    (uwu-attention-collision))

   ;; the attention variable has been triggered, but the flag has not
   ;; previously been raised.
   ;;
   ;; the result, therefore, is that we trigger the flag, and wait for
   ;; this function to be called again after 15 minutes.

   ((and (equal uwu-attention-p t) (equal *attention-flag* nil))
    (uwu-attention-flag-setup))

   ;; the flag is up, but the attention variable is no longer
   ;; triggered. the assumption here is that the user has solved the
   ;; issue(s) that would trigger the attention variable.
   ;;
   ;; the result is that we set the flag down.

   ((and (equal uwu-attention-p nil) (equal *attention-flag* t))
    (uwu-attention-flag-down))

   ;; the attention variable has not been triggered, and the flag is
   ;; down.
   ;;
   ;; the result is that we do nothing.

   ((and (equal uwu-attention-p nil) (equal *attention-flag* nil))
    (setf *uwu-player-messages* "Good job C;"))))



(defun uwu-attention-collision ()
  (unless
      (= *hearts* 0)
    (cl-decf *hearts*)
    (setf *attention* nil)
    (setf *attention-flag* nil))

  (when
      (= *hearts* 0)
    (cl-incf *neglect*)))
    

(defun uwu-attention-flag-setup ()
  (setf *attention-flag* t))

(defun uwu-attention-flag-down ()
  (setf *attention-flag* nil))

  

;; - cl-incf neglect if asleep and lights on
;; - 

(defun uwu-handle-hunger ()
  (unless
      (equal *attention-flag* t)
    )
