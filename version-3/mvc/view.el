
;; ╦  ╦╦╔═╗╦ ╦╔═╗
;; ╚╗╔╝║║╣ ║║║╚═╗
;;  ╚╝ ╩╚═╝╚╩╝╚═╝

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

    (terpri (get-buffer "*uwu*"))

    (princ (symbol-value (nth 1 (assoc *hearts* +heart-list+)))
	   (get-buffer "*uwu*"))

    (terpri (get-buffer "*uwu*"))

    (princ "messages: " (get-buffer "*uwu*"))
    (princ *uwu-player-messages* (get-buffer "*uwu*"))

    (princ "hunger: " (get-buffer "*uwu*"))
    (princ *hungry* (get-buffer "*uwu*"))

    (princ "asleep: " (get-buffer "*uwu*"))
     
    (princ   *asleep* (get-buffer "*uwu*"))

    (princ "lights: " (get-buffer "*uwu*"))
    (princ *lights* (get-buffer "*uwu*"))

    (princ "attention: " (get-buffer "*uwu*"))
    (princ *attention* (get-buffer "*uwu*"))

    (princ "attention-flag: " (get-buffer "*uwu*"))
    (princ *attention-flag* (get-buffer "*uwu*"))

    (princ "neglect: " (get-buffer "*uwu*"))
    (princ *neglect* (get-buffer "*uwu*"))

    (princ "free neglects: " (get-buffer "*uwu*"))
    (princ *free-neglects* (get-buffer "*uwu*"))

    (princ "character: " (get-buffer "*uwu*"))
    (princ *character* (get-buffer "*uwu*"))
    
    ))
     

;; (princ
;;      (concat "neglect: "
;; 	     *neglect*)
;;      (get-buffer "*uwu*"))

;; (princ
;;      (concat "free-neglects: "
;; 	     *free-neglects*)
;;      (get-buffer "*uwu*"))
;; (princ
;;      (concat "character: "
;; 	     *character*)
	  ;;      (get-buffer "*uwu*"))

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
