;;; *********************************
;;; ** DEFINITION OF THE CONSTANTS **
;;; *********************************

(defparameter *attention-timer* nil)
(require 'croatoan)

(defparameter *rng-move* 0)
(defparameter *movement* 0)
(defparameter *frame-counter* 0)
(defparameter *keypress* nil)

(defconstant +five-minutes+ (* 5 60))
(defconstant +fifteen-minutes+ (* 15 60))
(defconstant +twenty-minutes+ (* 4 +five-minutes+))
(defconstant +one-hour+ (* 60 60))
(defconstant +one-day+ (* 24 +one-hour+))

(defparameter *uwu-gfx*
  (list
   "(u w u)" ;; forward
   "(u w u )" ;; left-facing
   "( u w u)" ;; right-facing
   "(> u w u)>" ;; right-moving
   "<( u w u <)")) ;; left-moving

(defun random-movement ()

  (croatoan:with-screen (scr :input-echoing nil
			     :input-buffering nil
			     :input-blocking 100
			     :cursor-visible nil
			     :enable-colors nil)
    
    (setf *rng-move* (random 5))
    (cond ((and (= 3 *rng-move*) (> *movement* 0)) (decf *movement*))
	  ((and (= 4 *rng-move*) (< *movement* 9)) (incf *movement*)))
    (format t
	    (apply #'concatenate 'string
		   (list
		    (subseq "         " *movement*)
		    (nth *rng-move* *uwu-gfx*))) #\return)))

(defun clear-emacs-buffer ()
  (swank:eval-in-emacs
   '(progn
         (run-at-time 0 nil 'slime-repl-clear-buffer)
         nil)))

(defun attention-timer ()
  (clear-emacs-buffer)
  (random-movement)
  (read-keys)
  (incf *frame-counter*)
  (print *frame-counter*)
  (when (equal 20 *frame-counter*) (break)))

(defun begin-timer ()
  (setq *attention-timer* (sb-ext::make-timer #'attention-timer :name 'attention-timer))
  (sb-ext::schedule-timer *attention-timer* 1 :repeat-interval 1))

(defun read-keys ()
  (croatoan:with-screen (scr :input-echoing nil
			     :input-buffering nil
			     :input-blocking 100
			     :cursor-visible nil
			     :enable-colors nil
			     )
    
    (croatoan:event-case (scr event)

      (#\f
       (setf *keypress* 'feed)
       (print *keypress*)
       (return-from croatoan:event-case))

      (#\t
       (setf *keypress* 'toy)
       (return-from croatoan:event-case))

      (#\m
       (setf *keypress* 'menu)
       (return-from croatoan:event-case))
      
      ((nil)
       (setf *keypress* nil)
       (return-from croatoan:event-case))

      (otherwise
       (setf *keypress* nil)
       (return-from croatoan:event-case))

      )))

