
;; ╔═╗╔═╗╔╗╔╔╦╗╦═╗╔═╗╦  ╦  ╔═╗╦═╗
;; ║  ║ ║║║║ ║ ╠╦╝║ ║║  ║  ║╣ ╠╦╝
;; ╚═╝╚═╝╝╚╝ ╩ ╩╚═╚═╝╩═╝╩═╝╚═╝╩╚═

(defun uwu-init ()
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

(defun uwu-toilet-timer ()
  (run-with-timer (* 8 +one-hour+) (* 8 +one-hour+) #'toggle-asleep))

(defun toggle-asleep ()
  (cond  ((= *asleep* t) (setf *asleep* nil))
	 ((= *asleep* nil) (setf *asleep* t))))
