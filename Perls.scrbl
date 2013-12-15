#lang scribble/lp

Perl-definitions from
http://perldoc.perl.org/perlre.html

@chunk[<perl_definition>
    (define-struct perl (px desc))]

Modifiers

find ^ and $ anywhere in string
@chunk[<modifier_>
(perl "m" "treat string as multiple lines")]

treat string as single line
means that . matches every character
including "newline"
@chunk[<modifier_>
(perl "s" "treat string as single line")]

using /ms lets . match any character
but also allowing ^ and $ to match just
before and after new lines respectively
@chunk[<modifier_>
(perl "m"s ". matches any character but ^ and $ still match correctly")]

case insensitive matching
@chunk[<modifier_>
(perl "i" "case insensitive")]

allow whitespace and comments
@chunk[<modifier_>
(perl "x" "whitespace and comments allowed")]

preserve strings
@chunk[<modifier_>
(perl "p"reserve
"create $prematch $match $postmatch")]

allow global matching - effects the way
regexp is used rather than the regex
@chunk[<>
(perl "g" "global matching")]

keep current position
effects the way regexp is used rather
than the regex
@chunk[<modifier_>
(perl "p" "keep current position")]

allow ASCII safe unicode matching
@chunk[<modifier_>
(perl "a" "use ASCII safe matching")]

use default character set
problematic
@chunk[<modifier_>
(perl "d" "use default character set")]

use unicode character set
@chunk[<modifier_>
(perl "u" "use Unicode character set")]

use local character set
@chunk[<modifier_>
(perl "l" "use local character set")]

Metacharacters

!!!
@chunk[<>
(define (veQuote str)
(string-append "\\" str))

@chunk[<>
(define beginning-of-line "^")]

@chunk[<>
(define any-character  ".")]  except new-line

@chunk[<>
(define end-of-line "$")]

@chunk[<>
(define begin-alternates "(")]

@chunk[<>
(define end-alternates ")]")]

@chunk[<>
(define end-alternate "|")]

@chunk[<>
(define begin-group "(")]

@chunk[<>
(define end-group ")]")]

@chunk[<>
(define begin-class "[")]

@chunk[<>
(define end-class "]")]

Quantifiers

@chunk[<>
(define match-zero-or-more "*")]

@chunk[<>
(define match-one-or-more "+")]

@chunk[<>
(define match-one-or-zero "?")]

@chunk[<>
(define (match-exactly-times n)
(string-append "{"
(number->string n)
"}"))]

@chunk[<>
(define (match-at-least-times n)
(string-append "{"
(number->string n)
",}"))]

@chunk[<>
(define (match-between-times n m)
(string-append "{"
(number->string n)
","
(number->string n)
"}"))]

@chunk[<>
(define (match-at-most-times m)
(string-append "{,"
(number->string m)
"}"))]

need possive !!!
'aaaa' =~ /a++a/
will never match, as the a++ will gobble up 
all the a 's in the string and won't leave 
any for the remaining part of the pattern


Escape Sequences



@chunk[<>
(define tab "\\t")]

@chunk[<>
(define newline "\\n")]

@chunk[<>
(define return "\\r")]

@chunk[<>
(define formFeed "\\f"])

@chunk[<>
(define alarm "\\a")]

@chunk[<>
(define escape "\\e")]

@chunk[<>
(define controlChar "\\cK")]

!!!
hexadecimal

!!!
named unicode character

!!!
unicode character

!!!
charcter whose ordinal is an octal

@chunk[<>
(define lowerCaseCharacterNext "\\l")]

@chunk[<>
(define upperCaseCharacterNext "\\u")]

@chunk[<>
(define lowerCaseUntilEnd "\\L")]

@chunk[<>
(define upperCaseUntilEnd "\\U")]

@chunk[<>
(define quoteUntilEnd "\\Q")]

@chunk[<>
(define endEscape "\\E")]


Character Classes



!!! needs to be a macro
@chunk[<>
(define (bracketedClass rgx)
(string-append "["
rgx
"]"))]


@chunk[<>
(define (posixClass pc)
(string-append "[[:"
pc
":]]"))]

!!! future use
extended bracketed character
class
