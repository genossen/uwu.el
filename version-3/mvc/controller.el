
;; ╔═╗╔═╗╔╗╔╔╦╗╦═╗╔═╗╦  ╦  ╔═╗╦═╗
;; ║  ║ ║║║║ ║ ╠╦╝║ ║║  ║  ║╣ ╠╦╝
;; ╚═╝╚═╝╝╚╝ ╩ ╩╚═╚═╝╩═╝╩═╝╚═╝╩╚═

(defun uwu-init ()
  (setf *character* +egg+)
  (setf *hearts* 4)
  (setf *toilet* 0)
  (setf *total-points* 0)
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
  (uwu-sleep-timer))

;; ┬ ┬┬ ┬┌┐┌┌─┐┌─┐┬─┐
;; ├─┤│ │││││ ┬├┤ ├┬┘
;; ┴ ┴└─┘┘└┘└─┘└─┘┴└─

(defun uwu-hunger-timer ()
  (run-with-timer +fifteen-minutes+ +fifteen-minutes+ #'uwu-hunger))

(defun uwu-hunger ()
  (unless
      (= *hungry* 0.0)
    (setf *hungry* (- *hungry* 1)))
  
  (when
      (= *hungry* 0.0)
    (setf *attention* t)))

;; ┌┬┐┌─┐┬┬  ┌─┐┌┬┐
;;  │ │ │││  ├┤  │ 
;;  ┴ └─┘┴┴─┘└─┘ ┴

(defun uwu-toilet-timer ()
  (run-with-timer +five-minutes+ (* 3 +one-hour+) #'uwu-toilet))

(defun uwu-toilet ()
  (unless
      (= *toilet* 4)
    (setf *toilet* (+ *toilet* 1)))
  
  (when
      (= *toilet* 4)
    (setf *attention* t)))

;; ┌─┐┬  ┌─┐┌─┐┌─┐
;; └─┐│  ├┤ ├┤ ├─┘
;; └─┘┴─┘└─┘└─┘┴  

(defun uwu-sleep-timer ()
  (run-with-timer (* 8 +one-hour+) (* 8 +one-hour+) #'uwu-toggle-asleep))

(defun uwu-toggle-asleep ()
  (cond  ((eq *asleep* t) (setf *asleep* nil))
	 ((eq *asleep* nil) (setf *asleep* t)))) ; this may not work
						 ; (apparently it
						 ; does?)

;; need function for alerting user to turn off/on light upon sleep
;; state changing

;; ┌─┐┬─┐┌─┐┬ ┬┌┬┐┬ ┬
;; │ ┬├┬┘│ ││││ │ ├─┤
;; └─┘┴└─└─┘└┴┘ ┴ ┴ ┴

;; egg hatches after 5 mins
;; baby turns into child after 65 mins
;; child becomes teen after 3 days
;; teen becomes adult after 6 days

(defun uwu-egg-hatch-timer ()
  (run-with-timer +five-minutes+ nil #'uwu-grow-to-baby))

(defun uwu-grow-to-child-timer ()
  (run-with-timer (+ +one-hour+ +five-minutes+) nil #'uwu-grow-to-child))

(defun uwu-grow-to-teen-timer ()
  (run-with-timer (* 3 +one-day+) nil #'uwu-grow-to-teen))

(defun uwu-grow-to-adult-timer ()
  (run-with-timer (* 6 +one-day+) nil #'uwu-grow-to-adult))

;; ╦ ╦╔═╗╔═╗╦═╗ 
;; ║ ║╚═╗║╣ ╠╦╝ 
;; ╚═╝╚═╝╚═╝╩╚═ 
;; ╦╔╗╔╔═╗╦ ╦╔╦╗
;; ║║║║╠═╝║ ║ ║ 
;; ╩╝╚╝╩  ╚═╝ ╩  

(defun uwu-feed ()
  (interactive)
  (if (< *hearts* 4)
  (setf *hearts* 4)))

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
  (uwu-handle-attention *attention*) ; this line was a bit of luck. we
				     ; check whether there are any
				     ; outstanding user notifications
				     ; before drawing a frame of
				     ; animation. i think this makes
				     ; the most sense.
  (one-frame-of-animation *character*))

(defun one-frame-of-animation (character)
  (blank-and-draw-frame (uwu-character-gfx-lookup character)))

(defun blank-and-draw-frame (character)
  (set-buffer "*uwu*")
  (erase-buffer)
  (pet-movement character)) ; 2022-09-22@22.57: need to remember to
			    ; rename "pet" to "character" here, as
			    ; well as in view.el

(defun uwu-character-gfx-lookup (character)
  (assoc 'gfx character))

;; (defun points-to-evolution (total-points)
;;   (symbol-value
;;    (nth 1 (car
;; 	   (cl-loop for lookup in +pet-evolution-tree+
;; 		    when (< total-points (car lookup))
;; 		    collect lookup)))))

;; ┌─┐┌┬┐┌┬┐┌─┐┌┐┌┌┬┐┬┌─┐┌┐┌
;; ├─┤ │  │ ├┤ │││ │ ││ ││││
;; ┴ ┴ ┴  ┴ └─┘┘└┘ ┴ ┴└─┘┘└┘
;;         ┌─┐┌┐┌┌┬┐        
;;         ├─┤│││ ││        
;;         ┴ ┴┘└┘─┴┘        
;;   ┌┐┌┌─┐┌─┐┬  ┌─┐┌─┐┌┬┐  
;;   │││├┤ │ ┬│  ├┤ │   │   
;;   ┘└┘└─┘└─┘┴─┘└─┘└─┘ ┴   

(defun uwu-handle-attention (uwu-attention-p)
  ) ; if *attention* is set to T then work out why, and set a idle
    ; timer. if the idle timer elapses, then cl-incf *neglect*
  
;; - pet get sick (*illness*) if poops remain too long, will require medicine
;; - cl-incf neglect if asleep and lights on
