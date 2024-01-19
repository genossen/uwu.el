;;; uwu.el --- A virtual pet for GNU Emacs.

;; Copyright (C) 2023 Blair Vidak

;; Author: Blair Vidakovich <vidak@riseup.net>
;; Keywords: game
;; Version: 3

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; -*-

;; ╦ ╦╦ ╦╦ ╦ ╔═╗╦  
;; ║ ║║║║║ ║ ║╣ ║  
;; ╚═╝╚╩╝╚═╝o╚═╝╩═╝

;; -*-

;;; Commentary:

;; This is a virtual pet for GNU Emacs. You can feed, clean, and play
;; with your pet. There are, in all, 10 different 'evolutions' of pet.

;; Looking after your pet well will make it live longer, and allow you
;; to evolve into a final 'secret' pet species.

;; This time around, the care that you put into looking after your pet
;; determines whether it becomes 'chaotic' or 'lawful'.

;;; Code:

(load "../gfx/chaotic/pack-0.el")
(load "../mvc/controller.el")
(load "../mvc/model.el")
(load "../mvc/view.el")

(require 'uwu-pet-view)

;; ┌┬┐┌─┐ ┬┌─┐┬─┐ 
;; │││├─┤ ││ │├┬┘ 
;; ┴ ┴┴ ┴└┘└─┘┴└─ 
;; ┌┬┐┌─┐┌┬┐┌─┐   
;; ││││ │ ││├┤    
;; ┴ ┴└─┘─┴┘└─┘   
;; ┌─┐┌─┐┌┬┐┬ ┬┌─┐
;; └─┐├┤  │ │ │├─┘
;; └─┘└─┘ ┴ └─┘┴  

(defconst uwu-version "3.0.0"
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
  (uwu-init)
  (uwu-main-loop))

;; ┌─┐┌─┐┌─┐┬┌─┌─┐┌─┐┌─┐
;; ├─┘├─┤│  ├┴┐├─┤│ ┬├┤ 
;; ┴  ┴ ┴└─┘┴ ┴┴ ┴└─┘└─┘

;; provide package

(provide 'uwu)

;;; uwu.el ends here
