
;;; ┬ ┬┬ ┬┬ ┬ ┌─┐┬  
;;; │ │││││ │ ├┤ │  
;;; └─┘└┴┘└─┘o└─┘┴─┘

;; Version 1.
;; By: ~vidak

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

;; Here we load in the s-exp of graphics and pet data. Much of this
;; programme is just about traversing the different nodes of the tree
;; of lists in 'uwu-graphics', and pulling out bits of it that are
;; relevant to the overall state of the virtual pet game.

(load "~/hobbies/uwu/version-1/uwu-graphics.el")

;; ┬┌─┌─┐┬ ┬┌┬┐┌─┐┌─┐
;; ├┴┐├┤ └┬┘│││├─┤├─┘
;; ┴ ┴└─┘ ┴ ┴ ┴┴ ┴┴  

;; When in uwu-mode, each of these keyboard letters will produce a
;; different side effect caused by evaluating each respective
;; function.

;; This virtual pet game is made up of two buffers: the
;; 'human-pet-interaction' buffer, and the 'visualiser' buffer. The
;; top buffer shows you the animated behaviour of your pet, and the
;; bottom one displays help messages and other important pieces of
;; information that the pet indicates to you, the human.

(defvar uwu-mode-map nil "Keymap for `uwu-mode'.")

