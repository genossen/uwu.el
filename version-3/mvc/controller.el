
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
    (setf *hungry* (- *hungry* 1)))
  
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
    (setf *toilet* (+ *toilet* 1)))
  
  (when
      (= *toilet* 4)
    (setf *attention* t)))

;; ┌─┐┬  ┌─┐┌─┐┌─┐
;; └─┐│  ├┤ ├┤ ├─┘
;; └─┘┴─┘└─┘└─┘┴  

(defun uwu-sleep-timer ()
  (run-with-timer (* 8 +one-hour+) (* 8 +one-hour+) #'uwu-sleep-handler))

(defun uwu-toggle-asleep ()
  (cond  ((eq *asleep* t) (setf *asleep* nil))
	 ((eq *asleep* nil) (setf *asleep* t)))) ; this may not work
					         ; (apparently it
					         ; does?)

(defun uwu-sleep-handler ()
  (uwu-toggle-asleep)

  (unless
      (and
       (eq *asleep* nil)
       (eq *lights* nil))
    (setf *attention* t))
  
  (when
      (and
       (eq *asleep* nil)
       (eq *lights* t))
    ))
  

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

  (cond ((and (equal uwu-attention-p t) (equal *attention-flag* t))

	 (uwu-attention-collision))

	((and (equal uwu-attention-p t) (equal *attention-flag* nil))

	 (uwu-attention-flag-setup))

	((and (equal uwu-attention-p nil)) (equal *attention-flag* t)
	 (uwu-attention-flag-down))

	((and (equal uwu-attention-p nil)
	      (equal *attention-flag* nil))
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
