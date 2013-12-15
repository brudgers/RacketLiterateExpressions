#lang scribble/lp

@section{LiterateExpression Structures}

@code{Lexp-structures.rkt} contains the base structures for building literate experssions.

@subsection{Base DataTypes}

@subsubsection{Racket lexp DataType}
A Literate Expression is expressed as a data structure with two fields.

An @code{lexp} is a structure which contains:
@itemlist[@item{a @code{perl} structure @code{p}.}
      @item{a function @code{f} that returns a string for the Racket @code{regex}.}]
              
@chunk[<lexp_definition>
       (struct lexp (p f))]

The base datatype of @code{struct} deviates from Racket VerbalExpressions which used a simple matching of @code{string} with @code{symbol}. The reason for changing the data-type to @code{struct} is to ultimately facilitate four possible parsing scenarios:

@itemlist[@item{@code{lexp -> perl}}
           @item{@code{lexp -> description}}
           @item{@code{perl -> lexp}}
           @item{@code{perl -> description}}]

@subsubsection{The Racket perl structure}

The purpose of the @code{perl} structure is to provide a neutral data type that can be exported for use in the implementation of LiterateExpressions in other languages - e.g. the @code{perl} structures could be exported as JSON or XML for use by other programmers interested in implementing LiterateExpressions...or VerbalExpressons for that matter.

A @code{perl} is a structure that contains:
@itemlist[@item{A string @code{symb} that provides a consistent name for the Regex token}
      @item{A string @code{perlx} that is the Perl Language Character for the element}
      @item{a string @code{description} that contains the Perl language description.}]
     
@chunk[<perl_definition>
    (define-struct perl (smyb perlx description))]

It is important to recognize that although the Perl Language description may reference features that are not available and that the Regex element may not be available in a particular language - inculding Racket. These are included becuase the wider goal of LiterateExpressions is to provide a platform for implementaiton in other languages, and they may have different features.

@subsection{Lexp Structures Admin}

@chunk[<lexp-structures-provide>
       (provide(all-defined-out))]

@chunk[<*>
       <lexp-structures-provide>
       <lexp_definition>
       <perl_definition>]
