;;; Sec_1
(deftemplate animal
  (slot type))

(defrule check_animal
  (animal (type ?t&~dog))
  =>
  (printout t "Animal type: " ?t crlf))

(defrule pos_int
  (number ?n)
  (test (and (integerp ?n) (> ?n 0)))
  =>
  (printout t "The number is a positive integer" crlf))

;;; Sec_2
(defrule check_animal
  (animal (type ?t&:(or (eq ?t duck) (eq ?t turtle))))
  =>
  (printout t "Animal type: " ?t crlf))

(deftemplate rect
  (slot height (type INTEGER))
  (slot width (type INTEGER)))

(defrule perimeter
  (rect (height ?h) (width ?w))
  =>
  (bind ?p (* 2 (+ ?h ?w)))
  (printout t "Perimeter: " ?p crlf))

;;; Sec_3
(defrule check_animal
  (animal (type ?t&~dog&~cat))
  =>
  (printout t "Animal type: " ?t crlf))

(defrule Odd_number
  (number ?n)
  (test (oddp ?n))
  =>
  (printout t "The number is odd" crlf))

;;; Sec_4
(deftemplate person
  (slot hair-color)
  (slot name (type SYMBOL STRING) (cardinality 2 4))
  (slot age (type INTEGER) (range 20 25)))

(defrule check_color
  (person (hair-color ?c&~black&~brown))
  =>
  (printout t "Hair color: " ?c crlf))