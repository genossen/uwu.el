
;;; ┬ ┬┬ ┬┬ ┬ ┌─┐┬  
;;; │ │││││ │ ├┤ │  
;;; └─┘└┴┘└─┘o└─┘┴─┘

;; Version 2.
;; By ~vidak.

;; This program is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see
;; <https://www.gnu.org/licenses/>.

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

(defconst uwu-version "2.0.0"
  "Current version of uwu.")

(defgroup uwu nil
  "A virtual pet simulator."
  :prefix "uwu-"
  :group 'games)

(defcustom uwu-mode-hook nil
  "Hook run when entering uwu mode."
  :type 'hook
  :group 'uwu)

(define-derived-mode uwu-mode special-mode "uwu"
  "The major mode of the uwu virtual pet simulator."
  :group 'uwu)

(defun uwu-mode ()
  "Major mode for entering the uwu virtual pet simulator."
  (interactive)
  (setf major-mode 'uwu-mode)
  (setf mode-name "uwu")
  (uwu-init))

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
(defvar *hours-awake-asleep*
  (list 0 0))
(defvar *asleep* nil)
;; ┬┌┐┌┬┌┬┐
;; │││││ │ 
;; ┴┘└┘┴ ┴

(defun uwu-init ()
  (setf *hearts* 4.0)
  (setf *toilet* 0)
  (setf *total-points* -10)
  (get-buffer-create "*uwu*")
  (switch-to-buffer "*uwu*")
  (uwu-visualiser)
  (uwu-needs))

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
	   (get-buffer "*uwu*"))

;;    (terpri (get-buffer "*uwu*"))
    
    (princ "╔═════════════════════╗" (get-buffer "*uwu*"))
    (terpri (get-buffer "*uwu*"))
    
    (princ
     (concat 
      (substring "          " *movement*) 

      (nth
       rng-move
       (cdr pet-gfx)))

 
     (get-buffer "*uwu*"))
    
    (terpri (get-buffer "*uwu*"))
        

    (princ "╚═════════════════════╝" (get-buffer "*uwu*"))

;;    (terpri (get-buffer "*uwu*"))

    (princ (symbol-value (nth 1 (assoc *hearts* +heart-list+)))
	   (get-buffer "*uwu*"))

    (terpri (get-buffer "*uwu*"))

    (princ
     (concat "high score: "
	     (number-to-string *total-points*))
     (get-buffer "*uwu*"))))

(defun one-frame-of-animation (total-points)

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
  (dolist (points +pet-evolution-tree+)
    (if (> (car points) total-points)
	(return
	 (nth 1
	  (assoc (car points) +pet-evolution-tree+))))))

(defun randomly-allocate-needs ()
  (funcall (nth (random 2) +pet-needs+)))

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
  (run-with-timer 0.5 0.5 #'uwu-animation-loop))

(defun uwu-animation-loop ()
  (one-frame-of-animation *total-points*))

(defun uwu-needs ()
  (run-with-timer +fifteen-minutes+ +fifteen-minutes+ #'randomly-allocate-needs))

(defun uwu-day-night-cycle ()
  (run-with-timer +one-hour+ +one-hour+ #'circadian-rhythm))

(defun points-to-hours-asleep (total-points)
  (dolist (points +pet-evolution-tree+)
    (if (> (car points) total-points)
	(return
	 (nth 2
	  (assoc (car points) +pet-evolution-tree+))))))

(defun circadian-rhythm (hours-asleep)
  (while (not *asleep*)
    (incf (nth 0 *hours-awake-asleep*))
    (if	(= (- 24 hours-asleep)
	   (nth 0 *hours-awake-asleep*))
	(setf *asleep* 't)
      (setf (nth 0 *hours-awake-asleep*) 0)))
  (while *asleep*
    (incf (nth 1 *hours-awake-asleep*))
    (if
	(= hours-asleep (nth 1 *hours-awake-asleep*))
	(setf *asleep* nil)
      (setf (nth 1 *hours-awake-asleep*) 0))))


  
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

