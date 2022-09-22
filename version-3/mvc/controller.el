
;; ╔═╗╔═╗╔╗╔╔╦╗╦═╗╔═╗╦  ╦  ╔═╗╦═╗
;; ║  ║ ║║║║ ║ ╠╦╝║ ║║  ║  ║╣ ╠╦╝
;; ╚═╝╚═╝╝╚╝ ╩ ╩╚═╚═╝╩═╝╩═╝╚═╝╩╚═

(defun uwu-init ()
  (setf *character +egg+)
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
  (cond  ((= *asleep* t) (setf *asleep* nil))
	 ((= *asleep* nil) (setf *asleep* t))))

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

;; ╦ ╦╔═╗╔═╗╦═╗ 
;; ║ ║╚═╗║╣ ╠╦╝ 
;; ╚═╝╚═╝╚═╝╩╚═ 
;; ╦╔╗╔╔═╗╦ ╦╔╦╗
;; ║║║║╠═╝║ ║ ║ 
;; ╩╝╚╝╩  ╚═╝ ╩  

(defun uwu-feed ()
  (interactive)
  (if (< *hearts* 4)  
      (cl-incf *total-points*))
  (cl-incf *hearts* 4))

(defun uwu-clean-up ()    
  (interactive)
  (if (> *toilet* 0)
      (cl-incf *total-points*))
    (setf *toilet* 0))

;; ╔╦╗╔═╗╦╔╗╔  
;; ║║║╠═╣║║║║  
;; ╩ ╩╩ ╩╩╝╚╝  
;; ╦  ╔═╗╔═╗╔═╗
;; ║  ║ ║║ ║╠═╝
;; ╩═╝╚═╝╚═╝╩

(defun uwu-visualiser ()
  (run-with-timer 1 1 #'uwu-display-loop))

(defun uwu-display-loop ()
  (one-frame-of-animation *character*))

(defun one-frame-of-animation (character)
  (blank-and-draw-frame (pet-gfx-lookup total-points)))

(defun blank-and-draw-frame (pet-gfx)
  (set-buffer "*uwu*")
  (erase-buffer)
  (pet-movement pet-gfx))

(defun pet-gfx-lookup (total-points)
  (assoc 'gfx
	 (symbol-value
	  (points-to-evolution total-points))))

(defun points-to-evolution (total-points)
  (symbol-value
   (nth 1 (car
	   (cl-loop for lookup in +pet-evolution-tree+
		    when (< total-points (car lookup))
		    collect lookup)))))