(progn
  (setq uwu-mode-map (make-sparse-keymap))
;;  (define-key uwu-mode-map (kbd "r") #'uwu--previous-pet)
;;  (define-key uwu-mode-map (kbd "s") #'uwu--next-pet)
  (define-key uwu-mode-map (kbd "t") #'uwu--print-pet-types)
  (define-key uwu-mode-map (kbd "w") #'uwu--window-setup)
  (define-key uwu-mode-map (kbd "h") #'uwu--help)
  (define-key uwu-mode-map (kbd "a") #'uwu--choose-alignment)
  (define-key uwu-mode-map (kbd "s") #'uwu--choose-skill)
  (define-key uwu-mode-map (kbd "g") #'uwu--choose-genus))

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

;; ┬  ┬┌─┐┬─┐┬┌─┐┌┐ ┬  ┌─┐┌─┐
;; └┐┌┘├─┤├┬┘│├─┤├┴┐│  ├┤ └─┐
;;  └┘ ┴ ┴┴└─┴┴ ┴└─┘┴─┘└─┘└─┘

(defvar *movement* 0)

(defvar *alignment-idle* 'lawful)
(defvar *skill-idle* 'smart)
(defvar *genus-idle* 'normie)

;; ┌─┐┬ ┬┌┐┌┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
;; ├┤ │ │││││   │ ││ ││││└─┐
;; └  └─┘┘└┘└─┘ ┴ ┴└─┘┘└┘└─┘

;; *******************************
;; * THE FUNCTION 'PET-MOVEMENT' *
;; *******************************

;; This is the 'core' of the programme. There is quite a bit rolled
;; into this single function.

;; The single argument that is passed to this function is 'pet-gfx',
;; which is the key-value store for the five frames of animation for a
;; specific (adult) pet in the tree of lists in 'uwu-graphics.el'.

(defun pet-movement (pet-gfx)

  (let ((rng-move (random 5))) ; The body of this function uses a
			       ; 'let' form. Here we initialise the
			       ; variable 'rng-move' with a random
			       ; integer value from 0 to 4. This gives
			       ; us the five (5) pet movement
			       ; positions. 
    
;; If you look at the 'gfx' field of a pet in 'uwu-graphics.el', you
;; will see that the 0th to 2nd frames do not move the pet left or
;; right, but instead display frames with the pet facing different
;; directions.

;; Looking at the 3rd and 4th frames, these correspond to the pet
;; moving right and left respectively.
    

    (cond ((and                     ; This cond macro tests for
				    ; whether 'rng-move' is either 3
				    ; or 4, and whether the pet has
				    ; reached the limits of the visualiser. 
	    (= 3 rng-move)
	    (> *movement* 0))       ; Here, so long as the pet is
				    ; beyond the left-most limit, and
				    ; the pet is facing right...

	   (decf *movement*))       ; the variable *movement* is
				    ; decremented by one.

	  ((and
	    (= 4 rng-move)          ; Here, it is the reverse. If the
				    ; pet is facing left, and has not
				    ; reached the upper limit of the
				    ; visualiser... 
	    (< *movement* 9))

	   (incf *movement*)))      ; The variable is incremented.

    (princ "╔═════════════════════╗" (get-buffer "*uwu-visualiser*"))
    (terpri (get-buffer "*uwu-visualiser*"))

;; Below, we use some simple string manipulation to animate each
;; particular frame of the pet. The code is a large bundled-up 'princ'
;; expression.
    
    (princ
     (concat ; (1)
      (substring "         " *movement*) ; (2)

;;; See immediately above? We (1) concatenate a string holding nothing
;;; but 9 spaces, from which (2) we subtract the number of spaces the
;;; *movement* variable has been calculated to hold.

      (nth
       rng-move
       (cdr pet-gfx)))

;; Above, we use the local variable 'rng-move' set above by 'let' to
;; choose the appropriate frame of animation with 'nth' from the
;; key-value store of graphics we passed to the function as one of its
;; arguments. This will either select frames 0 to 4.

;; You will notice here we use the CDR of the gfx key-value field,
;; which gives us the graphics, and eliminates the 'key' element.
    
     (get-buffer "*uwu-visualiser*")) ; The large 'princ' expression
				      ; ends here.
    (terpri (get-buffer "*uwu-visualiser*"))
        

    (princ "╚═════════════════════╝" (get-buffer "*uwu-visualiser*"))))

;; *****************************
;; * THE FUNCTION:             *
;; * ADULT PET GRAPHICS LOOKUP *
;; *****************************

(defun adult-pet-gfx-lookup (alignment skill genus)
      
    (assoc 'gfx
	   (assoc genus
		  (assoc skill
			 (assoc alignment +adult-data+)))))

;; Given three arguments, these four nested 'assoc' functions take the
;; symbols passed to this function and retrieve the desired pet
;; graphics from the tree of lists in 'uwu-graphics.el'. Moving from
;; right to left, you can see that the lists of pet data are traversed
;; from the top of the three to the bottom, from most general to most
;; specific.

;; ***********************
;; * THE FUNCTION:       *
;; * SWITCH PET GRAPHICS *
;; ***********************

(defun switch-pet-gfx (alignment skill genus)

  (pet-movement (adult-pet-gfx-lookup alignment skill genus)))

;; This function is a combination of the two most important functions
;; in this version of uwu.el. Again, from right to left, 'gfx-lookup'
;; finds the graphics key-value store in the big tree of pet data, and
;; feeds it to 'pet-movement', so that one frame of animation may be
;; drawn from a selection of pet from 'uwu-graphics.el'.

;; It doesn't actually ever evaluate/run in uwu.el, but I leave it
;; here as an example for how to assemble the game from simple
;; functions into more composite ones.

(defun blank-and-draw-frame (pet-gfx)
  (set-buffer "*uwu-visualiser*")
  (erase-buffer)
  (pet-movement pet-gfx))

;; This function above is simple, but important. It selects the right
;; buffer to output the pet animation, erases it, and then draws a new
;; frame of pet animation.

(defun one-frame-of-animation (alignment skill genus)

  (blank-and-draw-frame (adult-pet-gfx-lookup alignment skill genus)))

;; This function, as its name implies, will draw one frame of pet
;; animation by combining blank-and-draw-frame with the gfx-lookup
;; function. You select the pet from the tree, and a clean frame of
;; animation is drawn (i.e. the visualiser buffer is blanked, and a
;; fresh frame of pet movement is drawn).

;; *****************
;; * THE FUNCTION: *
;; * WINDOW SETUP  *
;; *****************

(defun uwu--window-setup ()
  (interactive)
  (display-buffer
   (get-buffer-create "*uwu-visualiser*")
                  '(display-buffer-same-window . (())))

  (display-buffer
   (get-buffer-create "*human-pet-interaction*")
   '(display-buffer-below-selected . (()))))

;; This function is somewhat of a kludge. This function is bound to
;; the 'w' key in uwu-mode, and will turn a single buffer into the
;; dual-buffer display that version 1 uses in order to have the user
;; play the game.

;; As yet, I have no idea how to run this function as a 'hook' for
;; uwu-mode, so that when you run 'M-x uwu', it sets up the windows
;; and starts animating the pet for you, given the initial conditions
;; (see variable definitions above).

;; I suspect that I simply have to make a function called 'uwu' that
;; you can call with M-x, and fill it with the expressions that set up
;; the game.

;; ******************
;; * THE FUNCTION:  *
;; * UWU VISUALISER *
;; ******************

(defun uwu-visualiser (alignment-idle skill-idle genus-idle)
  (run-with-idle-timer 0.5 0.5 #'one-frame-of-animation alignment-idle skill-idle genus-idle))

;; This function above calls 'one-frame-of-animation' (from above)
;; every 0.5 seconds, repeating endlessly, until the timer is
;; cancelled. This is the main function that animates the pet inside
;; the 'pet-visualiser' buffer. Pass it the pet you select from the
;; tree of lists, and it animates it.

;; ******************
;; * THE FUNCTIONS: *
;; * UWU CHOOSE ... *
;; ******************

(defun uwu--choose-alignment ()
  (interactive)
  
  (cancel-function-timers #'one-frame-of-animation)

  (setq *alignment-idle*
	(car
	 (read-from-string
	  (completing-read
	   "Choose pet alignment ~ [Tab autocompletes] ~ "
	   '(("lawful" 1)
	     ("chaotic" 2))
	   nil t))))

  (uwu-visualiser *alignment-idle* *skill-idle* *genus-idle*))

(defun uwu--choose-skill ()
  (interactive)
  
  (cancel-function-timers #'one-frame-of-animation)

  (setq *skill-idle*
	(car
	 (read-from-string
	  (completing-read
	   "Choose pet skill ~ [Tab autocompletes] ~ "
	   '(("smart" 1)
	     ("creative" 2)
	     ("social" 3))
	   nil t))))
  (uwu-visualiser *alignment-idle* *skill-idle* *genus-idle*))

(defun uwu--choose-genus ()
  (interactive)
  
  (cancel-function-timers #'one-frame-of-animation)

  (setq *genus-idle*
	(car
	 (read-from-string
	  (completing-read
	   "Choose pet genus ~ [Tab autocompletes] ~ "
	   '(("normie" 1)
	     ("active" 2)
	     ("funny" 3)
	     ("loud" 4))
	   nil t))))
  
  (uwu-visualiser *alignment-idle* *skill-idle* *genus-idle*))

;; These three functions are almost identical, so I should, in the
;; future, find a way to turn them into one generic function. Each of
;; them is evaluated every time the user presses the appropriate key,
;; which brings up a mini-buffer prompt which has auto-completion.

;; The first job of this function is to cancel the previous animation
;; timer function. Don't worry, it will start it again at the end of
;; evaluating the function's body (:

;; From inside to outside, right to left, the Emacs-internal function
;; 'completing-read' provides a prompt to the user, in addition to a
;; key-value store of acceptable inputs that the user can view by
;; pretting [Tab].

;; completing-read is passed to 'read-from-string' which turns the
;; string produced into a symbol, which is able to be assigned to the
;; global variable *genus- *skill- or *alignment-idle*.

;; The car function here is due to a peculiarity of
;; Emacs. Read-from-string will produce a dotted cons cell like so:
;; (abc . 3), which is the symbol derived from the string, and the
;; length of that string in characters. We are only interested in the
;; actual symbol, so we pull it out of the cons cell using 'car'.



;; Abandon all hope ye who enter here.
;;
;; There has to be a better way to display multi-line text messages in
;; a buffer in Emacs...

;; Anywho these two simple functions just print out important and
;; useful information for helping people browse through the pets.

;; They print in the other buffer below the pet-visualiser, the
;; pet-interaction buffer.

(defun uwu--print-pet-types ()
  (interactive)
  (set-buffer "*human-pet-interaction*")
  (erase-buffer)
  (princ "| (Pick one) | (Pick one) | (Pick one) |" (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (princ "| Alignment  | Skill      | Genus      |" (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (princ "|:----------:|:----------:|:----------:|" (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (princ "| Lawful     | Smart      | Normie     |" (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (princ "| Chaotic    | Creative   | Active     |" (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (princ "|            | Social     | Funny      |" (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (princ "|            |            | Loud       |" (get-buffer "*human-pet-interaction*")))

(defun uwu--help ()
  (interactive)
  (set-buffer "*human-pet-interaction*")
  (erase-buffer)
  (princ "" (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (princ "~ uwu.el help dialogue ~" (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (princ "keyboard letter:  ||  action:" (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (princ "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (princ "       h          ||   help dialogue" (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (princ "       t          ||   table of pet types" (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (princ "       a          ||   choose pet alignment" (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (princ "       s          ||   choose pet skill" (get-buffer "*human-pet-interaction*"))
  (terpri (get-buffer "*human-pet-interaction*"))
  (princ "       g          ||   choose pet genus" (get-buffer "*human-pet-interaction*")))

;; This was the little doodle I did of the pet visualiser, so I could
;; work out how I wanted to have the animation buffer appear. I will
;; leave it here because I think it looks rather nifty.

;;; ╔═════════════════════╗
;;; <@(･ω･o< )@     
;;; ╚═════════════════════╝

