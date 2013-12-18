#lang scribble/lp


This project grows out of my first open source project - a quick and dirty port of VerbalExpressions to Racket in August, 2013.
The @link["https://github.com/VerbalExpressions"]{VerbalExpressions} project was started by @link["https://github.com/jehna"]{jehna} in JavaScript. The idea behind VerbalExpressions is to create a more readable syntax for Regex's. 

The question quickly arose as to what a VerbalExpression ought to be: does the set of VerbalExpressions include shorthand for commonly used patterns such as URL's and Dates, or is it intended to provide a language isomorphic with that of Regex's.

As my understanding of Regex's increased, my opinion became that the former is an endless pit of hurt and argument - a Regex for Date is not one thing but many, each depending upon the cultural context. On the other hand, it seems that the base idea of more readable syntax for Regular expressions can't really hurt anyone, at least so long as those authoring it are ok if their work is ignored. My initial thought was that "VerboseExpressions" caught the flavor of what I was after, but fortunately after a little initial effort the project moved to the back burner.


@section{Using Racket}
Now that it has come back [for a time at least] into the kitchen, the bigger idea is to take a literate programming approach to the project. Thus, the name "LiterateExpressions," captures both the flavor of the project and my approach to coding it up. This means that in part, LiterateExpressions is an exercise in using Racket's scribble documentation language and exploring it's domain specific subset for literate programming.

@chunk[<LiterateExpressions>
       <LiterateExpressions_requires>
       <LiterateExpressions_provide>
       <LiterateExpression_Modifier_Alias>]

@chunk[<LiterateExpressions_requires>
       (require "Lexp-structures.rkt")
       (require "Lexp-implementation.rkt")
       (require "Perl-Modifiers.rkt")
       (require "Perl-EscapeSequence.rkt")]

@chunk[<LiterateExpressions_provide>
       (provide (all-defined-out))
       (provide 
        (all-from-out  "Lexp-structures.rkt")
        (all-from-out "Lexp-implementation.rkt")
        (all-from-out "Perl-Modifiers.rkt")
        (all-from-out "Perl-EscapeSequence.rkt"))]

@section{LiterateExpression Definitions}

The base symbol definitions for Racket match those of the underlying perl structure. These may be modified again downstream in an application or library.

@chunk[<LiterateExpression_Modifier_Alias>
       (define treatStringAsMultipleLines modifier_m)
       (define treatStringAsSingleLine modifier_s)
       (define caseInsensitive modifier_i)
       (define allowWhiteSpaceAndComments modifier_x)
       (define preserveStringMatched modifier_p)
       (define useGlobalMatching modifier_g)
       (define keepCurrentPostion modifier_c)
       (define asciiSafeMatching modifier_a)
       (define defaultCharacterSetMatching modifier_d)
       (define unicodeCharacterSetMatching modifier_u)
       (define loacaleCharacterSetMatching modifier_l)]
                                      




       
       
       