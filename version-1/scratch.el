;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

(defvar movement 0)

(defconst +egg-data+
  (list
   "."
   "｡"
   "ₒ"
   "o"
   "O"))



(defun pet-movement (pet-gfx)

  (let ((rng-move (random 5)))

    (cond ((and (= 3 rng-move) (> movement 0)) (decf movement))
	  ((and (= 4 rng-move) (< movement 9)) (incf movement)))

    (print
     (concat
      (substring "         " movement)
      (nth rng-move pet-gfx))
     (get-buffer "*scratch*"))))


(defun egg-life ()
  (set-buffer "*scratch*")
  (erase-buffer)
  (pet-movement +egg-data+))

(defun egg-loop ()
  (run-with-timer 1 10 'egg-life))

(egg-loop)

(egg-life)

;;; (cdar +babby-data+)

;;; (cdadr +babby-data+)

