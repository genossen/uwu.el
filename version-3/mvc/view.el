
;; ╦  ╦╦╔═╗╦ ╦╔═╗
;; ╚╗╔╝║║╣ ║║║╚═╗
;;  ╚╝ ╩╚═╝╚╩╝╚═╝

(require 'uwu-graphics-v3)
(require 'uwu-pet-controller)
(require 'uwu-pet-model)

;; ┌─┐┌─┐┌┬┐  ┬┌┬┐┬  ┌─┐
;; ├─┘├┤  │   │ │││  ├┤ 
;; ┴  └─┘ ┴   ┴─┴┘┴─┘└─┘

(defun pet-idle-movement (pet-gfx)

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
	   (get-buffer-create "*uwu*"))

;;    (terpri (get-buffer-create "*uwu*"))
    
    (princ "╔═════════════════════╗" (get-buffer-create "*uwu*"))
    (terpri (get-buffer-create "*uwu*"))
    
    (princ
     (concat 
      (substring "          " *movement*) 

      (nth
       rng-move
       (cdr pet-gfx)))
     (get-buffer-create "*uwu*"))

 ;;   (substring "" (- 10 *movement* (nth rng-move (cdr pet-gfx))
    
    (terpri (get-buffer-create "*uwu*"))
        

    (princ "╚═════════════════════╝" (get-buffer-create "*uwu*"))

    (terpri (get-buffer-create "*uwu*"))

    (princ (symbol-value (nth 1 (assoc *hearts* +heart-list+)))
	   (get-buffer-create "*uwu*"))

    (terpri (get-buffer-create "*uwu*"))

    (princ "messages: " (get-buffer-create "*uwu*"))
    (princ *uwu-player-messages* (get-buffer-create "*uwu*"))

       (terpri (get-buffer-create "*uwu*"))

    (princ "hunger: " (get-buffer-create "*uwu*"))
    (princ *hungry* (get-buffer-create "*uwu*"))


       (terpri (get-buffer-create "*uwu*"))
    (princ "asleep: " (get-buffer-create "*uwu*"))
     
    (princ   *asleep* (get-buffer-create "*uwu*"))

   (terpri (get-buffer-create "*uwu*"))
    
    (princ "lights: " (get-buffer-create "*uwu*"))
    (princ *lights* (get-buffer-create "*uwu*"))

   (terpri (get-buffer-create "*uwu*"))
    
    (princ "attention: " (get-buffer-create "*uwu*"))
    (princ *attention* (get-buffer-create "*uwu*"))

   (terpri (get-buffer-create "*uwu*"))
    
    (princ "attention-flag: " (get-buffer-create "*uwu*"))
    (princ *attention-flag* (get-buffer-create "*uwu*"))

   (terpri (get-buffer-create "*uwu*"))
    
    (princ "neglect: " (get-buffer-create "*uwu*"))
    (princ *neglect* (get-buffer-create "*uwu*"))

   (terpri (get-buffer-create "*uwu*"))
    
    (princ "free neglects: " (get-buffer-create "*uwu*"))
    (princ *free-neglects* (get-buffer-create "*uwu*"))

   (terpri (get-buffer-create "*uwu*"))
    
    (princ "character: " (get-buffer-create "*uwu*"))
    (princ *character* (get-buffer-create "*uwu*"))

   (terpri (get-buffer-create "*uwu*"))

    (princ "hearts: " (get-buffer-create "*uwu*"))
    (princ *hearts* (get-buffer-create "*uwu*"))

  (terpri (get-buffer-create "*uwu*"))
    
    (princ "poops: " (get-buffer-create "*uwu*"))
    (princ *toilet* (get-buffer-create "*uwu*"))
    
    ))
     

;; (princ
;;      (concat "neglect: "
;; 	     *neglect*)
;;      (get-buffer-create "*uwu*"))

;; (princ
;;      (concat "free-neglects: "
;; 	     *free-neglects*)
;;      (get-buffer-create "*uwu*"))
;; (princ
;;      (concat "character: "
;; 	     *character*)
	  ;;      (get-buffer-create "*uwu*"))

;; ┌─┐┌─┐┌┬┐  ┌─┐┌─┐┬  ┌─┐┌─┐┌─┐
;; ├─┘├┤  │   ├─┤└─┐│  ├┤ ├┤ ├─┘
;; ┴  └─┘ ┴   ┴ ┴└─┘┴─┘└─┘└─┘┴ 

;; light on

;; light off

;; ┌─┐┌─┐┌┬┐┌─┐┌─┐
;; │ ┬├─┤│││├┤ └─┐
;; └─┘┴ ┴┴ ┴└─┘└─┘

;; left or right
;; higher or lower

(provide 'uwu-pet-view)
