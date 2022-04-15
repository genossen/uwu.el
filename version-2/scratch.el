
;;; ┬ ┬┬ ┬┬ ┬ ┌─┐┬  
;;; │ │││││ │ ├┤ │  
;;; └─┘└┴┘└─┘o└─┘┴─┘

;; Version 2.
;; By ~vidak.

;; ┌─┐┬─┐┌─┐┌─┐┬ ┬┬┌─┐┌─┐
;; │ ┬├┬┘├─┤├─┘├─┤││  └─┐
;; └─┘┴└─┴ ┴┴  ┴ ┴┴└─┘└─┘
;;       ┌─┐┌┐┌┌┬┐       
;;       ├─┤│││ ││       
;;       ┴ ┴┘└┘─┴┘       
;;     ┌┬┐┌─┐┌┬┐┌─┐      
;;      ││├─┤ │ ├─┤      
;;     ─┴┘┴ ┴ ┴ ┴ ┴   

(require 'uwu-graphics-v2)

;; ┌┬┐┌─┐ ┬┌─┐┬─┐ 
;; │││├─┤ ││ │├┬┘ 
;; ┴ ┴┴ ┴└┘└─┘┴└─ 
;; ┌┬┐┌─┐┌┬┐┌─┐   
;; ││││ │ ││├┤    
;; ┴ ┴└─┘─┴┘└─┘   
;; ┌─┐┌─┐┌┬┐┬ ┬┌─┐
;; └─┐├┤  │ │ │├─┘
;; └─┘└─┘ ┴ └─┘┴  

(defconst uwu-version "1.0.0"
  "Current version of uwu.")

(defgroup uwu nil
  "A virtual pet simulator."
  :prefix "uwu-"
  :group 'games)

(defcustom uwu-mode-hook nil
  "Hook run when entering uwu mode."
  :type 'hook
  :group 'uwu)

(define-derived-mode uwu-mode fundamental-mode "uwu"
  "The major mode of the uwu virtual pet simulator"
  :group 'uwu)

;; ┌─┐┌─┐┌─┐┬┌─┌─┐┌─┐┌─┐
;; ├─┘├─┤│  ├┴┐├─┤│ ┬├┤ 
;; ┴  ┴ ┴└─┘┴ ┴┴ ┴└─┘└─┘

;; provide package

(provide 'uwu)

;; ┌─┐┌─┐┌┐┌┌─┐┌┬┐┌─┐┌┐┌┌┬┐┌─┐
;; │  │ ││││└─┐ │ ├─┤│││ │ └─┐
;; └─┘└─┘┘└┘└─┘ ┴ ┴ ┴┘└┘ ┴ └─┘

(defconst +five-minutes+ (* 5 60))
(defconst +fifteen-minutes+ (* 15 60))
(defconst +twenty-minutes+ (* 20 60))
(defconst +thirty-minutes+ (* 30 60))
(defconst +one-hour+ (* 60 60))
(defconst +one-day+ (* 24 +one-hour+))

(defconst +heart-list+
  (list
  '(4.0 +four-hearts+)
  '(3.5 +three-and-half-hearts+)
  '(3.0 +three-hearts+)
  '(2.5 +two-and-half-hearts+)
  '(2.0 +two-hearts+)
  '(1.5 +one-and-half-hearts+)
  '(1.0 +one-heart+)
  '(0.5 +half-heart+)
  '(0.0 +zero-hearts+)))

(defconst +toilet-list+
  (list
  '(4 +four-toilets+)
  '(3 +three-toilets+)
  '(2 +two-toilets+)
  '(1 +one-toilet+)
  '(0 +zero-toilets+)))

(defconst +pet-needs+
  (list
  'uwu-hunger
  'uwu-toilet))

;; ┬  ┬┌─┐┬─┐┬┌─┐┌┐ ┬  ┌─┐┌─┐
;; └┐┌┘├─┤├┬┘│├─┤├┴┐│  ├┤ └─┐
;;  └┘ ┴ ┴┴└─┴┴ ┴└─┘┴─┘└─┘└─┘

(defvar *movement* 0)

(defvar *total-points* 0)
(defvar *hearts* 4.0)
(defvar *toilet* 0)

;; ┌─┐┬ ┬┌┐┌┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
;; ├┤ │ │││││   │ ││ ││││└─┐
;; └  └─┘┘└┘└─┘ ┴ ┴└─┘┘└┘└─┘

(defun pet-movement (pet-gfx)

  (let ((rng-move (random 5))) 

    (cond ((and 
	    (= 3 rng-move)
	    (> *movement* 0))
	   (decf *movement*))       

	  ((and
	    (= 4 rng-move)
	    (< *movement* 9))

	   (incf *movement*)))

    (princ (symbol-value (nth 1 (assoc *toilet* +toilet-list+)))
	   (get-buffer "*scratch*"))

;;    (terpri (get-buffer "*scratch*"))
    
    (princ "╔═════════════════════╗" (get-buffer "*scratch*"))
    (terpri (get-buffer "*scratch*"))
    
    (princ
     (concat 
      (substring "          " *movement*) 

      (nth
       rng-move
       (cdr pet-gfx)))

 
     (get-buffer "*scratch*"))
    
    (terpri (get-buffer "*scratch*"))
        

    (princ "╚═════════════════════╝" (get-buffer "*scratch*"))

;;    (terpri (get-buffer "*scratch*"))

    (princ (symbol-value (nth 1 (assoc *hearts* +heart-list+)))
	   (get-buffer "*scratch*"))

    (terpri (get-buffer "*scratch*"))

    (princ
     (concat "high score: "
	     (number-to-string *total-points*))
     (get-buffer "*scratch*"))))

(defun one-frame-of-animation (total-points)

  (blank-and-draw-frame-dev (pet-gfx-lookup total-points)))

(defun blank-and-draw-frame-dev (pet-gfx)
  (set-buffer "*scratch*")
  (erase-buffer)
  (pet-movement pet-gfx))

(defun pet-gfx-lookup (total-points)
  (assoc 'gfx
	 (symbol-value
	  (points-to-evolution total-points))))

(defun points-to-evolution (total-points)
  (dolist (points +pet-evolution-tree+)
    (if (> (car points) total-points)
	(return
	 (nth 1
	  (assoc (car points) +pet-evolution-tree+))))))

(defun randomly-allocate-needs ()
  (funcall (nth (random 3) +pet-needs+)))

(defun uwu-hunger ()
  (unless
      (= *hearts* 0.0)
    (setf *hearts* (- *hearts* 0.5)))
  
  (when
      (= *hearts* 0.0)
    (decf *total-points*)))

(defun uwu-toilet ()
  (unless
      (= *toilet* 4)
    (setf *toilet* (+ *toilet* 1)))
  
  (when
      (= *toilet* 4)
    (decf *total-points*)))

;; ┌┬┐┬┌┬┐┌─┐┬─┐┌─┐
;;  │ ││││├┤ ├┬┘└─┐
;;  ┴ ┴┴ ┴└─┘┴└─└─┘

(defun uwu-visualiser ()
  (run-with-idle-timer 0.5 0.5 #'uwu-animation-loop))

(defun uwu-animation-loop ()
  (one-frame-of-animation *total-points*))

(defun uwu-digest ()
  (run-with-idle-timer +fifteen-minutes+ +fifteen-minutes+ #'uwu-hunger))

(defun uwu-ablute ()
  (run-with-idle-timer +twenty-minutes+ +twenty-minutes+ #'uwu-toilet))

;; ┬ ┬┌─┐┌─┐┬─┐ 
;; │ │└─┐├┤ ├┬┘ 
;; └─┘└─┘└─┘┴└─ 
;; ┬┌┐┌┌─┐┬ ┬┌┬┐
;; ││││├─┘│ │ │ 
;; ┴┘└┘┴  └─┘ ┴ 

(defun uwu-feed ()
  (interactive)
  (if (< *hearts* 4.0)  
      (incf *total-points*))
  (setf *hearts* 4.0))

(defun uwu-clean-up ()    
  (interactive)
  (if (> *toilet* 0)
      (incf *total-points*))
    (setf *toilet* 0))




;;        ς  ξ  ς                        ς
;;        Δ  Δ  Δ                        Δ                    
;; ╔═════════════════════╗    ╔═════════════════════╗    ╔═════════════════════╗
;;   (- ｡▼皿▼)-                    ↑_(Φ‿Φ )Ψ                  (∿*Φ ω Φ*)∿
;; ╚═════════════════════╝    ╚═════════════════════╝    ╚═════════════════════╝
;;      ♥♥♥♥♥♥♥♥             ♥♥♥♥♥♡♡♡              ♥♥♡♡♡♡♡♡

