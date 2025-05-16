;;; Sec_1
(deftemplate animal (slot type))

(defrule check_animal_sec1
  "Prints animal type if not dog (Sec_1)"
  (animal (type ?t&~dog))
  =>
  (printout t "Animal type (Sec_1): " ?t crlf))

(defrule pos_int
  "Checks for positive integer (Sec_1)"
  (number ?n)
  (test (and (integerp ?n) (> ?n 0)))
  =>
  (printout t "The number is a positive integer" crlf))

;;; Sec_2
(defrule check_animal_sec2
  "Prints animal type if duck or turtle (Sec_2)"
  (animal (type ?t&duck|turtle))
  =>
  (printout t "Animal type (Sec_2): " ?t crlf))

(deftemplate rect
  (slot height (type INTEGER))
  (slot width (type INTEGER)))

(defrule perimeter
  "Calculates rectangle perimeter (Sec_2)"
  (rect (height ?h) (width ?w))
  =>
  (bind ?p (* 2 (+ ?h ?w)))
  (printout t "Perimeter: " ?p crlf))

;;; Sec_3
(defrule check_animal_sec3
  "Prints animal type if not dog/cat (Sec_3)"
  (animal (type ?t&~dog&~cat))
  =>
  (printout t "Animal type (Sec_3): " ?t crlf))

(defrule Odd_number
  "Checks for odd number (Sec_3)"
  (number ?n)
  (test (= (mod ?n 2) 1))
  =>
  (printout t "The number is odd" crlf))

;;; Sec_4
(deftemplate person
  (slot hair-color
    (type SYMBOL)  ; Enforce case-sensitive symbols (lowercase)
    (allowed-symbols blonde brown black red))  ; Optional: Restrict allowed values
  (multislot name
    (type SYMBOL)  ; Split names into parts (e.g., "John" "Doe")
    (cardinality 2 4))  ; 2-4 name components
  (slot age
    (type INTEGER)
    (test (and (>= ?age 20) (<= ?age 25)))))

(defrule check_color
  "Prints hair color if not black/brown (Sec_4)"
  (person (hair-color ?c&~black&~brown))  ; Case-sensitive match
  =>
  (printout t "Hair color: " ?c crlf))