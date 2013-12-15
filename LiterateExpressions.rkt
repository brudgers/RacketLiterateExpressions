#lang scribble/lp

@title{Literate Expressions}
This project grows out of my first open source project - a quick and dirty port of VerbalExpressions to Racket in August, 2013.
The @link["https://github.com/VerbalExpressions"]{VerbalExpressions} project was started by @link["https://github.com/jehna"]{jehna} in JavaScript. The idea behind VerbalExpressions is to create a more readable syntax for Regex's. 

The question quickly arose as to what a VerbalExpression ought to be: does the set of VerbalExpressions include shorthand for commonly used patterns such as URL's and Dates, or is it intended to provide a language isomorphic with that of Regex's.

As my understanding of Regex's increased, my opinion became that the former is an endless pit of hurt and argument - a Regex for Date is not one thing but many, each depending upon the cultural context. On the other hand, it seems that the base idea of more readable syntax for Regular expressions can't really hurt anyone, at least so long as those authoring it are ok if their work is ignored. My initial thought was that "VerboseExpressions" caught the flavor of what I was after, but fortunately after a little initial effort the project moved to the back burner.


@section{Using Racket}
Now that it has come back [for a time at least] into the kitchen, the bigger idea is to take a literate programming approach to the project. Thus, the name "LiterateExpressions," captures both the flavor of the project and my approach to coding it up. This means that in part, LiterateExpressions is an exercise in using Racket's scribble documentation language and exploring it's domain specific subset for literate programming.

@chunk[<le_requires>
       (require "Lexp-structures.rkt")
       (require "Lexp-implementation.rkt")
       (require "Perl-Modifiers.rkt")]

@chunk[<le_provide>
       (provide (all-defined-out))]
                                      
@chunk[<*>
       <le_requires>
       <le_provide>
       ]

Main chunk is required for normal access to code using @code{scribble/lp}. When rendered with the default output, this unfortunately makes the document a little messy than I would like. Oh well.


       
       
       