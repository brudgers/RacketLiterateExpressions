#lang scribble/lp

@section{Lexp Implementation - Unstable}

@code{Lexp-implementation.rkt} contains the base functions and macros for building literate experssions.It [more or less] follows the implementation for Racket VerbalExpressions.

@emph{Because I am not sure how well it aligns with the goals of LiterateExpressions, this should be considered untsable}

@chunk[<LiterateExpressions_implementation>
       <lexp-implementation-requires>
       <exports>
       <implementation-variables>
       <implementation-accessors>
       <beginCapture>
       <endCapture>
       <regex>
       <withAnyCase>
       <matchCase>
       <OR>]

@chunk[<lexp-implementation-requires>
       (require "Lexp-structures.rkt")]

@subsection{Variables}
The base variables are @code{string}. These store the various parts of the string representing the Regex as it is built up. @emph{Because this implementation uses mutation and strings, it is likely to change}

Each variable is initialized to the empty string. 

@chunk[<implementation-variables>
       (define ve-prefix "")     ;initalize to empty string
       (define ve-source "")     ;initalize to empty string
       (define ve-suffix "")     ;initalize to empty string
       (define ve-modifiers "")  ;initalize to empty string
       ] 
        
These variables are not exported.
        
@chunk[<exports>
       (provide 
        (except-out (all-defined-out)
                    ve-prefix
                    ve-source
                    ve-suffix
                    ve-modifiers))]

Each variable has an accessor.

@chunk[<implementation-accessors>
       (define (ve-prefix! v)
         (set! ve-prefix v))
       
       (define (ve-source! v)
         (set! ve-source v))
       
       (define (ve-suffix! v)
         (set! ve-suffix v))
       
       (define (ve-modifiers! v)
         (set! ve-modifiers v))]

@subsection{Macros}

The use of Macros is one of the areas where a Racket Implementation will differ substantially from implementations in many other languages. On the other hand, it offers a template for anyone Implementing LiterateExpressions on another Lisp.

Starts the collection of string data.

@code{(listof Function) -> String SideEffects}

@chunk[<beginCapture>
       (define-syntax-rule (beginCapture a ...)
         (begin (reset) a ...))]

Returns the string representing the LiterateExpression.

@code{ _ -> String}

@chunk[<endCapture>
       (define-syntax-rule (endCapture)
         (string-append ve-prefix
                        ve-source
                        ve-suffix
                        ve-modifiers))]

@code{endCapture} has an alias to be consistent with VerbalExpressions:

@chunk[<regex>
       (define (regex)
         (endCapture))]



Modifier flag to make pattern matching case insensitive.

@code{(listof fn) -> String}

@chunk[<withAnyCase>
(define-syntax-rule (withAnyCase a ...)
  (let ((src ve-source))
    (ve-source!
     (string-append src 
                    "(?i:"
                    (begin a
                           ...
                           (regex))
                    ")"))))]

Modifier flag to make pattern matching case sensitive.

@code{(listof fn) -> String}

@chunk[<matchCase>
(define-syntax-rule (matchCase a ...)
  (let ((src ve-source))
    (ve-source!
     (string-append src 
                    "(?-i:"
                    (begin a
                           ...
                           (regex))
                    ")"))))]

@subsubsection{Alternative Expressions}

These were renamed from the original VerbalExpression implementation in JavaScript

Renamed from "or" to "OR" to avoid conflict with Racket's built-in @code{or} special form. It's a bit of a kludge, perhaps, but there are not a lot of simple alternatives.

@code{(listof Function) -> String SideEffects}

@chunk[<OR>
(define-syntax-rule (OR a ...)
  (let ((src (regex))) ;; save the existing regex
    (reset)
    (ve-source!
     (string-append "(" src ")|(" ; rebuild existing regex
                    (begin a ... )
                    ")"))))]

















       
       
       