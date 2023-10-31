
;;; ┬ ┬┬ ┬┬ ┬ ┌─┐┬  
;;; │ │││││ │ ├┤ │  
;;; └─┘└┴┘└─┘o└─┘┴─┘

;; Version 2.

;; Major bug fix release.

;; 2022-September-16.

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

(load-file "uwu-graphics-v2.el")

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

;; ┬┌┐┌┬┌┬┐
;; │││││ │ 
;; ┴┘└┘┴ ┴

(defun uwu-init ()
  (setf *hearts* 4.0)
  (setf *toilet* 0)
  (setf *total-points* 1)
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
	   (cl-decf *movement*))       

	  ((and
	    (= 4 rng-move)
	    (< *movement* 9))

	   (cl-incf *movement*)))

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

;   (terpri (get-buffer "*uwu*"))

    (princ (symbol-value (nth 1 (assoc *hearts* +heart-list+)))
	   (get-buffer "*uwu*"))

    (terpri (get-buffer "*uwu*"))

    (princ
     (concat "high score: "
	     (number-to-string *total-points*))
     (get-buffer "*uwu*"))))

(defun one-frame-of-animation (total-points)

  (blank-and-draw-frame-dev (pet-gfx-lookup total-points)))

(defun blank-and-draw-frame-dev (pet-gfx)
  (set-buffer "*uwu*")
  (erase-buffer)
  (pet-movement pet-gfx))

(defun pet-gfx-lookup (total-points)
  (assoc 'gfx
	 (points-to-evolution total-points)))

(defun points-to-evolution (total-points)
  (symbol-value
   (nth 1 (car
	   (cl-loop for lookup in +pet-evolution-tree+
		    when (< total-points (car lookup))
		    collect lookup)))))



(defun randomly-allocate-needs ()
  (funcall (nth (random 2) +pet-needs+)))

(defun uwu-hunger ()
  (unless
      (= *hearts* 0.0)
    (setf *hearts* (- *hearts* 0.5)))
  
  (when
      (= *hearts* 0.0)
    (cl-decf *total-points*)))

(defun uwu-toilet ()
  (unless
      (= *toilet* 4)
    (setf *toilet* (+ *toilet* 1)))
  
  (when
      (= *toilet* 4)
    (cl-decf *total-points*)))

;; ┌┬┐┬┌┬┐┌─┐┬─┐┌─┐
;;  │ ││││├┤ ├┬┘└─┐
;;  ┴ ┴┴ ┴└─┘┴└─└─┘

(defun uwu-visualiser ()
  (run-with-timer 1 1 #'uwu-animation-loop))

(defun uwu-animation-loop ()
  (one-frame-of-animation *total-points*))

(defun uwu-needs ()
  (run-with-timer +five-minutes+ +five-minutes+ #'randomly-allocate-needs))

;; (defun uwu-ablute ()
;;  (run-with-idle-timer +twenty-minutes+ +twenty-minutes+ #'uwu-toilet))

;; ┬ ┬┌─┐┌─┐┬─┐ 
;; │ │└─┐├┤ ├┬┘ 
;; └─┘└─┘└─┘┴└─ 
;; ┬┌┐┌┌─┐┬ ┬┌┬┐
;; ││││├─┘│ │ │ 
;; ┴┘└┘┴  └─┘ ┴ 

(defun uwu-feed ()
  (interactive)
  (if (< *hearts* 4.0)  
      (cl-incf *total-points*))
  (setf *hearts* 4.0))

(defun uwu-clean-up ()    
  (interactive)
  (if (> *toilet* 0)
      (cl-incf *total-points*))
    (setf *toilet* 0))




;;        ς  ξ  ς                        ς
;;        Δ  Δ  Δ                        Δ                    
;; ╔═════════════════════╗    ╔═════════════════════╗    ╔═════════════════════╗
;;   (- ｡▼皿▼)-                    ↑_(Φ‿Φ )Ψ                  (∿*Φ ω Φ*)∿
;; ╚═════════════════════╝    ╚═════════════════════╝    ╚═════════════════════╝
;;      ♥♥♥♥♥♥♥♥             ♥♥♥♥♥♡♡♡              ♥♥♡♡♡♡♡♡

CAPITALS.
