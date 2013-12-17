#lang racket
(define-struct perl (symb perlx description))
(define a (perl "symb" "perlx" "description"))
(define (perl->js a-perl)
  (string-append
   "var "
   (perl-symb a-perl)
   " = new perl(\""
   (perl-symb a-perl)
   "\",\""
   (perl-perlx a-perl)
   "\",\""
   (perl-description a-perl)
   "\");"))

(define k (perl->js a))

;; To write k out in a form readable by javascript
;; use this:
#; (define out (open-output-file "data.js"))
;; Use display to remove the '\' from before all embedded ' " '.
#; (display k out)
#; (close-output-port out)

;; to get a list of all definitions from this file
#; (module->export "JSON-export.rkt")