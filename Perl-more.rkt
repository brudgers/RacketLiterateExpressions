#lang scribble/lp

@section{Metacharacter Definitions}

From the Racket Documentaiton:

When we want a literal \ inside a Racket string or regexp literal, we must escape it so that it shows up in the string at all. Racket strings use \ as the escape character, so we end up with two \s: one Racket-string \ to escape the regexp \, which then escapes the .. Another character that would need escaping inside a Racket string is ".




(define (veQuote str)
  (string-append "\\" str))

(define beginning-of-line "^")

(define any-character  ".") ;; except new-line

(define end-of-line "$")

(define begin-alternates "(")

(define end-alternates ")")

(define end-alternate "|")

(define begin-group "(")

(define end-group ")")

(define begin-class "[")

(define end-class "]")

;; Quantifiers

(define match-zero-or-more "*")

(define match-one-or-more "+")

(define match-one-or-zero "?")

(define (match-exactly-times n)
  (string-append "{"
                 (number->string n)
                 "}"))

(define (match-at-least-times n)
  (string-append "{"
                 (number->string n)
                 ",}"))

(define (match-between-times n m)
  (string-append "{"
                 (number->string n)
                 ","
                 (number->string n)
                 "}"))

(define (match-at-most-times m)
  (string-append "{,"
                 (number->string m)
                 "}"))

;; need possive !!!
;;      'aaaa' =~ /a++a/
;; will never match, as the a++ will gobble up 
;; all the a 's in the string and won't leave 
;; any for the remaining part of the pattern


@section{Escape Sequence Definitions}



(define tab "\\t")

(define newline "\\n")

(define return "\\r")

(define formFeed "\\f")

(define alarm "\\a")

(define escape "\\e")

(define controlChar "\\cK")

;; !!!
;; hexadecimal

;; !!!
;; named unicode character

;; !!!
;; unicode character

;; !!!
;; charcter whose ordinal is an octal

(define lowerCaseCharacterNext "\\l")

(define upperCaseCharacterNext "\\u")

(define lowerCaseUntilEnd "\\L")

(define upperCaseUntilEnd "\\U")

(define quoteUntilEnd "\\Q")

(define endEscape "\\E")


@section{Character Class Definitions}



;; !!! needs to be a macro
(define (bracketedClass rgx)
  (string-append "["
                 rgx
                 "]"))

(define (posixClass pc)
  (string-append "[[:"
                 pc
                 ":]]"))

;; !!! future use
;; extended bracketed character
;; class















